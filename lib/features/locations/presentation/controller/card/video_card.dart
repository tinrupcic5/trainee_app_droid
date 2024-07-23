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

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(widget.video.videoUri);
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    _controller.addListener(_videoListener);
  }

  void _videoListener() {
    // Ensure widget is still mounted
    if (!mounted) return;

    final isPlaying = _controller.value.isPlaying;
    if (isPlaying != _isPlaying) {
      setState(() {
        _isPlaying = isPlaying;
      });
    }

    setState(() {
      _showRewindButton =
          _controller.value.position >= _controller.value.duration;
    });
  }

  @override
  void dispose() {
    // Ensure controller is properly disposed
    _controller.removeListener(_videoListener);
    _controller.dispose();
    super.dispose();
  }

  void _togglePlayPause() {
    if (!mounted || !_controller.value.isInitialized) return;

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
    if (!mounted || !_controller.value.isInitialized) return;

    setState(() {
      _isMuted = !_isMuted;
      _controller.setVolume(_isMuted ? 0.0 : 1.0);
    });
  }

  void _openFullScreen() async {
    if (!mounted || !_controller.value.isInitialized) return;

    VideoManager().notifyFullScreen(_controller);
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => FullScreenVideoPlayer(controller: _controller),
      ),
    );

    if (mounted) {
      _controller.play();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      elevation: 4.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
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
                          if (_controller.value.isInitialized) {
                            _controller.seekTo(Duration.zero);
                            _controller.play();
                            setState(() {
                              _showRewindButton = false;
                              _isPlaying = true;
                            });
                          }
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.video.videoComment,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
