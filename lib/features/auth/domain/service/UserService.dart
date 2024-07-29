import 'package:dartz/dartz.dart';
import 'package:trainee_app/core/error/failure.dart';
import 'package:trainee_app/features/auth/data/api/model/user/UserLogin.dart';
import 'package:trainee_app/features/auth/data/api/model/user/UserRegisterRequest.dart';
import 'package:trainee_app/features/auth/data/api/model/user/userLogin/UserLoginResponse.dart';
import 'package:trainee_app/features/auth/domain/repository/user_repository.dart';
import 'package:trainee_app/features/common/message_body.dart';

class UserService {
  final UserRepository _userRepository;

  const UserService(this._userRepository);

  Future<Either<Failure, UserLoginResponse>> login(UserLogin userLogin) =>
      _userRepository.loginUser(userLogin.userName, userLogin.password);

  Future<Either<Failure, MessageBody>> register(
          UserRegisterRequest userRegisterRequest) =>
      _userRepository.registerUser(
          userRegisterRequest.userName, userRegisterRequest.password);

  Future<Either<Failure, MessageBody>> logout(String token) {
    return _userRepository.logout(token);
  }
}
