import 'package:flutter/material.dart';

class MusicPage extends StatefulWidget {
  @override
  _MusicState createState() => _MusicState();
}

class _MusicState extends State<MusicPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(child: Image.network("http://pic.qingting.fm/channel/2018/03/02/7640b95be09d3b05cdf16b3e8d69cb29.jpg!200"),);
  }
}