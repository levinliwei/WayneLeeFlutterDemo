import 'package:flutter/material.dart';
import 'package:flutter_waynelee/index.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "WayneLeeFlutterDemo",
      home: new Index(),
    );
  }
}