import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);
  customIcon(IconData icon) {
    return IconButton(
      icon: Icon(icon),
      iconSize: 30.0,
      color: Colors.white,
      onPressed: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 0.0,
      floating: true,
     // pinned: true,
      backgroundColor: Colors.black,
      leadingWidth: 100,
      leading:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset("assets/images/yt_logo_dark.png"),
      ),
      actions: [
        customIcon(Icons.cast),
        customIcon(Icons.notifications),
        customIcon(Icons.search),
        CircleAvatar(
          radius: 20,
          backgroundColor: Colors.pinkAccent,
          child: Text(
            "R",
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
