// To parse this JSON data, do
//
//     final Videos = VideosFromJson(jsonString);

import 'dart:convert';

List<Videos> VideosFromJson(String str) => List<Videos>.from(json.decode(str).map((x) => Videos.fromJson(x)));

String VideosToJson(List<Videos> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Videos {
    Videos({
        this.id,
        this.thumnailImg,
        this.profileImg,
        this.username,
        this.title,
        this.viewCount,
        this.dayAgo,
        this.subscriberCount,
        this.likeCount,
        this.unlikeCount,
        this.videoUrl,
    });

    int? id;
    String? thumnailImg;
    String? profileImg;
    String? username;
    String? title;
    String? viewCount;
    String? dayAgo;
    String? subscriberCount;
    String? likeCount;
    String? unlikeCount;
    String ?videoUrl;

    factory Videos.fromJson(Map<String, dynamic> json) => Videos(
        id: json["id"] == null ? null : json["id"],
        thumnailImg: json["thumnail_img"] == null ? null : json["thumnail_img"],
        profileImg: json["profile_img"] == null ? null : json["profile_img"],
        username: json["username"] == null ? null : json["username"],
        title: json["title"] == null ? null : json["title"],
        viewCount: json["view_count"] == null ? null : json["view_count"],
        dayAgo: json["day_ago"] == null ? null : json["day_ago"],
        subscriberCount: json["subscriber_count"] == null ? null : json["subscriber_count"],
        likeCount: json["like_count"] == null ? null : json["like_count"],
        unlikeCount: json["unlike_count"] == null ? null : json["unlike_count"],
        videoUrl: json["video_url"] == null ? null : json["video_url"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "thumnail_img": thumnailImg == null ? null : thumnailImg,
        "profile_img": profileImg == null ? null : profileImg,
        "username": username == null ? null : username,
        "title": title == null ? null : title,
        "view_count": viewCount == null ? null : viewCount,
        "day_ago": dayAgo == null ? null : dayAgo,
        "subscriber_count": subscriberCount == null ? null : subscriberCount,
        "like_count": likeCount == null ? null : likeCount,
        "unlike_count": unlikeCount == null ? null : unlikeCount,
        "video_url": videoUrl == null ? null : videoUrl,
    };
}
