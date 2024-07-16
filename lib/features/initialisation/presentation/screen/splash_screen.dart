import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:trainee_app/core/route_generator.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // _redirectToNextScreen(context);
    return Scaffold(
      body: SafeArea(
        child: Center(
          // Add Center widget to center the Column itself
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(50.0),
                // child:
                //     Image(image: AssetImage('assets/images/camping_image.png')),
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

void _redirectToNextScreen(final BuildContext context) =>
    Future.delayed(const Duration(milliseconds: 1500)).then((_) =>
        "FirebaseAuth.instance.currentUser get current user" != null
            ? Navigator.of(context)
                .pushReplacementNamed(RouteGenerator.homeScreen)
            : Navigator.of(context)
                .pushReplacementNamed(RouteGenerator.signInScreen));
