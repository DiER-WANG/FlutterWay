import 'package:flutter/material.dart';

class TestInheritedWidget extends InheritedWidget {
  TestInheritedWidget({Key key, this.child, this.data})
      : super(key: key, child: child);

  final int data;
  final Widget child;

  static TestInheritedWidget of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(TestInheritedWidget)
        as TestInheritedWidget);
  }

  @override
  bool updateShouldNotify(TestInheritedWidget oldWidget) {
    return oldWidget.data != data;
  }
}

class InheritedDemo extends StatefulWidget {
  InheritedDemo({Key key}) : super(key: key);

  _InheritedDemoState createState() => _InheritedDemoState();
}

class _TestWidget extends StatefulWidget {
  _TestWidget({Key key}) : super(key: key);

  __TestWidgetState createState() => __TestWidgetState();
}

class __TestWidgetState extends State<_TestWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(TestInheritedWidget.of(context).data.toString()),
    );
  }
}

class _InheritedDemoState extends State<InheritedDemo> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('InheritedWidget'),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(0),
        child: TestInheritedWidget(
          data: count,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _TestWidget(),
              RaisedButton(
                child: Text('点击累加'),
                onPressed: () {
                  setState(() {
                    ++count;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
