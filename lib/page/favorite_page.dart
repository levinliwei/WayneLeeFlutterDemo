import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_waynelee/net_work/HttpUtils.dart';
import 'package:flutter_waynelee/net_work/model/MovieTop250.dart';
import 'package:flutter_waynelee/net_work/model/Top250.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class FavoritePage extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<FavoritePage> {
  MovieTop250 movieTop250;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loading();
    _reqPageData();
  }

  Widget loading() {
    return SpinKitCircle(
      color: Colors.greenAccent,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: movieTop250 == null ? loading() : dataListView(),
    );
  }

  Widget dataListView() {
    return ListView.builder(
      itemCount: movieTop250.subjects.length,
      itemBuilder: (_, index) {
        if (index.isOdd) {
          //添加一个1像素高的分隔线widget
          return const Divider(
            color: Colors.deepOrange,
          );
        }
        return getListItem(movieTop250.subjects[index]);
      },
    );
  }

  Widget getListItem(Subjects subject) {
    final image = SizedBox(
      height: 80,
      width: 80,
      child: Image.network(subject.images.small),
    );
    final title = Text(subject.title, style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700),
    );
    StringBuffer genres_sb = new StringBuffer();
    subject.genres.forEach((genre){
      genres_sb.write(genre);
      genres_sb.write(" ");
    });
    final desc = Text(genres_sb.toString(), style: TextStyle(fontSize: 13,color: Colors.redAccent),);
    StringBuffer casts_sb = new StringBuffer();
    subject.casts.forEach((cast){
      casts_sb.write(cast.name);
      casts_sb.write(" ");
    });
    final castName = Text(casts_sb.toString(), style: TextStyle(fontSize: 13),);
    final content = Container(
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: Column(
        children: <Widget>[title,SizedBox(height: 10,), desc, SizedBox(height: 10,),castName],
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
    final item = SizedBox(
      height: 100,
      child: Row(
        children: <Widget>[image, content],
      ),
    );
    return item;
  }

  _reqPageData() async {
    var url = 'http://api.douban.com/v2/movie/top250';
    var data = {'start': 1, 'count': 15};
    var response = await HttpReqUtils().get(url, paramsData: data);
    print("top250===>" + response.toString());
    setState(() {
      movieTop250 = MovieTop250.fromJson(response);
      print("top250====>" + movieTop250.title);
    });
  }
}
