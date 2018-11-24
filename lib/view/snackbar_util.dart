import 'package:flutter/material.dart';

class SnackBarUtil {

  static buildSnackBar(BuildContext context,var msg) {
    final snackBar =
    new SnackBar(content: new Text(msg));
    Scaffold.of(context).showSnackBar(snackBar);
  }

  static customSnackBar(BuildContext context,var msg){

  }
}