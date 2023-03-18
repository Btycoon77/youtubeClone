import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_clone/json/videos.dart';
import 'package:youtube_clone/ui/chewie.dart';
import 'package:youtube_clone/widgets/customAppBar.dart';
import 'package:youtube_clone/widgets/videolist.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  // late  Videodetails _videodetails;
  final Map<String, IconData> navBar = {
    "Home": Icons.home,
    "Trending": Icons.compare_arrows_rounded,
    "Subscription": Icons.subscriptions_sharp,
    "Library": Icons.library_books_outlined
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black,
          elevation: 0.0,
          currentIndex: selectedIndex,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white24,
          iconSize: 25.0,
          onTap: (int index) {
            setState(() {
              selectedIndex = index;
            });
          },
          items:
              // navBar
              //     .map((text, icon) => MapEntry(
              //         text,
              //         BottomNavigationBarItem(
              //                  label:text
              //             icon: Icon(icon, size: 30, color: Colors.white))))
              //     .values
              //     .toList(),
              [
            BottomNavigationBarItem(
              icon: IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  icon: Icon(Icons.home)),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.compass),
              label: "Trending",
            ),
            //   customizedIconButton(),
            BottomNavigationBarItem(
              icon: Icon(Icons.library_books_outlined),
              label: "library",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.subscriptions_outlined),
              label: "subscriptions",
            ),
          ]),
      backgroundColor: Colors.black.withOpacity(0.7),
      body: SafeArea(
        child: CustomScrollView(
          shrinkWrap: true,
          slivers: [
            CustomAppBar(),
            SliverList(
                delegate: SliverChildBuilderDelegate(
              (context, index) {
                return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ChewieList(
                                videoPlayerController: VideoPlayerController.asset(videos[index]["video_url"]),
                                autoplay:false,
                                looping:false,
                                videoDetails:videos[index],

                              )));
                      // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>VideoDet(
                      //  // videodetails:_videodetails,
                      //   videoUrl:videos[index]["video_url"].toString(),
                      // )));
                    },
                    child: VideoList(videos: videos[index]));
              },
              childCount: videos.length,
            )),
          ],
        ),
      ),
    );
  }

  customizedIconButton() {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 1),
      ),
      child: IconButton(
        onPressed: () {},
        icon: Icon(Icons.add),
        iconSize: 30,
        color: Colors.white,
      ),
    );
  }

}
