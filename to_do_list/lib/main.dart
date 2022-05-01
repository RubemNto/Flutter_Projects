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
  final List<Item> _items = List.empty(growable: true);
  bool _startAddItem = false;
  bool _startClear = false;
  late TextEditingController _controllerTitle;
  late TextEditingController _controllerDescription;
  late Icon _selectedIcon;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controllerTitle = TextEditingController();
    _controllerDescription = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controllerTitle.dispose();
    _controllerDescription.dispose();
    super.dispose();
  }

  Container _addItemAlert() {
    return Container(
      width: MediaQuery.of(context).size.width / 1.2,
      height: MediaQuery.of(context).size.height / 2.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.blueGrey,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 6),
            child: TextField(
              controller: _controllerTitle,
              obscureText: false,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                isCollapsed: false,
                hintText: "Task Title",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
            child: TextField(
              controller: _controllerDescription,
              obscureText: false,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                isCollapsed: false,
                hintText: "Task Description",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: IconButton(
                  icon: Icon(Icons.developer_mode),
                  onPressed: () {
                    _selectedIcon = Icon(Icons.developer_mode);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: IconButton(
                  icon: Icon(Icons.directions_run),
                  onPressed: () {
                    _selectedIcon = Icon(Icons.directions_run);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: IconButton(
                  icon: Icon(Icons.attach_money_rounded),
                  onPressed: () {
                    _selectedIcon = Icon(Icons.attach_money_rounded);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: IconButton(
                  icon: Icon(Icons.devices_other_sharp),
                  onPressed: () {
                    _selectedIcon = Icon(Icons.devices_other_sharp);
                  },
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton(
                child: const Text("Cancel"),
                style: TextButton.styleFrom(
                  textStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  setState(() {
                    _startAddItem = false;
                  });
                },
              ),
              TextButton(
                child: const Text("Add"),
                style: TextButton.styleFrom(
                  textStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  setState(() {
                    _startAddItem = false;
                    _items.add(
                      Item(
                        _controllerTitle.text,
                        _controllerDescription.text,
                        false,
                        _selectedIcon,
                        Colors.blue,
                      ),
                    );
                    _taskCounter = _items.length;
                  });
                },
              )
            ],
          ),
        ],
      ),
    );
  }

  Container _clearItemsAlert() {
    return Container(
      width: MediaQuery.of(context).size.width / 1.2,
      height: MediaQuery.of(context).size.height / 2.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.blueGrey,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
                child: const Text("Cancel"),
                onPressed: () {
                  setState(() {
                    _startClear = false;
                  });
                },
              ),
              TextButton(
                child: const Text("Remove All"),
                style: TextButton.styleFrom(
                  textStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  setState(() {
                    _startClear = false;
                    _items.clear();
                    _taskCounter = _items.length;
                  });
                },
              )
            ],
          ),
        ],
      ),
    );
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
                _startClear = !_startClear;
                _startAddItem = false;
              });
            },
          ),
          IconButton(
            icon: const Icon(Icons.add_rounded),
            tooltip: 'Add item',
            onPressed: () {
              setState(() {
                _startAddItem = !_startAddItem;
                _startClear = false;
              });
            },
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Stack(
            children: <Widget>[
              ListView.builder(
                itemCount: _taskCounter,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(3.5),
                    child: _items.elementAt(index).makeItem(),
                  );
                },
              ),
              _startAddItem == true
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        _addItemAlert(),
                      ],
                    )
                  : Container(
                      child: null,
                    ),
              _startClear == true
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        _clearItemsAlert(),
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
