import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trainee_app/core/di.dart';
import 'package:trainee_app/features/auth/data/api/model/user/userLogin/UserLoginResponse.dart';
import 'package:trainee_app/features/locations/presentation/controller/card/notification_card.dart';
import 'package:trainee_app/features/locations/presentation/controller/card/picture_card.dart';
import 'package:trainee_app/features/locations/presentation/controller/card/video_card.dart';

class HomeSummaryScreen extends ConsumerStatefulWidget {
  final UserLoginResponse userLogintoken;

  const HomeSummaryScreen({super.key, required this.userLogintoken});

  @override
  ConsumerState<HomeSummaryScreen> createState() => _HomeSummaryScreenState();
}

class _HomeSummaryScreenState extends ConsumerState<HomeSummaryScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => _fetchFilesAndNotifications());
  }

  Future<void> _fetchFilesAndNotifications() async {
    final notifier = ref.read(fileTransferNotifierProvider.notifier);
    final userId = widget.userLogintoken.userDetails.user.id;
    if (userId != null) {
      await notifier.getAllFilesAndNotifications(userId);
    } else {
      print('Error: User ID is null');
    }
  }

  @override
  Widget build(BuildContext context) {
    final filesState = ref.watch(fileTransferNotifierProvider);
    final profileImageState = ref.watch(profileImageNotifierProvider);

    final notifications = filesState.notifications ?? [];
    final sortedNotifications = notifications.toList()
      ..sort((a, b) => b.createdAt.compareTo(a.createdAt));

    return Scaffold(
      body: SafeArea(
        child: filesState.isLoading
            ? const Center(child: CircularProgressIndicator())
            : filesState.errorMessage != null
                ? Center(child: Text('Error: ${filesState.errorMessage}'))
                : sortedNotifications.isEmpty
                    ? const Center(child: Text('No notifications available'))
                    : ListView.builder(
                        itemCount: sortedNotifications.length,
                        itemBuilder: (context, index) {
                          final notification = sortedNotifications[index];
                          switch (notification.type) {
                            case 'NOTIFICATION':
                              return NotificationCard(
                                  notification: notification,
                                  userLogintoken: widget.userLogintoken);
                            case 'VIDEO':
                              return VideoCard(
                                  video: notification,
                                  userLogintoken: widget.userLogintoken);
                            case 'IMAGE':
                              return PictureCard(
                                  picture: notification,
                                  userLogintoken: widget.userLogintoken);
                            default:
                              return const SizedBox.shrink();
                          }
                        },
                      ),
      ),
    );
  }
}
