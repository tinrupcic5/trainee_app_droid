import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trainee_app/core/di.dart';
import 'package:trainee_app/core/route_generator.dart';
import 'package:trainee_app/features/auth/domain/service/UserService.dart';
import 'package:trainee_app/features/auth/presentation/controller/state/logout_state.dart';
import 'package:trainee_app/features/auth/presentation/util/SharedPrefsManager.dart';

class LogoutNotifier extends Notifier<LogoutState> {
  late final UserService _userService;
  late final SharedPrefsManager _sharedPrefsManager;

  LogoutNotifier() {
    print("Loging out");
    _sharedPrefsManager = SharedPrefsManager();
  }

  @override
  LogoutState build() {
    _userService = ref.watch(userServiceProviderWithToken);
    return const LogoutState.loading();
  }

  Future<void> attemptLogingOut(BuildContext context) async {
    state = const LogoutState.loading();
    final token = await _sharedPrefsManager.getUserTokenFromLocalCache();
    final result = await _userService.logout(token);
    result.fold(
      (error) =>
          state = LogoutState.unauthenticated(error: error, fromSignIn: true),
      (messageBody) async {
        state = LogoutState.logout(messageBody);
        await SharedPrefsManager().deleteAllCache();
        WidgetsBinding.instance.addPostFrameCallback(
          (_) => Navigator.of(context)
              .pushReplacementNamed(RouteGenerator.signInScreen),
        );
      },
    );
  }
}
