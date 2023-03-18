import 'package:flutter/material.dart';

class CommentSection extends StatelessWidget {
  const CommentSection({ Key? key ,required this.videoDetails}) : super(key: key);
  final  videoDetails;

  @override
  Widget build(BuildContext context) {
   return  Scaffold(
        body: Container(
            color: Colors.black,
            child: ListView(
                scrollDirection: Axis.vertical,
                physics: ClampingScrollPhysics(),
                children: List.generate(
                    10,
                    (index) => ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.blue,
                            radius: 15.0,
                            child: Text("R",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.0,
                                )),
                          ),
                          title: Text(
                            "${videoDetails["username"]} ",
                            style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                          subtitle: Text(
                            "Nice,what a cool video!!",
                            style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey),
                          ),
                          isThreeLine: true,
                          trailing: IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: Icon(
                                Icons.more_vert,
                                color: Colors.white,
                                size: 25.0,
                              )),
                        ))),
          ),
        
   );
  }
}