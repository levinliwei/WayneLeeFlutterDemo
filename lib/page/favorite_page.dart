import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
//  DetailPage({Key key, this.title, this.saved}) : super(key: key);
//  final String title;
//  final Set<WordPair> saved;

  _DetailPage createState() => _DetailPage();
}

class _DetailPage extends State<DetailPage> {
  final _wordArr = <WordPair>[];
  final _saved = new Set<WordPair>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: _getListView(),
    );
  }

  Widget _getListView() {
    return new ListView.builder(
      padding: new EdgeInsets.all(12),
      itemBuilder: (BuildContext context, int index) {
        if (index.isOdd) return new Divider();
        _wordArr.addAll(generateWordPairs().take(10));
        return _getRow(_wordArr[index]);
      },
    );
  }

  Widget _getRow(WordPair wordArr) {
    final alreadySaved = _saved.contains(wordArr);
    return new ListTile(
      title: new Text(
        wordArr.asPascalCase,
        style: new TextStyle(
          color: alreadySaved ? Colors.red : Colors.black12,
        ),
      ),
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(wordArr);
          } else {
            _saved.add(wordArr);
          }
        });
      },
    );
  }

  void _gotoDetailPage() {
    Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context) {
          final tiles = _saved.map(
            (pair) {
              return new ListTile(
                title: new Text(
                  pair.asPascalCase,
                ),
              );
            },
          );
          final divided = ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList();

          return new Scaffold(
            appBar: new AppBar(
              title: new Text("Detail"),
            ),
            body: new ListView(
              children: divided,
            ),
          );
        },
      ),
    );
  }
}
