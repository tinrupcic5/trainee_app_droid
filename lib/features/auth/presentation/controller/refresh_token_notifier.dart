import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trainee_app/core/di.dart';
import 'package:trainee_app/features/auth/domain/service/UserService.dart';
import 'package:trainee_app/features/auth/presentation/controller/state/refresh_token_state.dart';
import 'package:trainee_app/features/auth/presentation/util/SharedPrefsManager.dart';
import 'package:trainee_app/features/common/RefreshTokenRequest.dart';

class RefreshTokenNotifier extends Notifier<RefreshTokenState> {
  late final UserService _userService;

  RefreshTokenNotifier() {
    print("refresh Token");
    // refreshToken();
  }

  @override
  RefreshTokenState build() {
    _userService = ref.watch(userServiceProvider);
    return const RefreshTokenState.loading();
  }

  // Future<void> refreshToken() async {
  //   final result = await _userService.refreshToken(RefreshTokenRequest(
  //       refreshToken:
  //           await SharedPrefsManager().getUserRefreshTokenFromLocalCache()));
  //   result.fold(
  //     (error) => state =
  //         RefreshTokenState.unauthenticated(error: error, fromSignIn: true),
  //     (userLoginResponse) async {
  //       state = RefreshTokenState.authenticated(userLoginResponse);
  //       print("new token and new refresh token");
  //       await SharedPrefsManager()
  //           .saveUserTokenToLocalCache(userLoginResponse.accessToken);
  //       await SharedPrefsManager()
  //           .saveUserRefreshTokenToLocalCache(userLoginResponse.refreshToken);
  //     },
  //   );
  // }
}
