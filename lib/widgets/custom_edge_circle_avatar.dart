import 'package:flutter/material.dart';

///带外框边缘的圆角图像
///  outerDiameter 外圆直径
///  innerDiameter 内圆直径
///  url 图片url
///  edgeColor  外框边缘颜色
///
Widget buildEdgeCircleAvatar(
  double outerDiameter,
  double innerDiameter,
  var url,
  Color edgeColor,
) {
  final outerBg = SizedBox(
      width: outerDiameter,
      height: outerDiameter,
      child: ClipOval(
        child: Container(
          color: edgeColor,
        ),
      ));

  final avatarImg = Center(
    child: SizedBox(
        width: innerDiameter,
        height: innerDiameter,
        child: ClipOval(
          child: Container(
            child: Image.network(url),
          ),
        )),
  );

  return Stack(
    children: <Widget>[outerBg, avatarImg],
  );
}
