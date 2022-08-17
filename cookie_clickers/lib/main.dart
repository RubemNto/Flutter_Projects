import 'package:cookie_clickers/game.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cookie Clickers Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "YoutubeStar",
      ),
      home: const Game(),
    );
  }
}
