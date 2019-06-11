import 'package:flutter/material.dart';

class GestureEventTest extends StatefulWidget {
  GestureEventTest({Key key}) : super(key: key);

  _GestureEventTestState createState() => _GestureEventTestState();
}

class _GestureEventTestState extends State<GestureEventTest>  with WidgetsBindingObserver{
  num _doubleTapCount = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }
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

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print('$state');
  }


  @override
  void dispose() {
    // TODO: implement dispose
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
