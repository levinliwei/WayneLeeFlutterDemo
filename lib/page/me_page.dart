import 'package:flutter/material.dart';
import 'package:flutter_waynelee/page/home_page.dart';

class TestPage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: choices.length,
      child: new Scaffold(
        appBar: new AppBar(
//          title: const Text('Tabbed AppBar'),
          bottom: new TabBar(
            isScrollable: true,
            tabs: choices.map((Choice choice) {
              return new Tab(
                text: choice.title,
              );
            }).toList(),
          ),
        ),
        body: new TabBarView(
          children:[
            HomePage(),
          ]
        ),
      ),
    );
  }
}

class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'CAR', icon: Icons.directions_car),
  const Choice(title: 'BICYCLE', icon: Icons.directions_bike),
  const Choice(title: 'BOAT', icon: Icons.directions_boat),
];

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.choice}) : super(key: key);

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.subtitle;
    //
    final imageView = Expanded(
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
            bottomLeft: Radius.circular(0),
            bottomRight: Radius.circular(0)),
        child: Image.network(
          "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3172863760,165222780&fm=27&gp=0.jpg",
          fit: BoxFit.cover,
        ),
      ),
    );

    final textCont = SizedBox(
      height: 150,
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Column(children: <Widget>[
          SizedBox(height: 30,),
          Row(children: <Widget>[Icon(Icons.add_location),Text(choice.title + "北京朝外SOHO", style: textStyle)],),
          SizedBox(height: 20,),
          Row(children: <Widget>[Icon(Icons.date_range),Text(choice.title, style: textStyle)],),
        ],),
      ),
    );
    return new Card(
      //卡片阴影宽度
      elevation: 2.0,
      //设置卡片圆角的弧度
      shape: RoundedRectangleBorder(
        side: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      color: Colors.white,
      child: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          imageView,
          textCont,
        ],
      ),
    );
  }
}
