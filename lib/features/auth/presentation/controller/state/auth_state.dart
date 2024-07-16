import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trainee_app/core/error/failure.dart';
import 'package:trainee_app/features/auth/data/api/model/user/User.dart';
import 'package:trainee_app/features/auth/data/api/model/user/userLogin/UserLoginResponse.dart';
import 'package:trainee_app/features/common/MessageBody.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.unauthenticated(
      {Failure? error, required bool fromSignIn}) = _Unauthenticated;
  const factory AuthState.loading() = _Loading;
  const factory AuthState.authenticated(UserLoginResponse user) =
      _Authenticated;
  const factory AuthState.registered(MessageBody messageBody) = _Registered;
}
