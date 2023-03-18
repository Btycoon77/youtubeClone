import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoDet extends StatefulWidget {
  final String videoUrl;
  const VideoDet({Key? key, required this.videoUrl}) : super(key: key);

  @override
  _VideoDetState createState() => _VideoDetState();
}

class _VideoDetState extends State<VideoDet> {
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    _videoPlayerController = VideoPlayerController.asset(widget.videoUrl.toString());
    _videoPlayerController.initialize().then((value) => setState(() {
          _videoPlayerController.play();
        }));
    _videoPlayerController.setVolume(50);
    super.initState();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AspectRatio(
        aspectRatio: _videoPlayerController.value.aspectRatio,
        child: VideoPlayer(_videoPlayerController)),
    );
  }
}
