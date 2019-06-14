import 'package:flutter/material.dart';
import 'ui/movie_list.dart';

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        body: MovieList(),
      ),
    );
  }
}


// 原文
// https://medium.com/flutterpub/architecting-your-flutter-project-bd04e144a8f1