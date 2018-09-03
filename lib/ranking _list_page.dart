import 'package:flutter/material.dart';
import 'package:flutter_waynelee/custom_circle_image.dart';

class RankingListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _RankingListPage();
}

class _RankingListPage extends State<RankingListPage> {
  @override
  Widget build(BuildContext context) {
    //数据
    List<String> data = <String>["A", "B", "C", "D", "E", "F", "G", "H"];
    Iterable<Widget> listTitles = data.map((String item) {
      //将items的内容设置给Adapter
      return buildListTile(context, item);
    });
    listTitles = ListTile.divideTiles(
        context: context, tiles: listTitles,color: Colors.orange); //给Listview设置分隔线
    return new Scaffold(
      body: new Scrollbar(
          child: new ListView(
        children: listTitles.toList(), //添加ListView控件
      )),
      backgroundColor: Colors.white, //设置list view 的背景颜色
    );
  }

  //buildListTile相当于ListView的Adapter
  Widget buildListTile(BuildContext context, String item) {
    return new ListTile(
      isThreeLine: true,
      dense: false,
      leading: new CustomCircleImage(myImage: new NetworkImage(
            "https://ss0.baidu.com/73x1bjeh1BF3odCf/it/u=2788297390,2870680833&fm=73&s=D31E79894E136ED446BC5DE80300E014"),
      ),
      title: new Text("哈哈哈"),
      subtitle: new Text("呵呵呵"),
      trailing: new Icon(
        Icons.keyboard_arrow_right,
        color: Colors.deepOrange,
      ),
    );
  }
}
