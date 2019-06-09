import 'package:flutter/material.dart';

class GestureEventTest extends StatefulWidget {
  GestureEventTest({Key key}) : super(key: key);

  _GestureEventTestState createState() => _GestureEventTestState();
}

class _GestureEventTestState extends State<GestureEventTest> {
  num _doubleTapCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Container(
          alignment: Alignment.center,
          child: CircleAvatar(
            child: Text("$_doubleTapCount"),
            radius: 25,
            backgroundImage: AssetImage("./images/test.png"),
          ),
        ),
        // 双击手势
        onDoubleTap: () {
          setState(() {
            _doubleTapCount++;
          });
        },
        onTap: (){
          setState(() {
            _doubleTapCount--;
          });
        },
      ),
    );
  }
}
