// lib/drawer_widget.dart

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:trainee_app/core/style/colors.dart';
import 'package:trainee_app/core/style/style_extensions.dart';
import 'package:trainee_app/features/auth/data/api/model/user/userLogin/UserLoginResponse.dart';
import 'package:trainee_app/features/files/domain/profile_image.dart';

class DrawerWidget extends StatelessWidget {
  final UserLoginResponse userLoginResponse;
  final ProfileImage? profileImage;
  final File? selectedImage;
  final Function(int) onScreenSelected;
  final Future<void> Function() onLogout;
  final String appName;
  final String version;

  const DrawerWidget({
    Key? key,
    required this.userLoginResponse,
    this.profileImage,
    this.selectedImage,
    required this.onScreenSelected,
    required this.onLogout,
    required this.appName,
    required this.version,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userDetails = userLoginResponse.userDetails;

    return Drawer(
      child: Column(
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              color: CustomColors.blueCardColor,
            ),
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () {
                      // This could trigger an image picker, for instance
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.blue,
                      backgroundImage: selectedImage != null
                          ? FileImage(selectedImage!)
                          : profileImage != null
                              ? NetworkImage(
                                  profileImage!.uri,
                                  headers: {
                                    'Authorization':
                                        'Bearer ${userLoginResponse.token}',
                                  },
                                ) as ImageProvider
                              : null,
                      radius: 50,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "${userDetails.name} ${userDetails.lastName}",
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight + const Alignment(0, .4),
                  child: Text(
                    userDetails.schoolDetails.schoolLocation,
                    style: const TextStyle(color: Colors.white70),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.theaters_rounded),
            title: Text("Content"),
            onTap: () {
              onScreenSelected(0);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.notification_add),
            title: Text("Notifications"),
            onTap: () {
              onScreenSelected(1);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.group),
            title: Text("Administration"),
            onTap: () {
              onScreenSelected(2);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: Text("Settings"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Spacer(),
          ListTile(
            leading: const Icon(Icons.dark_mode_rounded),
            title: Text("Theme"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout_rounded),
            title: Text("Logout"),
            onTap: () {
              onLogout();
              Navigator.pop(context);
            },
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          appName,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          version,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  width: 20,
                  child: Image.asset(
                    'assets/images/bitroot_logo.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
