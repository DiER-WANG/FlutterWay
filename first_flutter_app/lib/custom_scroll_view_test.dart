import 'package:flutter/material.dart';

class CustomScrollViewTest extends StatelessWidget {
  const CustomScrollViewTest({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("DEMO"),
              background: Image.asset("./images/test.png", fit: BoxFit.cover),
            ),
          ),
          
          SliverPadding(
            padding: const EdgeInsets.all(8),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Container(
                    alignment: Alignment.center,
                    color: Colors.cyan[100 * (index % 9)],
                    child: Text("grid item $index"),
                  );
                },
                childCount: 21,
              ),
            ),
          ),

          SliverFixedExtentList(
            itemExtent: 50,
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.lightGreen[100 * (index % 9)],
                  child: Text("list item $index"),
                );
              },
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}
