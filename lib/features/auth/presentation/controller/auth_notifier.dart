import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trainee_app/features/auth/data/api/model/user/UserLogin.dart';
import 'package:trainee_app/features/auth/data/api/model/user/UserRegisterRequest.dart';
import 'package:trainee_app/features/auth/domain/service/UserService.dart';
import 'package:trainee_app/features/auth/presentation/controller/state/auth_state.dart';

class AuthNotifier extends Notifier<AuthState> {
  late final UserService _userService;

  @override
  AuthState build() {
    _userService = ref.watch(authUseCasesProvider);
    final currentUser = "FirebaseAuth.instance.currentUser";
    return currentUser == null
        ? const AuthState.unauthenticated(fromSignIn: true)
        : AuthState.authenticated(currentUser);
  }

  Future<void> login(final String email, final String password) async {
    state = const AuthState.loading();
    UserLogin userLogin = UserLogin(userName: email, password: password);
    final result = await _userService.login(userLogin);

    result.fold(
      (error) =>
          state = AuthState.unauthenticated(error: error, fromSignIn: true),
      (user) => state = AuthState.authenticated(user),
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

  Future<void> resetPassword(final String email) async =>
      await _userService.resetPassword(email);
}
