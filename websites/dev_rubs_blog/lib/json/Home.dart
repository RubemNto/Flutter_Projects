// To parse this JSON data, do
//
//     final home = homeFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class Home {
  List<Post> posts;

  Home({
    required this.posts,
  });

  factory Home.fromRawJson(String str) => Home.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Home.fromJson(Map<String, dynamic> json) => Home(
        posts: List<Post>.from(json["posts"].map((x) => Post.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "posts": List<dynamic>.from(posts.map((x) => x.toJson())),
      };
}

class Post {
  String title;
  String description;
  int type;
  int likes;
  int clicks;
  String path;

  Post({
    required this.title,
    required this.description,
    required this.type,
    required this.likes,
    required this.clicks,
    required this.path,
  });

  factory Post.fromRawJson(String str) => Post.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        title: json["title"],
        description: json["description"],
        type: json["type"],
        likes: json["likes"],
        clicks: json["clicks"],
        path: json["path"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "type": type,
        "likes": likes,
        "clicks": clicks,
        "path": path,
      };
}
