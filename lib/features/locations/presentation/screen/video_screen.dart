import 'package:flutter/material.dart';
import 'package:trainee_app/features/locations/presentation/controller/card/FullScreenVideoPlayer.dart';
import 'package:trainee_app/features/locations/presentation/controller/card/video_item.dart';
import 'package:trainee_app/features/locations/presentation/manager/video_manager.dart';
import 'package:video_player/video_player.dart';

class VideoCard extends StatefulWidget {
  final VideoItem video;

  const VideoCard({required this.video, Key? key}) : super(key: key);

  @override
  _VideoCardState createState() => _VideoCardState();
}

class _VideoCardState extends State<VideoCard> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  bool _isPlaying = false;
  bool _showRewindButton = false;
  bool _isMuted = false;
  late ScrollController _scrollController;
  bool _isVisible = true;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(widget.video.videoUri);
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    _controller.addListener(_videoListener);

    // Initialize ScrollController
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      _checkVisibility();
    });
  }

  void _checkVisibility() {
    final double offset = _scrollController.offset;

    if (_scrollController.hasClients) {
      final double viewportHeight =
          _scrollController.position.viewportDimension;
      final double itemHeight = context.size!.height;

      if (_scrollController.offset > itemHeight ||
          _scrollController.offset < (offset - viewportHeight)) {
        setState(() {
          if (_isPlaying) {
            _controller.pause();
            _isPlaying = false;
          }
          _isVisible = false;
        });
      } else {
        setState(() {
          _isVisible = true;
        });
      }
    }
  }

  void _videoListener() {
    if (_controller.value.isPlaying) {
      setState(() {
        _isPlaying = true;
        _showRewindButton =
            _controller.value.position >= _controller.value.duration;
      });
    } else {
      setState(() {
        _isPlaying = false;
        _showRewindButton = false;
      });
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_videoListener);
    _controller.dispose();
    _scrollController.dispose(); // Dispose ScrollController
    super.dispose();
  }

  void _togglePlayPause() {
    setState(() {
      if (_controller.value.isPlaying) {
        _controller.pause();
        VideoManager().stopVideo(); // Stop the current video
      } else {
        VideoManager().playVideo(_controller); // Play the new video
        _controller.play();
      }
    });
  }

  void _toggleMute() {
    setState(() {
      _isMuted = !_isMuted;
      _controller.setVolume(_isMuted ? 0.0 : 1.0);
    });
  }

  void _openFullScreen() {
    VideoManager().notifyFullScreen(
        _controller); // Notify the manager to pause other videos
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => FullScreenVideoPlayer(controller: _controller),
      ),
    );
    _controller.play();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: _isVisible,
      child: Card(
        margin: const EdgeInsets.all(8.0),
        elevation: 4.0,
        child: GestureDetector(
          onTap: _togglePlayPause,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              FutureBuilder(
                future: _initializeVideoPlayerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      ),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
              if (!_isPlaying && !_showRewindButton)
                Positioned(
                  top: 0,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: IconButton(
                      icon: const Icon(Icons.play_arrow, size: 50),
                      onPressed: _togglePlayPause,
                    ),
                  ),
                ),
              if (_showRewindButton)
                Positioned(
                  top: 0,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: IconButton(
                      icon: const Icon(Icons.replay, size: 50),
                      onPressed: () {
                        _controller.seekTo(Duration.zero);
                        _controller.play();
                        setState(() {
                          _showRewindButton = false;
                          _isPlaying = true;
                        });
                      },
                    ),
                  ),
                ),
              Positioned(
                bottom: 16,
                left: 16,
                child: IconButton(
                  icon: Icon(_isMuted ? Icons.volume_off : Icons.volume_up),
                  onPressed: _toggleMute,
                ),
              ),
              Positioned(
                bottom: 16,
                right: 16,
                child: IconButton(
                  icon: Icon(Icons.fullscreen, size: 30),
                  onPressed: _openFullScreen,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
