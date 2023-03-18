import 'package:flutter/material.dart';

class VideoList extends StatelessWidget {
  final videos;
  VideoList({Key? key, required this.videos}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.all(8.0),
          width: MediaQuery.of(context).size.width,
          height: 250,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                  image: AssetImage("${videos["thumnail_img"]}"),
                  fit: BoxFit.cover)),
        ),
        Container(
          child: ListTile(
            leading: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
               
                image: DecorationImage(
                    image: AssetImage("${videos["profile_img"]}"),
                    fit: BoxFit.cover),
              ),
            ),
            title: Text(
              "${videos["title"]}",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            subtitle: Row(
              children:[
                  Text(
                  "${videos["username"]}",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 11.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "${videos["view_count"]}",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 11.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "${videos["day_ago"]}",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 11.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ]
            ),
            isThreeLine: true,
            trailing: IconButton(
                onPressed: () {},
                icon: Icon(Icons.more_vert),
                iconSize: 30.0,
                color: Colors.grey),
          ),
        ),
      ],
    );
  }
}
