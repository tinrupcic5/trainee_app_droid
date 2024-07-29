import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trainee_app/core/error/failure.dart';
import 'package:trainee_app/features/common/message_body.dart';

part 'logout_state.freezed.dart';

@freezed
class LogoutState with _$LogoutState {
  const factory LogoutState.unauthenticated(
      {Failure? error, required bool fromSignIn}) = _Unauthenticated;
  const factory LogoutState.loading() = _Loading;
  const factory LogoutState.logout(MessageBody messageBody) = _Authenticated;
}
