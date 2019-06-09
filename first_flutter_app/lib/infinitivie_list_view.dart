import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class InfinitiviListViewTest extends StatefulWidget {
  InfinitiviListViewTest({Key key}) : super(key: key);

  _InfinitiviListViewTestState createState() => _InfinitiviListViewTestState();
}

class _InfinitiviListViewTestState extends State<InfinitiviListViewTest> {
  static const loadingTag = "###loading###"; // 表尾标记
  var _words = <String>[loadingTag];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _words.length,
      itemBuilder: (BuildContext context, int index) {
        if (_words[index] == loadingTag) {
          if (_words.length < 100) {
            _retriveData();
            return Container(
              alignment: Alignment.center,
              child: SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(strokeWidth: 2.0),
              ),
            );
          } else {
            return Container(
              alignment: Alignment.center,
              child: Text(
                "没有更多了",
                style: TextStyle(color: Colors.grey),
              ),
            );
          }
        } else {
          return ListTile(
            title: Text(_words[index]),
          );
        }
      },
    );
  }

  void _retriveData() {
    Future.delayed(Duration(seconds: 2)).then((e) {
      _words.insertAll(_words.length - 1,
          generateWordPairs().take(20).map((e) => e.asPascalCase).toList());
      setState(() {
        // 重新构建列表
      });
    });
  }
}
