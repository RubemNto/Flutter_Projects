import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:hexcolor/hexcolor.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Book Me'),
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
  late double BOOK_COVER_X;
  late double BOOK_COVER_Y;
  var covers = {
    'https://images-na.ssl-images-amazon.com/images/I/5112YFsXIJL.jpg',
    'https://www.porchlightbooks.com/globalassets/book-covers/9781647983925.jpg?w=1000&scale=both&mode=crop&u=637424626523630000',
    'https://4.bp.blogspot.com/-pET8qAj1cys/W4W9tYjdQII/AAAAAAAABcM/myuRNjN2o4IiSMMaq0na5tiTYrDjC5jkwCLcBGAs/s1600/Capa%2Ba%2Bsutil.jpg',
    'https://kbimages1-a.akamaihd.net/0533332f-c90f-4c14-a225-e1568203af13/1200/1200/False/lightning-thief-the-percy-jackson-and-the-olympians-book-1.jpg',
    'https://m.media-amazon.com/images/I/71Q1Iu4suSL._AC_SL1000_.jpg',
  };

  @override
  Widget build(BuildContext context) {
    BOOK_COVER_X = MediaQuery.of(context).size.width / 2.5;
    BOOK_COVER_Y = MediaQuery.of(context).size.height / 2.5;

    return Scaffold(
      backgroundColor: HexColor("4F5D75"),
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.1,
        title: Text(widget.title),
        backgroundColor: HexColor("2D1342"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            tooltip: 'Search for book',
            onPressed: () {
              // handle the press
            },
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            tooltip: 'Open shopping cart',
            onPressed: () {
              // handle the press
            },
          ),
        ],
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        reverse: false,
        physics: const NeverScrollableScrollPhysics(),
        children: <Widget>[
          Container(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 5),
            child: const Text(
              "Best of the week",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: BOOK_COVER_Y,
            child: ListView.builder(
              cacheExtent: 2,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: covers.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(10),
                  width: BOOK_COVER_X,
                  child: Image.network(
                    covers.elementAt(index),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: BOOK_COVER_Y,
            child: ListView.builder(
              cacheExtent: 2,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: covers.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 2.8,
                    color: Colors.red,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Container(
                            color: Colors.blue,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Container(
                                    width: BOOK_COVER_X * 0.75,
                                    height: BOOK_COVER_Y * 0.75,
                                    child: Image.network(
                                      covers.elementAt(index),
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Text("Book Title"),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
