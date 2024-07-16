import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:trainee_app/core/error/failure.dart';
import 'package:trainee_app/features/auth/data/api/model/user/User.dart';

abstract interface class UserRepository {
  Future<Either<Failure, User?>> loginUser(
      final String email, final String password);

  Future<Either<Failure, User?>> registerUser(
      final String email, final String password);

  Future<Either<Failure, void>> resetPassword(final String email);

  Future<Either<Failure, void>> logout(BuildContext context, String token);
}
