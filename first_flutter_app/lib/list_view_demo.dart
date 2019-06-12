import 'package:flutter/material.dart';

class ListViewTest extends StatefulWidget {
  ListViewTest({Key key}) : super(key: key);

  _ListViewTestState createState() => _ListViewTestState();
}

class _ListViewTestState extends State<ListViewTest> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: ListView.builder(
         itemCount: 100,
         itemExtent: 50,
         itemBuilder: (BuildContext context, int index) {
         return ListTile(title: Text("$index"));
        },
       ),
    );
  }
}

class ListViewWithSeparatorTest extends StatefulWidget {
  ListViewWithSeparatorTest({Key key}) : super(key: key);

  _ListViewWithSeparatorTestState createState() => _ListViewWithSeparatorTestState();
}

class _ListViewWithSeparatorTestState extends State<ListViewWithSeparatorTest> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 100,
      cacheExtent:10,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text("$index"),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider(
          color: Colors.blue,
        );
      },
    );
  }
}
