import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class FullScreenVideoPlayer extends StatefulWidget {
  final VideoPlayerController controller;

  const FullScreenVideoPlayer({Key? key, required this.controller})
      : super(key: key);

  @override
  _FullScreenVideoPlayerState createState() => _FullScreenVideoPlayerState();
}

class _FullScreenVideoPlayerState extends State<FullScreenVideoPlayer> {
  late bool _isPlaying;
  bool _isMuted = false;
  double _sliderValue = 0.0;

  @override
  void initState() {
    super.initState();
    _isPlaying = widget.controller.value.isPlaying;
    widget.controller.addListener(_listener);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_listener);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent,
    ));
    super.dispose();
  }

  void _listener() {
    if (!mounted) return;

    final isPlaying = widget.controller.value.isPlaying;
    setState(() {
      _isPlaying = isPlaying;
      _sliderValue = widget.controller.value.position.inSeconds.toDouble();
    });
  }

  void _togglePlayPause() {
    setState(() {
      if (widget.controller.value.isPlaying) {
        widget.controller.pause();
      } else {
        widget.controller.play();
      }
    });
  }

  void _toggleMute() {
    setState(() {
      _isMuted = !_isMuted;
      widget.controller.setVolume(_isMuted ? 0.0 : 1.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: GestureDetector(
        onHorizontalDragEnd: (details) {
          if (details.velocity.pixelsPerSecond.dx > 0) {
            // Swipe to the right
            Navigator.pop(context);
          }
        },
        child: Column(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: _togglePlayPause,
                child: Stack(
                  children: [
                    Center(
                      child: AspectRatio(
                        aspectRatio: widget.controller.value.aspectRatio,
                        child: VideoPlayer(widget.controller),
                      ),
                    ),
                    if (!_isPlaying)
                      Center(
                        child: IconButton(
                          icon: const Icon(Icons.play_arrow,
                              size: 50, color: Colors.white),
                          onPressed: _togglePlayPause,
                        ),
                      ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Text(
                    Duration(seconds: _sliderValue.toInt())
                        .toString()
                        .split('.')
                        .first,
                    style: const TextStyle(color: Colors.white),
                  ),
                  Expanded(
                    child: Slider(
                      value: _sliderValue,
                      min: 0,
                      max:
                          widget.controller.value.duration.inSeconds.toDouble(),
                      onChanged: (value) {
                        setState(() {
                          _sliderValue = value;
                        });
                      },
                      onChangeEnd: (value) {
                        widget.controller
                            .seekTo(Duration(seconds: value.toInt()));
                      },
                    ),
                  ),
                  Text(
                    widget.controller.value.duration
                        .toString()
                        .split('.')
                        .first,
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black.withOpacity(0.5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
              onPressed: _togglePlayPause,
            ),
            IconButton(
              icon: Icon(Icons.replay),
              onPressed: () {
                widget.controller.seekTo(Duration.zero);
                widget.controller.play();
                setState(() {
                  _isPlaying = true;
                });
              },
            ),
            IconButton(
              icon: Icon(_isMuted ? Icons.volume_off : Icons.volume_up),
              onPressed: _toggleMute,
            ),
          ],
        ),
      ),
    );
  }
}
