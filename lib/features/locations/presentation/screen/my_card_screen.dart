import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trainee_app/features/auth/data/api/model/user/userLogin/UserLoginResponse.dart';
import 'package:trainee_app/features/files/domain/profile_image.dart';
import '../controller/card/my_gym_card.dart';

class MyCardScreen extends ConsumerWidget {
  final UserLoginResponse userLogintoken;
  final ProfileImage profileImage;

  const MyCardScreen(
      {super.key, required this.userLogintoken, required this.profileImage});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: MyGymCard(
          userLogintoken: userLogintoken,
          profileImage: profileImage,
        ),
      ),
    );
  }
}
