import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:js' as js;

class Terminal extends StatefulWidget {
  Terminal(
      {required this.width,
      required this.height,
      required this.backgroundColor,
      required this.username,
      required this.commands,
      required this.terminalCommandColors,
      required this.isMobile,
      super.key});

  final double width;
  final double height;
  final Color backgroundColor;
  final String username;
  final List<String> commands;
  final List<Color> terminalCommandColors;
  final bool isMobile;
  TextEditingController controller = TextEditingController();

  @override
  State<Terminal> createState() => _TerminalState();
}

class _TerminalState extends State<Terminal> {
  late TextStyle commandStyle;
  Future<SizedBox>? output;

  TextStyle commandChecker(
      List<String> commands, List<Color> terminalCommandColors, String input) {
    Color returnColor = terminalCommandColors.elementAt(2);
    for (var i = 0; i < commands.length; i++) {
      if (commands.elementAt(i) == input) {
        returnColor = terminalCommandColors.elementAt(1);
        break;
      }
    }
    return TextStyle(color: returnColor);
  }

  Future<String> GetOutputValue(String command) async {
    String output = "";

    switch (command) {
      case "help":
        output =
            "Available commands:\n - help\n - welcome\n - who-am-i\n - past-projects\n - contact-info\n - social-media\n - clear";
        break;
      case "welcome":
        output =
            "Welcome to dev_rubs' interactive terminal window. A simple one-line terminal window with the single purpose of making the experience of knowing me, dev_rubs, a little more interesting.";
        break;
      case "who-am-i":
        output =
            "dev_rubs:\n\nMobile and Web developer by day, game engine and tool developer by night.\nHi, I'm Rubem, a.k.a. dev_rubs. A Video Game developer engineer graduate from IPCA, Portugal, and a self-taught mobile and web developer.\nI'm currently living in the land of the 'Pasteis de nata' and 'Francesinhas' working as a freelance Flutter developer and, during extra hours, as a Game Engine and tools developer for my own engine called Blade GDK. I also own my own YouTube channel where I document the experience of developing an engine and the ups and downs of doing so.\nIf you found this website, most likely that you already knew most of these if not all of that.\nAnd if you already knew that, you probably know that I'm a very social guy too, and that I like to make new friends.\nSo, consider this your invitation to have a coffee with me anytime you visit Portugal. My treat.";
        break;
      case "past-projects":
        output =
            "Flutter: type 'past-projects FLUTTER' to view full projects page\n\nBMI Calculator\nCookie Clickers Clone\nTinder Card Widget\n...\n\nWeb: type 'past-projects WEB' to view full projects page\n\nPortofolio page 1\nPortofolio page 2\nPortofolio page 3\n\nGames: type 'past-projects GAMES' to view full projects page\n\nSpace Glider\nSpike Evade\nJump Up Web\n...\n\nEngine: type 'past-projects ENGINE' to view full project page\n\nBlade GDK\n\n";
        break;
      case "past-projects FLUTTER":
        js.context.callMethod(
            'open', ['https://github.com/RubemNto/Flutter_Projects']);
        break;
      case "past-projects GAMES":
        js.context.callMethod('open', ['https://dev-rubs.itch.io/']);
        break;
      case "past-projects ENGINE":
        js.context.callMethod('open', ['https://github.com/RubemNto/BladeGDK']);
        break;
      case "past-projects WEB":
        js.context.callMethod(
            'open', ['https://github.com/RubemNto/Personal-Websites']);
        break;
      case "contact-info":
        output =
            "Contat Information:\n\n - WhatsApp / Phone(PT):\n    +351 91113-4066\n\n - Email:\n    rubemchrist@gmail.com";
        break;
      case "social-media":
        output =
            "Social Media Pages:\n\n - Facebook: type 'social-media FACEBOOK' to access facebook page\n\n - Instagram: type 'social-media INSTAGRAM' to access Instagram page\n\n - LinkedIn: type 'social-media LINKEDIN' to access LinkedIn page\n\n - Twitter: type 'social-media TWITTER' to access Twitter page\n\n - GitHub: type 'social-media GITHUB' to access GitHub page\n\n\n Make sure to follow me on all of them to be updated on all dev_rubs news";
        break;
      case "social-media FACEBOOK":
        js.context.callMethod(
            'open', ['https://www.facebook.com/rubem.fridolinochristneto']);
        break;
      case "social-media INSTAGRAM":
        js.context.callMethod('open', ['https://www.instagram.com/dev_rubs/']);
        break;
      case "social-media TWITTER":
        js.context.callMethod('open', ['https://twitter.com/dev_rubs']);
        break;
      case "social-media LINKEDIN":
        js.context.callMethod(
            'open', ['https://www.linkedin.com/in/dev-rubs-4a298817b/']);
        break;
      case "social-media GITHUB":
        js.context.callMethod('open', ['https://github.com/RubemNto']);
        break;
      case "clear":
        output = "";
        break;
      default:
        output =
            "'$command' is NOT an available command\n\nType 'help' to list availabe commands";
        break;
    }
    return output;
  }

