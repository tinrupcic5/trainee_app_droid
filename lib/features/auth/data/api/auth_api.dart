import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:trainee_app/core/error/failure.dart';
import 'package:trainee_app/features/auth/data/api/model/user/UserLogin.dart';
import 'package:trainee_app/features/auth/data/api/model/user/UserRegisterRequest.dart';
import 'package:trainee_app/features/auth/data/api/model/user/userLogin/UserLoginResponse.dart';
import 'package:trainee_app/features/auth/presentation/util/AppStrings.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_api.g.dart';

@RestApi(baseUrl: AppStrings.url)
abstract class AuthAPI {
  factory AuthAPI(Dio dio, {String baseUrl}) = _AuthAPI;

  @POST('/user/login')
  Future<UserLoginResponse> loginUser(UserLogin userLogin);

  @POST('')
  Future<UserLoginResponse> registerUser(
      UserRegisterRequest userRegisterRequest);

  @GET('/user/logout')
  Future<String> logout(
      String authorizationHeader); // authorizationHeader = token
}
