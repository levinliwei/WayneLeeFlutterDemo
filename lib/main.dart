import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_waynelee/page/DetailPage.dart';
import 'package:flutter_waynelee/page/HomePage.dart';
import 'package:flutter_waynelee/page/MusicPage.dart';
import 'package:flutter_waynelee/page/TestPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: MyHomePage(title: 'WayneLeeFlutterDemo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _selectedIndex = 0;
  final _pageList = [
    new HomePage(),
    new MusicPage(),
    new DetailPage(),
    new TestPage(),
    new TestPage(),
  ];

  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('${widget.title != null ? widget.title : ''}'),
      ),
      body: Center(child: getPageView()),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
              backgroundColor: Colors.black54),
          BottomNavigationBarItem(
              icon: Icon(Icons.music_note),
              title: Text('Music'),
              backgroundColor: Colors.black54),
          BottomNavigationBarItem(
              icon: addIcon(),
              title: Text(''),
              backgroundColor: Colors.black54),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              title: Text('Favorite'),
              backgroundColor: Colors.black54),

          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('Me'),
              backgroundColor: Colors.black54),
        ],
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.red,
        onTap: _tabSelect,
        iconSize: 20,
      ),
    );
  }

  Widget addIcon() {
    return new Image.network("https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=1669571068,667842988&fm=26&gp=0.jpg");
  }

  _tabSelect(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget getPageView() {
    return PageView.builder(
      itemBuilder: (BuildContext context, int index) {
        return _pageList[_selectedIndex];
      },
      physics: new NeverScrollableScrollPhysics(), // 禁止PageView 滑动 只可点击切换
    );
  }

}
