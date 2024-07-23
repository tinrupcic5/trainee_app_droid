import 'package:video_player/video_player.dart';

class VideoManager {
  static final VideoManager _instance = VideoManager._internal();

  factory VideoManager() => _instance;

  VideoManager._internal();

  VideoPlayerController? _currentPlayingController;

  void playVideo(VideoPlayerController newController) {
    if (_currentPlayingController != null &&
        _currentPlayingController != newController) {
      _currentPlayingController?.pause();
    }

    _currentPlayingController = newController;
  }

  void stopVideo() {
    _currentPlayingController?.pause();
    _currentPlayingController = null;
  }

  void notifyFullScreen(VideoPlayerController fullScreenController) {
    if (_currentPlayingController != null &&
        _currentPlayingController != fullScreenController) {
      _currentPlayingController?.pause();
    }
  }
}
