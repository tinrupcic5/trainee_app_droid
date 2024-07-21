import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trainee_app/core/error/failure.dart';
import 'package:trainee_app/features/common/RefreshTokenResponse.dart';

part 'refresh_token_state.freezed.dart';

@freezed
class RefreshTokenState with _$RefreshTokenState {
  const factory RefreshTokenState.unauthenticated(
      {Failure? error, required bool fromSignIn}) = _Unauthenticated;
  const factory RefreshTokenState.loading() = _Loading;
  const factory RefreshTokenState.authenticated(
      RefreshTokenResponse refreshTokenResponse) = _Authenticated;
}
