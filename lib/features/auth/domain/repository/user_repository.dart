import 'package:dartz/dartz.dart';
import 'package:trainee_app/core/error/failure.dart';
import 'package:trainee_app/features/auth/data/api/model/user/userLogin/UserLoginResponse.dart';
import 'package:trainee_app/features/common/MessageBody.dart';
import 'package:trainee_app/features/common/RefreshTokenRequest.dart';
import 'package:trainee_app/features/common/RefreshTokenResponse.dart';

abstract interface class UserRepository {
  Future<Either<Failure, UserLoginResponse>> loginUser(
      final String email, final String password);

  Future<Either<Failure, MessageBody>> registerUser(
      final String email, final String password);

  Future<Either<Failure, void>> resetPassword(final String email);

  Future<Either<Failure, MessageBody>> logout(String token);

  Future<Either<Failure, RefreshTokenResponse>> refreshToken(
      RefreshTokenRequest refreshTokenRequest);
}
