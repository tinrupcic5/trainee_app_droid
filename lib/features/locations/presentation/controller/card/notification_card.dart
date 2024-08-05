import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trainee_app/features/auth/data/api/model/user/userLogin/UserLoginResponse.dart';
import 'package:trainee_app/features/files/domain/file_uri_response.dart';

class NotificationCard extends StatelessWidget {
  final FileUriResponse notification;
  final UserLoginResponse userLogintoken;
  final Color cardColor;
  final Color textColor;

  const NotificationCard({
    required this.notification,
    required this.userLogintoken,
    this.cardColor = Colors.white, // Default color
    this.textColor = Colors.black, // Default color
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final notificationMessage =
        notification.notificationMessage ?? 'No message available';

    return Card(
      margin: const EdgeInsets.all(8.0),
      color: Colors.blue, // Set the card background color
      child: ListTile(
        title: Text(
          notificationMessage,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: textColor, // Set the text color
          ),
        ),
      ),
    );
  }
}
