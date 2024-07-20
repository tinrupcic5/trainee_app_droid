import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:trainee_app/core/error/failure.dart';
import 'package:trainee_app/features/auth/data/api/auth_api.dart';
import 'package:trainee_app/features/auth/data/api/model/user/UserLogin.dart';
import 'package:trainee_app/features/auth/data/api/model/user/userLogin/UserLoginResponse.dart';
import 'package:trainee_app/features/auth/domain/repository/user_repository.dart';
import 'package:trainee_app/features/common/MessageBody.dart';

class UserRepositoryImpl implements UserRepository {
  final AuthAPI _authApi;

  const UserRepositoryImpl(
    this._authApi,
  );

  @override
  Future<Either<Failure, UserLoginResponse>> loginUser(
      String username, String password) async {
    try {
      final response = await _authApi
          .loginUser(UserLogin(userName: username, password: password));
      return Right(response);
    } on DioException catch (_) {
      print("response _authApi :  $_authApi");
      return const Left(Failure.unauthorized());
    }
  }

  @override
  Future<Either<Failure, MessageBody>> logout(String token) async {
    try {
      print("1: $token");
      final response = await _authApi.logout(token);
      print("Logout successful");
      return Right(response);
    } on DioException catch (_) {
      return const Left(Failure.unauthorized());
    }
  }

  @override
  Future<Either<Failure, MessageBody>> registerUser(
      String email, String password) {
    // TODO: implement registerUser
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> resetPassword(String email) {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }
}
