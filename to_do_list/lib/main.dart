import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:to_do_list/Item.dart';

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
      home: const MyHomePage(title: 'Task Manager'),
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
  int _taskCounter = 0;
  List _items = List.empty(growable: true);
  bool _startAddItem = false;
  bool _startClear = false;
  late TextEditingController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.cleaning_services_rounded),
            tooltip: 'Clear all items',
            onPressed: () {
              setState(() {
                _startClear = true;
                _startAddItem = false;
                // _taskCounter = 0;
              });
            },
          ),
          IconButton(
            icon: const Icon(Icons.add_rounded),
            tooltip: 'Add item',
            onPressed: () {
              setState(() {
                _startAddItem = true;
                _startClear = false;
                // _taskCounter++;
              });
            },
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Stack(
            children: <Widget>[
              ListView.builder(
                itemCount: _taskCounter,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(3.5),
                    child: ListTile(
                      tileColor: Colors.blue,
                      leading: Icon(Icons.developer_mode),
                      title: Text("Title"),
                      subtitle: Text("Description"),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 12.5),
                            child: Icon(Icons.check_circle),
                          ),
                          Icon(Icons.delete),
                        ],
                      ),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.black,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  );
                },
              ),
              _startAddItem == true
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 1.2,
                          height: MediaQuery.of(context).size.height / 3,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.red,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.all(6),
                                child: TextField(
                                  controller: _controller,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isCollapsed: false,
                                    hintText: "Task Title",
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(6),
                                child: TextField(
                                  controller: _controller,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    isCollapsed: false,
                                    hintText: "Task Title",
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  : Container(
                      child: null,
                    ),
              _startClear == true
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 1.2,
                          height: MediaQuery.of(context).size.height / 3,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.green,
                          ),
                          child: null,
                        ),
                      ],
                    )
                  : Container(
                      child: null,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

/*
TextField(
            controller: _controller,
            obscureText: false,
            decoration: InputDecoration(
              isCollapsed: false,
              hintText: "Task Title",
              border: OutlineInputBorder(),
            ),
          ),
*/
