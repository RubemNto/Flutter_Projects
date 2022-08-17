import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class Game extends StatefulWidget {
  const Game({Key? key}) : super(key: key);

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  int points = 0;

  addPoints(int value) {
    setState(() {
      points += value;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            repeat: ImageRepeat.repeat,
            image: AssetImage("assets/background/bgBlue.jpg"),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Container(
                margin: EdgeInsets.only(
                  top: height * 0.02,
                  bottom: height * 0.02,
                ),
                padding: EdgeInsets.only(
                  top: height * 0.005,
                  bottom: height * 0.005,
                ),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  ),
                  color: Color.fromARGB(255 ~/ 2, 0, 0, 0),
                ),
                child: Container(
                  margin: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                  child: Text(
                    "Cookie clickers - Flutter",
                    style: TextStyle(
                      color: const Color.fromARGB(100, 255, 255, 255),
                      fontSize: height * 0.03,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255 ~/ 2, 0, 0, 0),
              ),
              width: double.infinity,
              child: Center(
                child: Text(
                  "$points",
                  style: TextStyle(
                    color: const Color.fromARGB(100, 255, 255, 255),
                    fontSize: height * 0.1,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: height * 0.06,
                bottom: height * 0.05,
              ),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                // color: Colors.red,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Color.fromARGB(100, 255, 255, 255),
                      blurRadius: 55,
                      spreadRadius: 25),
                ],
              ),
              height: height * 0.4,
              // color: Colors.red,
              child: Image.asset(
                "assets/cookie/icon.png",
              ),
            ),
            Container(
              width: double.infinity,
              height: height * 0.25,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: width * 0.2,
                    height: height * 0.1,
                    color: Color.fromARGB(255 ~/ 2, 0, 0, 0),
                    child: IconButton(
                      onPressed: () {},
                      icon: Center(
                        child: Icon(
                          LineIcons.pointerHand,
                          size: 30,
                          color: Color.fromARGB(100, 255, 255, 255),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: width * 0.2,
                    height: height * 0.1,
                    color: Color.fromARGB(255 ~/ 2, 0, 0, 0),
                    child: IconButton(
                      onPressed: () {},
                      icon: Center(
                        child: Icon(
                          LineIcons.pointerHand,
                          size: 30,
                          color: Color.fromARGB(100, 255, 255, 255),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: width * 0.2,
                    height: height * 0.1,
                    color: Color.fromARGB(255 ~/ 2, 0, 0, 0),
                    child: IconButton(
                      onPressed: () {},
                      icon: Center(
                        child: Icon(
                          LineIcons.pointerHand,
                          size: 30,
                          color: Color.fromARGB(100, 255, 255, 255),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
