import 'package:flutter/material.dart';
import 'package:trainee_app/core/error/route_error.dart';
import 'package:trainee_app/features/auth/presentation/screen/sign_in_screen.dart';
import 'package:trainee_app/features/common/presentation/screen/home_screen.dart';
import 'package:trainee_app/features/initialisation/presentation/screen/splash_screen.dart';

class RouteGenerator {
  static const splashScreen = '/';
  static const signInScreen = '/signIn';
  static const signUpScreen = '/signUp';
  static const resetScreen = '/reset';
  static const sightsScreen = '/sights';
  static const settingsScreen = '/settings';
  static const favoritesScreen = '/favorites';
  static const sightDetailsScreen = '/details';

  static const homeScreen = '/home';
  static const calendarDetailsScreen = '/calendar';

  RouteGenerator._();

  static Route<dynamic> generateRoute(final RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case signInScreen:
        return MaterialPageRoute(builder: (_) => const SignInScreen());
      // case signUpScreen:
      //   return MaterialPageRoute(builder: (_) => const SignUpScreen());
      // case resetScreen:
      //   return MaterialPageRoute(builder: (_) => const ResetPasswordScreen());
      case homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      // case sightsScreen:
      //   return MaterialPageRoute(builder: (_) => const SightsScreen());
      // case settingsScreen:
      //   return MaterialPageRoute(builder: (_) => const SettingsScreen());
      // case favoritesScreen:
      //   return MaterialPageRoute(builder: (_) => const FavoritesScreen());
      // case sightDetailsScreen:
      //   return MaterialPageRoute(
      //       builder: (_) => const SightDetailsScreen(), settings: settings);
      default:
        throw const RouteError('Route not defined...');
    }
  }
}
