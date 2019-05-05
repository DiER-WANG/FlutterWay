import 'package:flutter/material.dart';
import './pages/title_section.dart';
import './pages/button_section.dart';
import './pages//text_section.dart';
import 'package:flutter/rendering.dart';// 可视化布局

void main() {
  debugPaintSizeEnabled = true;
  runApp(MyApp());
} 

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),      
      home:Scaffold(
        body:   ListView(
          children: <Widget>[
            Image.asset(
              './images/icon_wifi_password.png',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            TitleSection(),
            ButtonSection(),
            TextSection(),
          ],
        ),    
      ),
    );
  }
}