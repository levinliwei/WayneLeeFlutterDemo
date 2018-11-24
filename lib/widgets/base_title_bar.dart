import 'package:flutter/material.dart';
import 'dart:ui';

///
/// @author         levin
/// @Description    base_title_bar
/// @email          levin.li@teamar.cn
/// @data           2018/11/21
/// @org            Aurora Team
///
Widget BaseTitleBar(var title, ) {
  final barView = Row(
    children: <Widget>[
      new Positioned(left: 20, child: Icon(Icons.image)),
      new Positioned(right: 20, child: Icon(Icons.add)),
    ],
  );
  return Stack(
    children: <Widget>[
      new AppBar(
        title: Text(title),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      new Positioned(left: 20,top: 40, child: Icon(Icons.search)),
      new Positioned(right: 20,top: 40, child: Icon(Icons.add)),
    ],
  );
}
