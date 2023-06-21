import 'package:dev_rubs_blog/PostPage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePost extends StatefulWidget {
  const HomePost({
    super.key,
    required this.title,
    required this.description,
    required this.likes,
    required this.views,
    required this.primaryColor,
    required this.secondaryColor,
    required this.contentPath,
  });

  final String title;
  final String description;
  final int likes;
  final int views;

  final Color primaryColor;
  final Color secondaryColor;
  final String contentPath;
  @override
  State<HomePost> createState() => _HomePostState();
}

class _HomePostState extends State<HomePost> {
  IconData likeIcon = Icons.thumb_up;
  IconData viewIcon = Icons.bookmark;

  double maxPostWidth = 500;
  late double windowWidth;

  bool hovering = false;
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    windowWidth = MediaQuery.of(context).size.width;
    return Container(
        padding: EdgeInsets.only(top: 25, right: 20, bottom: 25, left: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: windowWidth < 600 ? windowWidth - 40 : maxPostWidth,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PostHome(
                                title: widget.title,
                                contentPath: widget.contentPath,
                              )),
                    ),
                    onHover: (hover) {
                      setState(() {
                        hovering = hover;
                      });
                    },
                    hoverColor: Colors.transparent,
                    child: Text(
                      widget.title,
                      style: TextStyle(
                        fontSize: 30,
                        color: hovering ? Colors.orange : widget.secondaryColor,
                      ),
                    ),
                  ),
                  Text(
                    widget.description,
                    style: TextStyle(
                      fontSize: 15,
                      color: widget.secondaryColor,
                    ),
                  ),
                  SizedBox(
                    child: windowWidth > 600
                        ? null
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    setState(() {
                                      selected = !selected;
                                    });
                                  },
                                  isSelected: selected,
                                  selectedIcon: Row(children: [
                                    Container(
                                      child: Icon(
                                        likeIcon,
                                        color: Colors
                                            .orange, //  widget.secondaryColor,
                                      ),
                                      margin: EdgeInsets.only(right: 10),
                                    ),
                                    Text(
                                      NumberFormat.compact()
                                          .format(widget.likes)
                                          .toString(),
                                      style: TextStyle(
                                        color: Colors.orange,
                                      ),
                                    ),
                                  ]),
                                  icon: Row(children: [
                                    Container(
                                      child: Icon(
                                        likeIcon,
                                        color: widget.secondaryColor,
                                      ),
                                      margin: EdgeInsets.only(right: 10),
                                    ),
                                    Text(
                                      NumberFormat.compact()
                                          .format(widget.likes)
                                          .toString(),
                                      style: TextStyle(
                                        color: widget.secondaryColor,
                                      ),
                                    ),
                                  ])),
                              Row(children: [
                                Container(
                                  child: Icon(
                                    viewIcon,
                                    color: widget.secondaryColor,
                                  ),
                                  margin: EdgeInsets.only(right: 10),
                                ),
                                Text(
                                  NumberFormat.compact()
                                      .format(widget.views)
                                      .toString(),
                                  style: TextStyle(
                                    color: widget.secondaryColor,
                                  ),
                                ),
                              ]),
                            ],
                          ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: windowWidth > 600 ? 100 : null,
              child: windowWidth < 600
                  ? null
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    selected = !selected;
                                  });
                                },
                                icon: Container(
                                  child: Icon(
                                    likeIcon,
                                    color: selected
                                        ? Colors.orange
                                        : widget.secondaryColor,
                                  ),
                                  margin: EdgeInsets.only(right: 10),
                                ),
                              ),
                              Text(
                                NumberFormat.compact()
                                    .format(widget.likes)
                                    .toString(),
                                style: TextStyle(
                                  color: selected
                                      ? Colors.orange
                                      : widget.secondaryColor,
                                ),
                              ),
                            ]),
                        Container(
                            padding: EdgeInsets.only(
                              left: 8,
                            ),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      child: Icon(
                                        viewIcon,
                                        color: widget.secondaryColor,
                                      ),
                                      margin: EdgeInsets.only(right: 18)),
                                  Text(
                                    NumberFormat.compact()
                                        .format(widget.views)
                                        .toString(),
                                    style: TextStyle(
                                      color: widget.secondaryColor,
                                    ),
                                  ),
                                ])),
                      ],
                    ),
            ),
          ],
        ));
  }
}
