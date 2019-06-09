import 'package:flutter/material.dart';

class ScrollNotificationTest extends StatefulWidget {
  ScrollNotificationTest({Key key}) : super(key: key);

  _ScrollNotificationTestState createState() => _ScrollNotificationTestState();
}

class _ScrollNotificationTestState extends State<ScrollNotificationTest> {
  String _progress = "0%";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scrollbar(
        child: NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification notification) {
              double progress = notification.metrics.pixels /
                  notification.metrics.maxScrollExtent;
              setState(() {
                _progress = "${(progress * 100).toInt()}%";
              });
            },
            child: Stack(alignment: Alignment.center, children: <Widget>[
              ListView.builder(
                itemCount: 130,
                itemExtent: 44,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("$index"),
                  );
                },
              ),
              CircleAvatar(
                radius: 30,
                child: Text(_progress),
                backgroundColor: Colors.black54,
              ),
            ])),
      ),
    );
  }
}
