import 'package:flutter/material.dart';

class GridViewTest extends StatelessWidget {
  const GridViewTest({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1,
      ),
      children: <Widget>[
        Icon(Icons.ac_unit),
        Icon(Icons.airport_shuttle),
        Icon(Icons.all_inclusive),
        Icon(Icons.beach_access),
        Icon(Icons.cake),
        Icon(Icons.free_breakfast),
      ],
    );
  }
}

class GridViewDynamicTest extends StatefulWidget {
  GridViewDynamicTest({Key key}) : super(key: key);

  _GridViewDynamicTestState createState() => _GridViewDynamicTestState();
}

class _GridViewDynamicTestState extends State<GridViewDynamicTest> {
  List<IconData> _icons = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _retriveData();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 1, crossAxisCount: 3),
      itemCount: _icons.length,
      itemBuilder: (context, index) {
        if (index == _icons.length - 1 && _icons.length < 100) {
          _retriveData();
        }
        return Icon(_icons[index]);
      },
    );
  }

  void _retriveData() {
    Future.delayed(Duration(seconds: 2)).then((e) {
      setState(() {
        _icons.addAll([
          Icons.free_breakfast,
          Icons.fullscreen,
          Icons.functions,
          Icons.games,
          Icons.gif,
        ]);
      });
    });
  }
}
