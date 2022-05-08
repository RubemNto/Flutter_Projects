import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter/services.dart';
// import 'dart:math' as math;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(MyApp()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Pomodoro Library'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var Images = {
    const AssetImage('assets/banana.jpg'),
    const AssetImage('assets/cannyon.jpg'),
    const AssetImage('assets/city.jpg'),
    const AssetImage('assets/forest.jpg'),
    const AssetImage('assets/snow.jpg'),
  };

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Stack(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: Images.elementAt(2),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.125),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.15,
                    child: Center(
                      child: Text(
                        "Time to focus",
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            color: const Color.fromARGB(255, 255, 255, 255),
                            shadows: const <Shadow>[
                              Shadow(
                                offset: Offset(2.0, 2.0),
                                blurRadius: 3.0,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                            ],
                            fontSize:
                                MediaQuery.of(context).size.aspectRatio * 40),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: Images.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(20, 5, 20, 20),
                          child: Container(
                            width: MediaQuery.of(context).size.height * 0.3,
                            height: MediaQuery.of(context).size.width * 0.3,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Container(
                                  child: Text(
                                    "Title ${index}",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        decoration: TextDecoration.none,
                                        color: const Color.fromARGB(
                                            255, 255, 255, 255),
                                        shadows: const <Shadow>[
                                          Shadow(
                                            offset: Offset(2.0, 2.0),
                                            blurRadius: 3.0,
                                            color: Color.fromARGB(255, 0, 0, 0),
                                          ),
                                        ],
                                        fontSize: MediaQuery.of(context)
                                                .size
                                                .aspectRatio *
                                            35),
                                  ),
                                  margin: EdgeInsets.all(1),
                                ),
                                Container(
                                  margin: EdgeInsets.all(10),
                                  child: Text(
                                    "Description ${index}",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        decoration: TextDecoration.none,
                                        color: const Color.fromARGB(
                                            255, 255, 255, 255),
                                        shadows: const <Shadow>[
                                          Shadow(
                                            offset: Offset(2.0, 2.0),
                                            blurRadius: 3.0,
                                            color: Color.fromARGB(255, 0, 0, 0),
                                          ),
                                        ],
                                        fontSize: MediaQuery.of(context)
                                                .size
                                                .aspectRatio *
                                            25),
                                  ),
                                )
                              ],
                            ),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: Images.elementAt(index),
                                fit: BoxFit.cover,
                              ),
                              boxShadow: const <BoxShadow>[
                                BoxShadow(
                                  color: Colors.black,
                                  offset: Offset(0, 3),
                                  blurRadius: 5,
                                  spreadRadius: 2.5,
                                )
                              ],
                              borderRadius: BorderRadius.circular(25),
                              // color: Color(
                              //         (math.Random().nextDouble() * 0xFFFFFF)
                              //             .toInt())
                              //     .withOpacity(1.0),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.15,
                    child: Center(
                      child: Text(
                        "Pomodoro Time Points\n100",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            color: const Color.fromARGB(255, 255, 255, 255),
                            shadows: const <Shadow>[
                              Shadow(
                                offset: Offset(2.0, 2.0),
                                blurRadius: 3.0,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                            ],
                            fontSize:
                                MediaQuery.of(context).size.aspectRatio * 30),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        AppBar(
          title: Text(
            widget.title,
            style: TextStyle(
                decoration: TextDecoration.none,
                color: const Color.fromARGB(255, 255, 255, 255),
                shadows: const <Shadow>[
                  Shadow(
                    offset: Offset(2.0, 2.0),
                    blurRadius: 3.0,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ],
                fontSize: MediaQuery.of(context).size.aspectRatio * 35),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            IconButton(
              icon: Stack(
                children: const <Widget>[
                  Positioned(
                    right: 2,
                    top: 2,
                    child: Icon(
                      Icons.add_to_photos,
                      color: Colors.black54,
                    ),
                  ),
                  Icon(
                    Icons.add_to_photos,
                    color: Colors.white,
                  ),
                ],
              ),
              tooltip: 'add new pomodoro item',
              onPressed: () {
                // handle the press
              },
            ),
          ],
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: const Color.fromARGB(125, 193, 87, 255),
        ),
      ],
    );
  }
}
