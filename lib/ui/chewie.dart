import 'dart:math';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_clone/json/videos.dart';
import 'package:youtube_clone/widgets/comments.dart';
import 'package:youtube_clone/widgets/videoDetailstwo.dart';

class ChewieList extends StatefulWidget {
  final VideoPlayerController videoPlayerController;
  final looping;
  final autoplay;
  final videoDetails;
  const ChewieList(
      {Key? key,
      required this.videoDetails,
      required this.autoplay,
      required this.looping,
      required this.videoPlayerController})
      : super(key: key);

  @override
  _ChewieListState createState() => _ChewieListState();
}

class _ChewieListState extends State<ChewieList> {
  late Random random;
  late ChewieController _chewieController;
  Map<String, IconData> _customIcon = {
    "Like": Icons.thumb_up,
    "dislike": Icons.thumb_down,
    "Live chat": Icons.chat_outlined,
    "share": Icons.reply,
    "download": Icons.download,
    "save": Icons.add_box_outlined,
  };
  @override
  void initState() {
    random = Random();
    _chewieController = ChewieController(
        videoPlayerController: widget.videoPlayerController,
        autoInitialize: true,
        autoPlay: widget.autoplay,
        looping: widget.looping,
        aspectRatio: 16 / 9,
        allowMuting: true,
        allowFullScreen: true,
        showOptions: true,
        placeholder: Center(
            child: CircularProgressIndicator(
          color: Colors.white,
        )),
        errorBuilder: (context, errorMessage) => Text(
              "errorMessage",
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      body: ListView(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        children: [
          Chewie(controller: _chewieController),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  "${widget.videoDetails["title"]}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Row(
                  children: [
                    Text(
                      "${widget.videoDetails["username"]}",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(width: 6.0),
                    Text(
                      "${widget.videoDetails["day_ago"]}",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              customIconButton(),
              Divider(
                color: Colors.white,
                thickness: 0.3,
              ),
              ListTile(
                leading: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage(
                              "${widget.videoDetails["profile_img"]}"),
                          fit: BoxFit.cover)),
                ),
                title: Text(
                  "${widget.videoDetails["username"]}",
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
                subtitle: Text(
                  "${widget.videoDetails["subscriber_count"]}  subscribers ",
                  style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey),
                ),
                trailing: Text(
                  "Subscribe".toUpperCase(),
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.red),
                ),
              ),
              Divider(
                color: Colors.white,
                thickness: 0.3,
              ),
              commentSection(),
              Divider(
                color: Colors.white,
                thickness: 0.3,
              ),
              ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  reverse: true,
                  itemCount: home_video_detail.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (context) => ChewieList(
                        //         videoDetails:widget.videoDetails,
                        //         autoplay: false,
                        //         looping: false,
                        //         videoPlayerController:widget.videoPlayerController)));
                      },
                      child: VideoDetailstwo(
                          title: home_video_detail[index]["title"],
                          viewCount: home_video_detail[index]["view_count"],
                          dayago: home_video_detail[index]["day_ago"],
                          profileImage: home_video_detail[index]["profile_img"],
                          thumbnailImage: home_video_detail[index]
                              ["thumnail_img"],
                          duration: home_video_detail[index]["video_duration"],
                          userName: home_video_detail[index]["username"]),
                    );
                  }),
            ],
          ),
        ],
      ),
    );
  }

  GestureDetector commentSection() {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                CommentSection(videoDetails: widget.videoDetails)));
      },
      child: Container(
        height: 55.0,
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Comments",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 14.0,
                        )),
                    SizedBox(height: 8.0),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10.0,
                          ),
                          child: CircleAvatar(
                            backgroundColor: Colors.blue,
                            radius: 15.0,
                            child: Text("R",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.0,
                                )),
                          ),
                        ),
                        SizedBox(width: 5.0),
                        Text("Wow! thats an amazing song",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 11.0,
                            )),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CommentSection(
                              videoDetails: widget.videoDetails)));
                    },
                    icon: Icon(
                      Icons.arrow_drop_down_sharp,
                      color: Colors.white,
                      size: 25.0,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Row customIconButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: _customIcon
          .map((text, icon) => MapEntry(
              text,
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () {},
                        iconSize: 20.0,
                        color: Colors.white,
                        hoverColor: Colors.black,
                        icon: Icon(icon)),
                    Text("$text",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 10.0,
                        )),
                  ],
                ),
              )))
          .values
          .toList(),
    );
  }
}
