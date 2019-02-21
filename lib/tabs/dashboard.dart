import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) => new Container(
    child: new RandomWords()
  );
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  @override                                  // Add from this line ...
  Widget build(BuildContext context) {
    final WordPair wordPair = new WordPair.random();
    return new Text(wordPair.asPascalCase);
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
      title: 'Welcome to Flutter',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Welcome to Flutter'),
        ),
        body: new Center(
          //child: new Text(wordPair.asPascalCase), // Change this line to...
          child: new RandomWords(),                 // ... this line.
        ),
      ),
    );
  }
}