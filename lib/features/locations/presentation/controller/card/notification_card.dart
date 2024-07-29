import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trainee_app/features/auth/data/api/model/user/userLogin/UserLoginResponse.dart';
import 'package:trainee_app/features/files/domain/file_uri_response.dart';

class NotificationCard extends StatelessWidget {
  final FileUriResponse notification;
  final UserLoginResponse userLogintoken;

  const NotificationCard({
    required this.notification,
    required this.userLogintoken,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final notificationMessage =
        notification.notificationMessage ?? 'No message available';

    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(
          notificationMessage,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
