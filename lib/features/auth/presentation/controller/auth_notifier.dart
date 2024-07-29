import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trainee_app/core/di.dart';
import 'package:trainee_app/features/auth/data/api/model/user/UserLogin.dart';
import 'package:trainee_app/features/auth/data/api/model/user/UserRegisterRequest.dart';
import 'package:trainee_app/features/auth/domain/service/UserService.dart';
import 'package:trainee_app/features/auth/presentation/controller/state/auth_state.dart';
import 'package:trainee_app/features/auth/presentation/util/SharedPrefsManager.dart';

class AuthNotifier extends Notifier<AuthState> {
  late final UserService _userService;
  late final SharedPrefsManager _sharedPrefsManager;

  AuthNotifier() {
    _sharedPrefsManager = SharedPrefsManager();
    _attemptAutoLogin();
  }

  @override
  AuthState build() {
    _userService = ref.watch(userServiceProvider);
    return const AuthState.loading();
  }

  Future<void> _attemptAutoLogin() async {
    final currentUser = await _sharedPrefsManager.getUserLoginFromLocalCache();
    if (currentUser.userName.isNotEmpty && currentUser.password.isNotEmpty) {
      print("currentUser: $currentUser");
      print("_attempt AutoLogin");

      await login(currentUser.userName, currentUser.password);
    } else {
      return;
      // state = const AuthState.unauthenticated(fromSignIn: true);
    }
  }

  Future<void> login(final String userName, final String password) async {
    state = const AuthState.loading();
    UserLogin userLogin = UserLogin(userName: userName, password: password);
    final result = await _userService.login(userLogin);
    result.fold(
      (error) =>
          state = AuthState.unauthenticated(error: error, fromSignIn: true),
      (userLoginResponse) async {
        state = AuthState.authenticated(userLoginResponse);
        await SharedPrefsManager()
            .saveUserLoginToLocalCache(userLogin.userName, userLogin.password);
        await SharedPrefsManager()
            .saveUserDetailsToLocalCache(userLoginResponse.userDetails);
        await SharedPrefsManager()
            .saveUserTokenToLocalCache(userLoginResponse.token);
        await SharedPrefsManager()
            .saveUserRefreshTokenToLocalCache(userLoginResponse.refreshToken);
        await SharedPrefsManager()
            .saveQrCodeToLocalCache(userLoginResponse.qrData!);
      },
    );
  }

  Future<void> register(final UserRegisterRequest userRegisterRequest) async {
    state = const AuthState.loading();
    final result = await _userService.register(userRegisterRequest);

    result.fold(
      (error) =>
          state = AuthState.unauthenticated(error: error, fromSignIn: false),
      (message) => state = AuthState.registered(message),
    );
  }

  // Future<void> resetPassword(final String email) async =>
  //     await _userService.resetPassword(email);
}
