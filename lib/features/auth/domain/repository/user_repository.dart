import 'package:dartz/dartz.dart';
import 'package:trainee_app/core/error/failure.dart';
import 'package:trainee_app/features/auth/data/api/model/user/userLogin/UserLoginResponse.dart';
import 'package:trainee_app/features/common/MessageBody.dart';

abstract interface class UserRepository {
  Future<Either<Failure, UserLoginResponse>> loginUser(
      final String email, final String password);

  Future<Either<Failure, MessageBody>> registerUser(
      final String email, final String password);

  Future<Either<Failure, void>> resetPassword(final String email);

  Future<Either<Failure, void>> logout(String token);
}
