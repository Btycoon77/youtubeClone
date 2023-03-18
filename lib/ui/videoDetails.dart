import 'dart:io';
import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:youtube_clone/utilities.dart';

class VideoDetails extends StatefulWidget {
  const VideoDetails({Key? key, required this.videoUrl}) : super(key: key);
  //final Videodetails videodetails;
  final String videoUrl;

  @override
  _VideoDetailsState createState() => _VideoDetailsState();
}

class _VideoDetailsState extends State<VideoDetails> {
  late BetterPlayerController _betterPlayerController;
  GlobalKey _globalKey = GlobalKey();
  @override
  void initState() {
    BetterPlayerConfiguration betterPlayerConfiguration =
        BetterPlayerConfiguration(aspectRatio: 16 / 9, fit: BoxFit.contain);

    _betterPlayerController = BetterPlayerController(betterPlayerConfiguration,
        betterPlayerPlaylistConfiguration: BetterPlayerPlaylistConfiguration(
          initialStartIndex: 0,
          loopVideos: false,
          nextVideoDelay: Duration(milliseconds: 500),
        ));
    _betterPlayerController.setBetterPlayerGlobalKey(_globalKey);
    _setupDataSource();

    super.initState();
  }

  void _setupDataSource() async {
    var filePath = await Utilis.getAssetFile(widget.videoUrl.toString());
    var file = File(filePath);
    List<int> bytes = file.readAsBytesSync().buffer.asUint8List();
    BetterPlayerDataSource dataSource =
        BetterPlayerDataSource.memory(bytes, videoExtension: "mp4");
    _betterPlayerController.setupDataSource(dataSource);
  }

  @override
  void dispose() {
    _betterPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AspectRatio(
        aspectRatio: 16 / 9,
        child: BetterPlayer(
            //key: _globalkey,
            controller: _betterPlayerController),
      ),
    );
  }
}
