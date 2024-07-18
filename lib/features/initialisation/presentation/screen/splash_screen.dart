import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:trainee_app/core/route_generator.dart';
import 'package:trainee_app/features/auth/data/api/model/user/UserLogin.dart';
import 'package:trainee_app/features/auth/presentation/util/SharedPrefsManager.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    _redirectToNextScreen(context);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(50.0),
              ),
              Lottie.asset('assets/animations/loading_disappearing_dots.json',
                  height: 100),
            ],
          ),
        ),
      ),
    );
  }
}

void _redirectToNextScreen(final BuildContext context) async {
  await Future.delayed(const Duration(milliseconds: 1500));
  final user = await getUser();
  if (user.userName.isNotEmpty && user.password.isNotEmpty) {
    print("homeScreen");
    Navigator.of(context).pushReplacementNamed(RouteGenerator.homeScreen);
  } else {
    print("signInScreen");
    Navigator.of(context).pushReplacementNamed(RouteGenerator.signInScreen);
  }
}

Future<UserLogin> getUser() async {
  final currentUser = await SharedPrefsManager().getUserLoginFromLocalCache();
  print("currentUser : ${currentUser.userName}");
  if (currentUser.userName.isNotEmpty && currentUser.password.isNotEmpty) {
    return UserLogin(
        userName: currentUser.userName, password: currentUser.password);
  } else {
    return UserLogin(userName: "", password: "");
  }
}