  Future<SizedBox> GetOutput(String command) async {
    String output = await GetOutputValue(command);
    return SizedBox(
      width: widget.width * 0.9,
      height: widget.height * 0.95 * 0.75,
      child: ListView(
        children: [
          Text(
            output,
            style: TextStyle(
              color: widget.terminalCommandColors.elementAt(0),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget commandTemplates() {
    return Center(
      child: Wrap(
        spacing: 5,
        runSpacing: 5,
        alignment: WrapAlignment.center,
        children: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 20, 20, 20),
            ),
            onPressed: () {
              setState(() {
                output = GetOutput('welcome');
              });
            },
            child: const Text("Welcome"),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                output = GetOutput('who-am-i');
              });
            },
            style: TextButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 20, 20, 20),
            ),
            child: const Text("Who am I?"),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                output = GetOutput('past-projects FLUTTER');
              });
            },
            style: TextButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 20, 20, 20),
            ),
            child: const Text("Flutter projects"),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                output = GetOutput('social-media INSTAGRAM');
              });
            },
            style: TextButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 20, 20, 20),
            ),
            child: const Text("Instagram page"),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                output = GetOutput('social-media LINKEDIN');
              });
            },
            style: TextButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 20, 20, 20),
            ),
            child: const Text("LinkedIn page"),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                output = GetOutput('contact-info');
              });
            },
            style: TextButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 20, 20, 20),
            ),
            child: const Text("Contact"),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    setState(() {});
    commandStyle =
        commandChecker(widget.commands, widget.terminalCommandColors, '');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(
            10,
          ),
        ),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(255, 0, 0, 0),
            offset: Offset.zero,
            blurRadius: 25,
          ),
        ],
      ),
      child: Center(
        child: SizedBox(
          width: widget.width * 0.95,
          height: widget.height * 0.95,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              //Command line
              SizedBox(
                width: widget.width * 0.95,
                height: widget.height == 600
                    ? widget.height * 0.18
                    : widget.height * 0.4,
                child: widget.isMobile
                    ? commandTemplates()
                    : TextField(
                        cursorWidth: 8,
                        onSubmitted: (value) {
                          setState(() {
                            output = GetOutput(widget.controller.text);
                            widget.controller.clear();
                          });
                        },
                        onChanged: (value) {
                          setState(() {
                            commandStyle = commandChecker(
                              widget.commands,
                              widget.terminalCommandColors,
                              widget.controller.text,
                            );
                          });
                        },
                        controller: widget.controller,
                        autofocus: true,
                        style: commandStyle,
                        decoration: InputDecoration(
                            helperStyle: TextStyle(
                              color: widget.terminalCommandColors.elementAt(0),
                              fontWeight: FontWeight.bold,
                            ),
                            helperText:
                                "type a command here or 'help' to list available commands"),
                      ),
              ),
              //Output square
              Container(
                width: widget.width * 0.95,
                height: widget.height == 600
                    ? widget.height * 0.95 * 0.8
                    : widget.height * 0.95 * 0.57,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 45, 45, 45),
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      10,
                    ),
                  ),
                ),
                child: Center(
                  child: FutureBuilder(
                      future: output,
                      builder: ((context, snapshot) {
                        if (snapshot.hasData) {
                          print("2");
                          return snapshot.data as Widget;
                        } else {
                          return Container();
                        }
                      })),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
