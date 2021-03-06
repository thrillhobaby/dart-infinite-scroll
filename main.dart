import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class RandomWords extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new RandomWordsState();
  }
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[] ;
  final _biggerFont = const TextStyle(fontSize: 18.0);

  Widget _buildRow(WordPair pair) {
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }

  Widget _buildSuggestions() {
    return new ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder:(context, i) {
        if(i.isOdd) return new Divider();
        final index = i ~/2;
        if(index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      });
  }

  @override
  Widget build(BuildContext context) {
   return new Scaffold(
     appBar: new AppBar(
       title: new Text('shit generator'),
     ),
     body: _buildSuggestions(),
   );
  }

}

class MyApp extends StatelessWidget  {
  @override
  Widget  build(BuildContext context) {
    final wordPair = new WordPair.random();
    return new MaterialApp(
      title: 'ricks app',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('ricks app'),
        ),
        body: new Center(
          child: new RandomWords(),
        ),
      ),
    );
  }
}
