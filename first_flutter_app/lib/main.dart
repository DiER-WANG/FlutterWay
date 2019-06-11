import 'package:flutter/material.dart';
import 'grid_view_test.dart';
import 'list_view_demo.dart';
import 'infinitivie_list_view.dart';
import 'colum_test.dart';
import 'grid_view_test.dart';
import 'custom_scroll_view_test.dart';
import 'scroll_listener.dart';
import 'scroll_notification_test.dart';
import 'gesture_event_test.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        "new_page": (context) => NewRoute(),
      },
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

/// 点击手势
/// GestureEventTest()
///

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  // 方法
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:  Center(
          child: Text('$_counter',
              style: TextStyle(color: Colors.red, fontSize: 50))),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

/// CustomScrollViewTest()
///
///

class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Route"),
      ),
      body: Center(
        child: Text(
          "This is new route",
        ),
      ),
    );
  }
}

/// Column
class FlexAndExpandedTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Flex(
          direction: Axis.horizontal,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                height: 130,
                color: Colors.red,
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                height: 130,
                color: Colors.blue,
              ),
            )
          ],
        )
      ],
    );
  }
}

/// SigleChild Widget
class SingleChildScrollViewTest extends StatelessWidget {
  const SingleChildScrollViewTest({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String str = "ABCDEFGHIJKLMNOPQRESUVWXYZ" * 10;
    return Scrollbar(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Center(
          child: Column(
            children: str.split("").map((c) => Text(c)).toList(),
          ),
        ),
      ),
    );
  }
}
