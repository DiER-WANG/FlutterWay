import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(WlCalendarApp());

class WlCalendarApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp (      
      title: 'Calendar',      
      home: RandomWords(),
    );
  }
}

class RandomWordState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar' ),
      ),
      body: _buildSuggestions(),
    );
  }
  Widget _buildSuggestions() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if (i.isOdd) return Divider();
        final index = i ~/ 2;
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      },
    );
  }
  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(pair.asPascalCase),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RandomWordState();
  }
}

