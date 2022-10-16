import 'package:dev_rubs/terminal.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'dev_rubs',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        fontFamily: GoogleFonts.jetBrainsMono().fontFamily,
      ),
      home: HomePage(
        commands: [
          'help',
          'welcome',
          'who-am-i',
          'past-projects',
          'past-projects FLUTTER',
          'past-projects GAMES',
          'past-projects ENGINE',
          'past-projects WEB',
          'contact-info',
          'social-media',
          'social-media FACEBOOK',
          'social-media INSTAGRAM',
          'social-media TWITTER',
          'social-media LINKEDIN',
          'social-media GITHUB',
          'clear'
        ],
        commandColors: [
          Colors.grey,
          Colors.greenAccent,
          Colors.redAccent,
        ],
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage(
      {required this.commands, required this.commandColors, super.key});

  final List<String> commands;
  final List<Color> commandColors;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double width = 800;
  double height = 600;

  bool isMobile = false;

  @override
  Widget build(BuildContext context) {
    setState(() {
      if (MediaQuery.of(context).size.width < 800) {
        width = MediaQuery.of(context).size.width * 0.8;
      } else {
        width = 800;
      }

      if (MediaQuery.of(context).size.height < 850) {
        height = MediaQuery.of(context).size.height * 0.6;
      } else {
        height = 600;
      }

      if (width != 800 || height != 600) {
        isMobile = true;
      } else {
        isMobile = false;
      }
    });

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: const Color.fromARGB(255, 50, 50, 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(60),
              child: Text(
                "dev_rubs interactive\nterminal",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: widget.commandColors.elementAt(0),
                ),
              ),
            ),
            Center(
              child: Terminal(
                width: width,
                height: height,
                backgroundColor: const Color.fromARGB(255, 40, 40, 40),
                username: "guest",
                commands: widget.commands,
                terminalCommandColors: widget.commandColors,
                isMobile: isMobile,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//#282828