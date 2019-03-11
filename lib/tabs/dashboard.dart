import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) => new Container(
    child: new SingleChildScrollView(
      child:  new Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(height: 10.0),
          Container(
            child: goalSection,
            color: Colors.blueGrey.shade100,
          ),
          SizedBox(height: 10.0),
          Container(
            child: activitySection,
            color: Colors.blueGrey.shade100,
          ),
          SizedBox(height: 10.0),
          Container(
            child: Text('Item2'),
            color: Colors.green,
          )
        ],
      )
    ),

  );

  Widget goalSection = new Column(

      children: <Widget>[
        Container(
          padding:  const EdgeInsets.only(top: 10.0, bottom: 0.0, left: 10.0, right: 10.0),
          child:  Image.asset(
            'images/lake.jpg',
            width: 600,
            height: 240,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          padding:  const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0, right: 10.0),
          child: Text(
            'Column Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
                'Alps. Situated 1,578 meters above sea level, it is one of the '
                'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
                'half-hour walk through pastures and pine forest, leads you to the '
                'lake, which warms to 20 degrees Celsius in the summer. Activities '
                'enjoyed here include rowing, and riding the summer toboggan run.',
            softWrap: true,
          ),
        ),
      ]
  );


  Widget activitySection = new Column(

      children: <Widget>[
        Container(
          padding:  const EdgeInsets.only(top: 10.0, bottom: 0.0, left: 10.0, right: 10.0),
          child:  Image.asset(
            'images/lake.jpg',
            width: 600,
            height: 240,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          padding:  const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0, right: 10.0),
          child: Text(
            'Column Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
                'Alps. Situated 1,578 meters above sea level, it is one of the '
                'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
                'half-hour walk through pastures and pine forest, leads you to the '
                'lake, which warms to 20 degrees Celsius in the summer. Activities '
                'enjoyed here include rowing, and riding the summer toboggan run.',
            softWrap: true,
          ),
        ),
      ]
  );
}

//class RandomWords extends StatefulWidget {
//  @override
//  RandomWordsState createState() => new RandomWordsState();
//}
//
//class RandomWordsState extends State<RandomWords> {
//  final Set<WordPair> _saved = new Set<WordPair>();
//  final List<WordPair> _suggestions = <WordPair>[];
//  final TextStyle _biggerFont = const TextStyle(fontSize: 18.0);
//
//  @override                                  // Add from this line ...
//  Widget build(BuildContext context) {
////    final WordPair wordPair = new WordPair.random();
////    return new Text(wordPair.asPascalCase);
//    return new Scaffold (
//      appBar: new AppBar(
//        title: new Text('Startup Name Generator'),
//        actions: <Widget>[      // Add 3 lines from here...
//          new IconButton(icon: const Icon(Icons.list), onPressed: _pushSaved),
//        ],                      // ... to here.
//      ),// Add from here...
//      body: _buildSuggestions(),
//    );
//  }
//
//  Widget _buildSuggestions() {
//    return new ListView.builder(
//        padding: const EdgeInsets.all(16.0),
//        itemBuilder: (BuildContext _context, int i) {
//          if (i.isOdd) {
//            return new Divider();
//          }
//          final int index = i ~/ 2;
//          // If you've reached the end of the available word
//          // pairings...
//          if (index >= _suggestions.length) {
//            // ...then generate 10 more and add them to the
//            // suggestions list.
//            _suggestions.addAll(generateWordPairs().take(10));
//          }
//          return _buildRow(_suggestions[index]);
//        }
//    );
//  }
//
//  Widget _buildRow(WordPair pair) {
//    final bool alreadySaved = _saved.contains(pair);
//    return new ListTile(
//      title: new Text(
//        pair.asPascalCase,
//        style: _biggerFont,
//      ),
//      trailing: new Icon(   // Add the lines from here...
//        alreadySaved ? Icons.favorite : Icons.favorite_border,
//        color: alreadySaved ? Colors.red : null,
//      ),
//      onTap: () {      // Add 9 lines from here...
//        setState(() {
//          if (alreadySaved) {
//            _saved.remove(pair);
//          } else {
//            _saved.add(pair);
//          }
//        });
//      },
//    );
//  }
//
//  void _pushSaved() {
//    Navigator.of(context).push(
//      new MaterialPageRoute<void>(
//        builder: (BuildContext context) {
//          final Iterable<ListTile> tiles = _saved.map(
//                (WordPair pair) {
//              return new ListTile(
//                title: new Text(
//                  pair.asPascalCase,
//                  style: _biggerFont,
//                ),
//              );
//            },
//          );
//          final List<Widget> divided = ListTile
//              .divideTiles(
//            context: context,
//            tiles: tiles,
//          )
//              .toList();
//
//          return new Scaffold(         // Add 6 lines from here...
//            appBar: new AppBar(
//              title: const Text('Saved Suggestions'),
//            ),
//            body: new ListView(children: divided),
//          );                           // ... to here.
//        },
//      ),
//    );
//  }
//
//}
//
//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//
//    return new MaterialApp(
//      title: 'Welcome to Flutter',
//      home: new Scaffold(
//        appBar: new AppBar(
//          title: new Text('Welcome to Flutter'),
//        ),
//        body: new Center(
//          child: new Text("test"), // Change this line to...
//          //child: new RandomWords(),                 // ... this line.
//        ),
//      ),
//    );
//  }
//}