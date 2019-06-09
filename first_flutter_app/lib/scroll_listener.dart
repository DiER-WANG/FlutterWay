import 'package:flutter/material.dart';

class ScrollListenerTest extends StatefulWidget {
  ScrollListenerTest({Key key}) : super(key: key);

  _ScrollListenerTestState createState() => _ScrollListenerTestState();
}

class _ScrollListenerTestState extends State<ScrollListenerTest> {
  ScrollController _listener = ScrollController();
  bool showTopBtn = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _listener.addListener(() {
      print("scroll offset $_listener.offset");
      if (_listener.offset < 1000 && showTopBtn) {
        setState(() {
          showTopBtn = false;
        });
      } else if (_listener.offset >= 1000 && showTopBtn == false) {
        setState(() {
          showTopBtn = true;
        });
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _listener.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("滚动监听及控制"),
      ),
      body: ListView.separated(
        itemCount: 200,

        separatorBuilder: (context, index) {
          return Divider(
            height: 1,
            color: Colors.cyan,
          );
        },
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("item index: $index"),
          );
        },
        controller: _listener,
      ),
      floatingActionButton: !showTopBtn
          ? null
          : FloatingActionButton(
              child: Icon(Icons.arrow_upward),
              onPressed: () {
                _listener.animateTo(0,
                    duration: Duration(milliseconds: 200), curve: Curves.ease);
              },
            ),
    );
  }
}
