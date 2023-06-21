import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';

class PostHome extends StatelessWidget {
  const PostHome({super.key, required this.title, required this.contentPath});
  final String title;
  final String contentPath;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.jetBrainsMono().fontFamily,
        useMaterial3: true,
      ),
      home: PostPage(contentPath: contentPath),
    );
  }
}

class PostPage extends StatefulWidget {
  const PostPage({super.key, required this.contentPath});

  final String contentPath;
  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  Widget build(BuildContext context) {
    Future<String> content = rootBundle.loadString(widget.contentPath);
    var WIDTH = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Center(
            child: Container(
                width: WIDTH < 800 ? WIDTH : WIDTH * 0.65,
                child: FutureBuilder(
                  future: content,
                  builder: ((context, AsyncSnapshot<String> snapshot) {
                    if (snapshot.hasData) {
                      return Markdown(
                        data: snapshot.data!,
                        imageBuilder: (uri, title, alt) {
                          return SizedBox(
                            height: 20,
                            child: Image.asset(uri.path),
                          );
                        },
                      );
                    } else {
                      return Text("Error");
                    }
                  }),
                ))));
  }
}
