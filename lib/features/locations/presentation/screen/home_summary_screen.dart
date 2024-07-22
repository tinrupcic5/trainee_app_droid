import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

class NotificationItem {
  final String title;
  final String description;

  NotificationItem({required this.title, required this.description});
}

class VideoItem {
  final String url;
  final String thumbnailUrl;

  VideoItem({required this.url, required this.thumbnailUrl});
}

class PictureItem {
  final String url;

  PictureItem({required this.url});
}

class DataService {
  Future<List<NotificationItem>> fetchNotifications() async {
    // Simulate network delay
    await Future.delayed(Duration(seconds: 2));
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
    await Future.delayed(Duration(seconds: 2));
    return [
      VideoItem(
          url:
              'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
          thumbnailUrl: 'https://example.com/thumbnail1.jpg'),
      VideoItem(
          url: 'https://example.com/video2.mp4',
          thumbnailUrl: 'https://example.com/thumbnail2.jpg'),
    ];
  }

  Future<List<PictureItem>> fetchPictures() async {
    // Simulate network delay
    await Future.delayed(Duration(seconds: 2));
    return [
      PictureItem(
          url: 'https://upload.wikimedia.org/wikipedia/en/a/a9/Example.jpg'),
      PictureItem(
          url: 'https://upload.wikimedia.org/wikipedia/en/a/a9/Example.jpg'),
    ];
  }
}

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

class VideoCard extends StatelessWidget {
  final VideoItem video;

  const VideoCard({required this.video, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(video.thumbnailUrl),
          ListTile(
            title: Text('Video'),
            onTap: () {
              // Implement video player navigation
            },
          ),
        ],
      ),
    );
  }
}

class PictureCard extends StatelessWidget {
  final PictureItem picture;

  const PictureCard({required this.picture, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Image.network(picture.url),
    );
  }
}
