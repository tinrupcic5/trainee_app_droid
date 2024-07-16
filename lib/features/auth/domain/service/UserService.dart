import 'package:dartz/dartz.dart';
import 'package:trainee_app/core/error/failure.dart';
import 'package:trainee_app/features/auth/data/api/model/user/UserLogin.dart';
import 'package:trainee_app/features/auth/data/api/model/user/UserRegisterRequest.dart';
import 'package:trainee_app/features/auth/data/api/model/user/userLogin/UserLoginResponse.dart';
import 'package:trainee_app/features/common/MessageBody.dart';

abstract class UserService {
  Future<Either<Failure, UserLoginResponse>> login(UserLogin userLogin);
  Future<Either<Failure, MessageBody>> register(
      UserRegisterRequest userRegisterRequest);

  Future<void> logout(String token);
}
