import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  ///图片链接
  final images = [
    "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3172863760,165222780&fm=27&gp=0.jpg",
    "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=734635770,2103532169&fm=27&gp=0.jpg",
    "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=386988813,1559784928&fm=200&gp=0.jpg",
    "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=4050151890,3431892026&fm=200&gp=0.jpg",
    "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1685190359,4082891688&fm=200&gp=0.jpg"
  ];

  List<Tab> myTabs = <Tab>[
    new Tab(text: '语文'),
    new Tab(text: '数学'),
    new Tab(text: '英语'),
    new Tab(text: '化学'),
    new Tab(text: '物理'),
    new Tab(text: '政治'),
    new Tab(text: '经济'),
    new Tab(text: '体育'),
  ];

  ///tab bar的controller 跟tabBarView配合统一使用
  TabController _tabController;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(length: 8, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return homePageView();
  }

  /// 首页组合布局view
  Widget homePageView() {
    return _buildTableList();
  }

  /// 顶部的轮播view
  Widget _topBannerView() {
    return new Container(
      child: SizedBox(
        child: new Swiper(
          itemBuilder: (BuildContext context, int index) {
            return getSwiperItem(images[index]);
          },
          itemCount: images.length,
          viewportFraction: 0.6,
          //页卡分层比例
          autoplay: true,
          scale: 0.9,
          //页卡的间距
        ),
        height: 160,
      ),
    );
  }

  Widget getSwiperItem(var image) {
    return new Image.network(
      image,
      height: 180,
      width: 500,
      fit: BoxFit.fill,
    );
  }

  ///下方的tab
  Widget _buildTableList() {
    final tabBar = TabBar(
      isScrollable: true,
      //设置tab bar 可滚动
      indicatorWeight: 4,
      //设置底部标的高度权重
      tabs: myTabs,
      controller: _tabController,
      indicatorColor: Colors.redAccent,
      unselectedLabelColor: Colors.black,
      labelColor: Colors.redAccent,
    );

    final tabBarView = new TabBarView(
      controller: _tabController,
      children: myTabs.map((Tab tab) {
        return getBottomListView();
      }).toList(),
      physics: new NeverScrollableScrollPhysics(), //禁止混动切换tab
    );

    return Container(
      child: Column(children: <Widget>[
        _topBannerView(),
        tabBar,
        Expanded(child: tabBarView),
      ]),
    );
  }

  Widget getBottomListView() {
    return new ListView.builder(
      itemCount: images.length,
      itemBuilder: (BuildContext context, int index) {
        return new Container(
          child: new Row(
            children: <Widget>[
              getBottomListItem(images[index]),
              new Divider(indent: 3, color: Colors.orange), //横向分割间距 indent
            ],
          ),
        );
      },
      scrollDirection: Axis.horizontal,
    );
  }

  Widget getBottomListItem(var image) {
    /// 在图片上方叠加一个背景色的text文本样式
    return Stack(
      children: <Widget>[
        Image.network(image),
        Container(
            width: 50,
            height: 80,
            color: Colors.indigoAccent,
            child: Text(
              "hhhh",
              style: TextStyle(color: Colors.green),
            ))
      ],
    );
  }
}
