import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trainee_app/features/locations/presentation/controller/card/notification_card.dart';
import 'package:trainee_app/features/locations/presentation/controller/card/picture_card.dart';
import 'package:trainee_app/features/locations/presentation/controller/card/picture_item.dart';
import 'package:trainee_app/features/locations/presentation/controller/card/video_card.dart';
import 'package:trainee_app/features/locations/presentation/controller/card/video_item.dart';

class HomeSummaryScreen extends ConsumerWidget {
  const HomeSummaryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dataService = DataService();

    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: Future.wait([
            dataService.fetchNotifications(),
            dataService.fetchVideos(),
            dataService.fetchPictures(),
          ]),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data == null) {
              return const Center(child: Text('No data found'));
            }

            final data = snapshot.data as List;
            final notifications = data[0] as List<NotificationItem>;
            final videos = data[1] as List<VideoItem>;
            final pictures = data[2] as List<PictureItem>;

            return ListView(
              children: [
                ...notifications
                    .map((notification) =>
                        NotificationCard(notification: notification))
                    .toList(),
                ...videos.map((video) => VideoCard(video: video)).toList(),
                ...pictures
                    .map((picture) => PictureCard(picture: picture))
                    .toList(),
              ],
            );
          },
        ),
      ),
    );
  }
}

class DataService {
  Future<List<NotificationItem>> fetchNotifications() async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 2));
    return [
      NotificationItem(
          title: 'New Comment',
          description: 'You have a new comment on your post.'),
      NotificationItem(
          title: 'New Friend',
          description: 'John Doe has sent you a friend request.'),
    ];
  }

  Future<List<VideoItem>> fetchVideos() async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 2));
    return [
      VideoItem(
          videoUri: Uri.parse(
              'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4'),
          videoComment: "commondatastorage"),
      VideoItem(
          videoUri: Uri.parse(
              'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4'),
          videoComment: "GITHUB"),
    ];
  }

  Future<List<PictureItem>> fetchPictures() async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 2));
    return [
      PictureItem(
          url: 'https://upload.wikimedia.org/wikipedia/en/a/a9/Example.jpg',
          pictureComment: "wikimedia"),
      PictureItem(
          url: 'https://upload.wikimedia.org/wikipedia/en/a/a9/Example.jpg',
          pictureComment: "Example,ExampleExampleExampleExampleExample"),
    ];
  }
}
