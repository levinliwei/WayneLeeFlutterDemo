import 'package:flutter/material.dart';

class EventsPage extends StatefulWidget {
  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  String _activity = 'dddd';
  final List<String> _allActivities = <String>['hiking', 'swimming', 'boating', 'fishing'];

  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      selectDate(),
      buildCardContent(),
    ],);
  }

  Widget buildCardContent() {
    final TextStyle textStyle = Theme.of(context).textTheme.subtitle;
    //
    final imageView = SizedBox(
      height: 400,
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
    ),);

    final textCont = Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Column(children: <Widget>[
        SizedBox(height: 20,),
        Row(children: <Widget>[Icon(Icons.add_location),Text("北京朝外SOHO", style: textStyle)],),
        SizedBox(height: 20,),
        Row(children: <Widget>[Icon(Icons.date_range),Text('2018.12.21', style: textStyle)],),
        SizedBox(height: 20,),
      ],),
    );
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        //卡片阴影宽度
        elevation: 2.0,
        //设置卡片圆角的弧度
        shape: RoundedRectangleBorder(
          side: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          //副轴左对齐
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            imageView,
            textCont,
          ],
        ),
      ),
    );
  }

  /// 选择标签数据
  Widget selectDate() {
//    final selectData = SizedBox(
//      width: 150,
//      child: InputDecorator(
//          decoration: const InputDecoration(
//            hintText: 'Choose an activity',
//            fillColor: Colors.redAccent,
//            counterStyle: TextStyle(color: Colors.redAccent),
//
//          ),
//          isEmpty: _activity == 'ddd',
//          child: DropdownButton<String>(
//            value: _activity,
//            //输入框中和down显示文本颜色
//            style: TextStyle(color: Colors.white),
//            elevation: 18,
//            onChanged: (String newValue) {
//              setState(() {
//                _activity = newValue;
//              },);
//            },
//            items: _allActivities.map((value) {
//              return DropdownMenuItem<String>(
//                value: value ?? 'dd',
//                child: Text(value),
//              );
//            }).toList(),
//          )),
//    );


    final dropdown = _InputDropdown(
      labelText: 'dodo',
      valueText: 'ffff',
      onPressed: _increment,);

    final text = Text(
      '极光组', style: TextStyle(color: Colors.white, fontSize: 16),);
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(children: <Widget>[text],),
    );
  }

  void _increment() {
    setState(() {

    });
  }
}

class _InputDropdown extends StatelessWidget {
  const _InputDropdown({
    Key key,
    this.child,
    this.labelText,
    this.valueText,
    this.valueStyle,
    this.onPressed }) : super(key: key);

  final String labelText;
  final String valueText;
  final TextStyle valueStyle;
  final VoidCallback onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: labelText,
        ),
        baseStyle: valueStyle,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(valueText, style: valueStyle),
            Icon(Icons.arrow_drop_down,
                color: Theme.of(context).brightness == Brightness.light ? Colors.grey.shade700 : Colors.white70
            ),
          ],
        ),
      ),
    );
  }
}