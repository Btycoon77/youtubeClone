import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_clone/ui/chewie.dart';

class VideoDetailstwo extends StatelessWidget {
  final String? profileImage;
  final String? thumbnailImage;
  final String? viewCount;
  final String? userName;
  final String? title;
  final String? dayago;
  final String? duration;

  VideoDetailstwo(
      {Key? key,
      required this.duration,
      required this.title,
      required this.viewCount,
      required this.dayago,
      required this.profileImage,
      required this.thumbnailImage,
      required this.userName})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              margin: const EdgeInsets.all(8.0),
              width: MediaQuery.of(context).size.width,
              height: 250,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("$thumbnailImage"),
                      fit: BoxFit.cover)),
            ),
            Positioned(
                right: 20.0,
                bottom: 20.0,
                child: Container(
                  height: 15.0,
                  width: 40.0,
                  color: Colors.black,
                  child: Text(
                    "$duration",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                )),
          ],
        ),
        Container(
          child: ListTile(
            leading: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage("$profileImage"), fit: BoxFit.cover),
              ),
            ),
            title: Text(
              "$title",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            subtitle: Row(children: [
              Text(
                "$userName",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 11.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                "$viewCount",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 11.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                "$dayago",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 11.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ]),
            isThreeLine: true,
            trailing: IconButton(
                onPressed: () {},
                icon: Icon(Icons.more_vert),
                iconSize: 20.0,
                color: Colors.grey),
          ),
        ),
      ],
    );
  }
}
