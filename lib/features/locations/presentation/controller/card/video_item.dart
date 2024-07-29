class VideoItem {
  final String url;
  final String contentType;

  VideoItem({required this.url, required this.contentType});

  factory VideoItem.fromJson(Map<String, dynamic> json) {
    return VideoItem(
      url: json['url'],
      contentType: json['contentType'],
    );
  }
}
