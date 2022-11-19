import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_markdown/flutter_markdown.dart';

class MarkdownSheetVisualizer extends StatelessWidget {
  const MarkdownSheetVisualizer({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late double windowWidth;
  late double windowHeight;
  late double margin;

  late Future<String> exampleMD;
  late List<Future<String>> styleSheets;
  late int selectedSheet;

  Future<String> loadExample(String filePath) async {
    return await rootBundle.loadString(filePath);
  }

  @override
  void initState() {
    exampleMD = loadExample("ExampleMarkdown/Example.md");

    styleSheets = List.empty(growable: true);
    styleSheets.add(
      loadExample("MarkdownStyleSheets/splendor.css"),
    );
    styleSheets.add(
      loadExample("MarkdownStyleSheets/modest.css"),
    );
    styleSheets.add(
      loadExample("MarkdownStyleSheets/air.css"),
    );
    styleSheets.add(
      loadExample("MarkdownStyleSheets/retro.css"),
    );
    selectedSheet = 0;

    super.initState();
  }

  MarkdownStyleSheet styleSheetFromCSS(String css) {
    MarkdownStyleSheet sheet = MarkdownStyleSheet();
    return sheet;
  }

  @override
  Widget build(BuildContext context) {
    windowWidth = MediaQuery.of(context).size.width;
    windowHeight = MediaQuery.of(context).size.height;
    margin = 20;
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: windowHeight - margin,
              width: windowWidth / 2.0 - margin,
              margin: EdgeInsets.all(margin / 4),
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    blurRadius: 5,
                    spreadRadius: 0.05,
                    blurStyle: BlurStyle.normal,
                  )
                ],
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Container(
                margin: const EdgeInsets.all(10),
                child: FutureBuilder(
                  future: exampleMD,
                  initialData: "Loading",
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Markdown(
                        data: snapshot.data!,
                        selectable: true,
                      );
                    } else {
                      return const Center(
                        child: Text("Loading"),
                      );
                    }
                  },
                ),
              ),
            ),
            Container(
              height: windowHeight - margin,
              width: windowWidth / 2.0 - margin,
              margin: EdgeInsets.all(margin / 4),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 14, 0, 53),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    blurRadius: 5,
                    spreadRadius: 0.05,
                    blurStyle: BlurStyle.normal,
                  )
                ],
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Container(
                margin: const EdgeInsets.all(10),
                child: FutureBuilder(
                  future: styleSheets[selectedSheet],
                  initialData: "Loading",
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView(children: [
                        Text(
                          snapshot.data!,
                          style: TextStyle(
                            color: Color.fromARGB(255, 177, 177, 177),
                          ),
                        )
                      ]);
                    } else {
                      return const Center(
                        child: Text("Loading"),
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
https://github.com/markdowncss
*/
