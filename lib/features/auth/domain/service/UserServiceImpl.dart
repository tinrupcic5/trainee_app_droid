import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:trainee_app/core/error/failure.dart';
import 'package:trainee_app/features/auth/data/api/auth_api.dart';
import 'package:trainee_app/features/auth/data/api/model/user/UserLogin.dart';
import 'package:trainee_app/features/auth/data/api/model/user/UserRegisterRequest.dart';
import 'package:trainee_app/features/auth/data/api/model/user/userLogin/UserLoginResponse.dart';
import 'package:trainee_app/features/auth/domain/service/UserService.dart';
import 'package:trainee_app/features/common/MessageBody.dart';

class UserServiceImpl implements UserService {
  final AuthAPI _authApi;

  const UserServiceImpl(
    this._authApi,
  );

  @override
  Future<Either<Failure, UserLoginResponse>> login(UserLogin userLogin) async {
    try {
      final response = await _authApi.loginUser(userLogin);
      print("response: $response");
      return Right(response);
    } on DioException catch (_) {
      return const Left(Failure.unauthorized());
    }
  }

  @override
  Future<Either<Failure, String>> logout(String token) async {
    try {
      final response = await _authApi.logout(token);
      print("Logout successful");
      return Right(response);
    } on DioException catch (_) {
      return const Left(Failure.unauthorized());
    }
  }

  @override
  Future<Either<Failure, MessageBody>> register(
      UserRegisterRequest userRegisterRequest) {
    throw UnimplementedError();
  }
}
