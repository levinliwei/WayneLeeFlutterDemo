import 'dart:async';

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_waynelee/view/snackbar_util.dart';
import 'package:flutter_waynelee/widgets/custom_edge_circle_avatar.dart';
import 'package:url_launcher/url_launcher.dart';

///
/// @author         levin
/// @Description    ShopDetail
/// @email          levin.li@teamar.cn
/// @data           2018/11/21
/// @org            Aurora Team
///
class ShopDetail extends StatefulWidget {
  @override
  _ShopDetailState createState() => _ShopDetailState();
}

class _ShopDetailState extends State<ShopDetail>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  String selectedAndTotalCount;

  ///图片链接
  final List<String> images = <String>[
    "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3172863760,165222780&fm=27&gp=0.jpg",
    "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=734635770,2103532169&fm=27&gp=0.jpg",
    "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=386988813,1559784928&fm=200&gp=0.jpg",
    "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=4050151890,3431892026&fm=200&gp=0.jpg",
    "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1685190359,4082891688&fm=200&gp=0.jpg"
  ];

  List<String> avatars = <String>[
    "https://avatar.csdn.net/F/B/8/3_qq_32319999.jpg",
    "https://avatar.csdn.net/F/5/4/3_yumi0629.jpg",
    "https://avatar.csdn.net/6/6/C/3_u010681361.jpg",
    "https://avatar.csdn.net/9/2/1/3_alicewu_1111.jpg"
  ];

  /// 最大只显示3个用户图像
  List<String> avatarsMax3 = <String>[];

  final _wordArr = <WordPair>[];
  String text =
      "Center继承自Align，只不过是将alignment设置为Alignment.center，其他属性例如widthFactor、heightFactor，布局行为，都与Align完全一样，在这里就不再单独做介绍了。Center源码如下，没有设置alignment属性，是因为Align默认的对齐方式就是居中。";

  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    selectedAndTotalCount = '1/${images.length.toString()}';
    _tabController = new TabController(length: 5, vsync: this);
    for (int i = 0; i < avatars.length; i++) {
      if (i < 3) {
        avatarsMax3.add(avatars[i]);
      }
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _nextPage(int delta) {
    final int newIndex = _tabController.index + delta;
    if (newIndex < 0 || newIndex >= _tabController.length) return;
    _tabController.animateTo(newIndex);

    ///更新当前的图片页码
    setState(() {
      selectedAndTotalCount =
          '${(newIndex + 1).toString()}/${images.length.toString()}';
    });
  }

  @override
  Widget build(BuildContext context) {
    debugPaintSizeEnabled = false;
    final tabBarView = TabBarView(
      controller: _tabController,
      children: choices.map((Choice choice) {
        return new ChoiceCard(choice: choice);
      }).toList(),
      physics: NeverScrollableScrollPhysics(),
    );

    final top = Stack(
      children: <Widget>[
        tabBarView,
        operateImage(),
        userList(),
      ],
    );
    final content = CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Icon(
                Icons.share,
                color: Colors.white,
              ),
            ),
          ],
          leading: Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(
              Icons.keyboard_arrow_left,
              color: Colors.white,
              size: 30,
            ),
          ),
          backgroundColor: Theme.of(context).accentColor,
          expandedHeight: 260.0,
          flexibleSpace: FlexibleSpaceBar(
            background: top,
          ),
        ),
        SliverFillRemaining(
          child: Container(
              color: Colors.blueGrey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, //左边对齐
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text("Club Vox",
                        style: TextStyle(fontSize: 25, color: Colors.white)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      text,
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text("Rd Nuio",
                        style: TextStyle(fontSize: 25, color: Colors.white)),
                  ),
                ],
              )),
        )
      ],
    );

    final bottomBar = SizedBox(
      height: 60,
      child: Stack(
        children: <Widget>[
          Container(
            color: Color.fromRGBO(29, 36, 47, 1),
          ),
          Center(
            child: getBottomCenterLayout(),
          ),
          Positioned(
              left: 50,
              child: StatefulBuilder(
                builder: (_, setState) => SizedBox(
                      height: 60,
                      width: 30,
                      child: Center(
                        child: IconButton(
                            icon: Icon(
                              Icons.favorite,
                              color: isFavorite ? Colors.red : Colors.white,
                            ),
                            onPressed: () {
                              setState(() => isFavorite = !isFavorite);
                            }),
                      ),
                    ),
              )),
          Positioned(
              right: 50,
              child: StatefulBuilder(
                  builder: (_, setState) => SizedBox(
                        height: 60,
                        width: 30,
                        child: Center(
                          child: IconButton(
                              icon: Icon(
                                Icons.phone_missed,
                                color: Colors.white,
                              ),
                              onPressed: (() => _callUpPhone())),
                        ),
                      )))
        ],
      ),
    );

    return Scaffold(
      body: content,
      bottomNavigationBar: bottomBar,
    );
  }

  /// 调用原生拨号键盘播打电话
  _callUpPhone() async {
    const url = 'tel:13522308701';
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  ///底部布局中间的按钮
  Widget getBottomCenterLayout() {
    return new Material(
      borderRadius: BorderRadius.circular(18.0),
      color: Colors.black54,
      shadowColor: Colors.blue.shade200,
      child: new MaterialButton(
        onPressed: () {},
        minWidth: 100.0,
        child:
            Text('马上购票', style: TextStyle(fontSize: 18, color: Colors.white)),
      ),
    );
  }

  Widget userList() {
    return Padding(
      padding: const EdgeInsets.only(top: 200),
      child: Center(
        child: Row(
          children: <Widget>[
            getAvatarsListView(),
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.favorite,
              color: Colors.red,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "123",
              style: TextStyle(color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }

  ///带白边的圆角图像
  Widget getAvatarItem(var url) {
    return buildEdgeCircleAvatar(33, 30, url, Colors.white);
  }

  ///构建圆角图像列表view
  Widget getAvatarsListView() {
    return SizedBox(
      height: 33,
      width: 100,
      child: ListView.separated(
        itemBuilder: (_, index) => Container(
              transform: Matrix4.translationValues(10.0 * index, 0.0, 0.0),
              child: SizedBox(
                width: 33.0,
                height: 33.0,
                child: ClipOval(
                    child: Container(
                  child: getAvatarItem(avatarsMax3.reversed.toList()[index]),
                )),
              ),
            ),
        separatorBuilder: (_, index) => SizedBox(width: 0.0),
        itemCount: avatarsMax3.length,
        //反转
        reverse: true,
        scrollDirection: Axis.horizontal,
        physics: NeverScrollableScrollPhysics(),
      ),
    );
  }

  Widget operateImage() {
    return Positioned(
        right: 20,
        bottom: 20,
        child: Row(
          children: <Widget>[
            ///上一个按钮
            new IconButton(
              tooltip: 'Previous choice',
              icon: const Icon(
                Icons.keyboard_arrow_left,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {
                _nextPage(-1);
              },
            ),

            /// 页码文本
            Text(
              selectedAndTotalCount,
              style: TextStyle(
                color: Colors.white,
              ),
            ),

            ///下一个按钮
            IconButton(
              icon: const Icon(
                Icons.keyboard_arrow_right,
                color: Colors.white,
                size: 30,
              ),
              tooltip: 'Next choice',
              onPressed: () {
                _nextPage(1);
              },
            ),
          ],
        ));
  }
}

class Choice {
  const Choice({this.title, this.icon, this.url});

  final String title;
  final IconData icon;
  final String url;
}

const List<Choice> choices = const <Choice>[
  const Choice(
      title: 'CAR',
      icon: Icons.directions_car,
      url:
          "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3172863760,165222780&fm=27&gp=0.jpg"),
  const Choice(
      title: 'BICYCLE',
      icon: Icons.directions_bike,
      url:
          "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=734635770,2103532169&fm=27&gp=0.jpg"),
  const Choice(
      title: 'BOAT',
      icon: Icons.directions_boat,
      url:
          "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=386988813,1559784928&fm=200&gp=0.jpg"),
  const Choice(
      title: 'BUS',
      icon: Icons.directions_bus,
      url:
          "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=4050151890,3431892026&fm=200&gp=0.jpg"),
  const Choice(
      title: 'TRAIN',
      icon: Icons.directions_railway,
      url:
          "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1685190359,4082891688&fm=200&gp=0.jpg"),
];

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.choice}) : super(key: key);

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
      child: Image.network(
        choice.url,
        fit: BoxFit.fill,
      ),
    );
  }
}
