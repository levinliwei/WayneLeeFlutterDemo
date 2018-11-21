import 'package:flutter/material.dart';

//自定义的圆形图片view
// ignore: must_be_immutable
class CustomCircleImage extends StatefulWidget {
  NetworkImage myImage;

  String initials;

  CustomCircleImage({this.myImage, this.initials});

  @override
  _CustomCircleImageState createState() => new _CustomCircleImageState();
}

class _CustomCircleImageState extends State<CustomCircleImage> {
  bool _checkLoading = true;

  @override
  // ignore: must_call_super
  void initState() {
    widget.myImage.resolve(new ImageConfiguration()).addListener((_, __) {
      if (mounted) {
        setState(() {
          _checkLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return _checkLoading == true
        ? new CircleAvatar(child: new Text(widget.initials))
        : new CircleAvatar(
            backgroundImage: widget.myImage,
          );
  }
}
