import 'dart:io';
import 'package:dio/dio.dart';
import 'package:trainee_app/features/auth/presentation/util/AppStrings.dart';
import 'package:trainee_app/features/auth/presentation/util/SharedPrefsManager.dart';

class TokenInterceptor extends Interceptor {
  final SharedPrefsManager _prefsManager = SharedPrefsManager();
  final Dio _dio = Dio(BaseOptions(baseUrl: AppStrings.baseUrl));

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    try {
      print("Requesting for token");
      final token = await _prefsManager.getUserTokenFromLocalCache();
      options.headers['Authorization'] = 'Bearer $token';
    } catch (e) {
      print('Error fetching token from cache: $e');
    }
    super.onRequest(options, handler);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    print("error: ${err.response}");
    if (err.response?.statusCode == 401) {
      print("Requesting for Refresh token");
      try {
        final refreshToken =
            await _prefsManager.getUserRefreshTokenFromLocalCache();

        print('Attempting to refresh token with: $refreshToken');

        final response = await _dio.post(
          AppStrings.refreshTokenUrl,
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              HttpHeaders.authorizationHeader: 'Bearer $refreshToken'
            },
          ),
          data: {'refreshToken': refreshToken},
        );
        if (response.statusCode == 200) {
          final newAccessToken = response.data['accessToken'];
          final newRefreshToken = response.data['refreshToken'];

          if (newAccessToken != null && newRefreshToken != null) {
            await _prefsManager.saveUserTokenToLocalCache(newAccessToken);
            await _prefsManager
                .saveUserRefreshTokenToLocalCache(newRefreshToken);

            final newRequestOptions = err.requestOptions.copyWith(
              headers: {'Authorization': 'Bearer $newAccessToken'},
            );

            final retryResponse = await _dio.request(
              newRequestOptions.uri.toString(),
              options: Options(
                method: newRequestOptions.method,
                headers: newRequestOptions.headers,
              ),
              data: newRequestOptions.data,
              queryParameters: newRequestOptions.queryParameters,
            );

            return handler.resolve(retryResponse);
          } else {
            print('Failed to get new tokens from refresh response');
          }
        } else {
          print(
              'Token refresh request failed with status code: ${response.statusCode}');
        }
      } catch (e) {
        print('Error during token refresh: ${e.toString()}');
        await _prefsManager.deleteUserRefreshTokenFromLocalCache();
        await _prefsManager.deleteUserTokenFromLocalCache();
      }
    }
    super.onError(err, handler);
  }
}

Dio createDioWithTokenInterceptor() {
  final dio = Dio(BaseOptions(baseUrl: AppStrings.baseUrl));
  dio.interceptors.add(TokenInterceptor());
  return dio;
}

Dio createDioWithoutTokenInterceptor() {
  return Dio();
}
