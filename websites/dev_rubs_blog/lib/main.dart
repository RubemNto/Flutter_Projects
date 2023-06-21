import 'package:dev_rubs_blog/HomeUtils.dart';
import 'package:dev_rubs_blog/PostPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'json/Home.dart';
import 'dart:html' as html;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.jetBrainsMono().fontFamily,
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double width_post = 550;
  final Color dark = HexColor("#423e3b");
  final Color light = HexColor("#ffffff");

  bool darkModeEnabled = false;

  List<Color> GetColors(bool darkModeEnabled) {
    if (darkModeEnabled) {
      return [dark, light];
    }
    return [light, dark];
  }

  @override
  Widget build(BuildContext context) {
    double WIDTH = MediaQuery.of(context).size.width;

    Future<String> homeJson = rootBundle.loadString("assets/posts.json");

    var colors = GetColors(darkModeEnabled);

    return Scaffold(
      backgroundColor: colors[0],
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Container(
            color: Colors.orange,
            height: 5.0,
          ),
        ),
        backgroundColor: colors[0],
        toolbarHeight: 100,
        actions: [
          IconButton(
              onPressed: () {
                html.window.open('mailto:rubemchrist@gmail.com', "_blank");
              },
              hoverColor: Colors.orange,
              icon: Icon(
                FontAwesomeIcons.solidEnvelope,
                color: colors[1],
              )),
          IconButton(
              onPressed: () {
                html.window.open('https://twitter.com/dev_rubs', "_blank");
              },
              hoverColor: Colors.orange,
              icon: Icon(
                FontAwesomeIcons.twitter,
                color: colors[1],
              )),
          IconButton(
              onPressed: () {
                html.window.open(
                    'https://discordapp.com/users/478988584808874005',
                    "_blank");
              },
              hoverColor: Colors.orange,
              icon: Icon(
                FontAwesomeIcons.discord,
                color: colors[1],
              )),
          IconButton(
              onPressed: () {
                setState(() {
                  darkModeEnabled = !darkModeEnabled;
                  colors = GetColors(darkModeEnabled);
                });
              },
              hoverColor: Colors.orange,
              highlightColor: Colors.orange,
              icon: Icon(
                darkModeEnabled == true
                    ? FontAwesomeIcons.solidMoon
                    : FontAwesomeIcons.solidSun,
                color: colors[1],
              )),
        ],
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(bottom: WIDTH < 800 ? 0 : 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: WIDTH < 400 ? 0 : 50,
                    height: WIDTH < 400 ? 0 : 50,
                    margin: EdgeInsets.only(right: 10, bottom: 0),
                    decoration: WIDTH < 400
                        ? null
                        : const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.elliptical(10, 10)),
                            image: DecorationImage(
                              image: AssetImage("assets/me.jpg"),
                              fit: BoxFit.fill,
                            ),
                          ),
                  ),
                  Text("DEV_RUBS",
                      style: TextStyle(
                          color: colors[1],
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          fontSize: WIDTH < 400 ? 25 : 35)),
                ],
              ),
            ),
            Container(
              child: WIDTH < 800
                  ? null
                  : Text(
                      "Software Developer and Coffee lover",
                      style: TextStyle(
                        color: colors[1],
                        fontSize: 18,
                      ),
                    ),
            ),
          ],
        ),
      ),
      body: FutureBuilder(
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasData) {
            Home home = Home.fromRawJson(snapshot.data!);
            return ListView.builder(
                itemCount: home.posts.length,
                itemBuilder: (context, index) {
                  return HomePost(
                    title: home.posts.elementAt(index).title,
                    description: home.posts.elementAt(index).description,
                    likes: home.posts.elementAt(index).likes,
                    views: home.posts.elementAt(index).clicks,
                    primaryColor: colors[0],
                    secondaryColor: colors[1],
                    contentPath: home.posts.elementAt(index).path,
                  );
                });
          } else if (snapshot.hasError) {
            return const Center(
              child: SizedBox(
                width: 60,
                height: 60,
                child: Text("Error"),
              ),
            );
          } else {
            return Text("Loading");
          }
        },
        future: homeJson,
      ),
    );
  }
}
