import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NotificationCard extends StatelessWidget {
  final NotificationItem notification;

  const NotificationCard({required this.notification, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(notification.title,
            style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(notification.description),
      ),
    );
  }
}

class NotificationItem {
  final String title;
  final String description;

  NotificationItem({required this.title, required this.description});
}
