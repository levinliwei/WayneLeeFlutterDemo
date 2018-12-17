import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_waynelee/page/shop_detail_page.dart';

class VenuesPage extends StatefulWidget {
  @override
  _VenuesPageState createState() => _VenuesPageState();
}

class _VenuesPageState extends State<VenuesPage> with SingleTickerProviderStateMixin {
  ///图片链接
  final images = [
    "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3172863760,165222780&fm=27&gp=0.jpg",
    "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=734635770,2103532169&fm=27&gp=0.jpg",
    "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=386988813,1559784928&fm=200&gp=0.jpg",
    "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=4050151890,3431892026&fm=200&gp=0.jpg",
    "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1685190359,4082891688&fm=200&gp=0.jpg"
  ];

  List<Tab> myTabs = <Tab>[
    Tab(text: '语文'),
    Tab(text: '数学'),
    Tab(text: '英语'),
    Tab(text: '化学'),
    Tab(text: '物理'),
    Tab(text: '政治'),
    Tab(text: '经济'),
    Tab(text: '体育'),
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
    _tabController = TabController(length: 8, vsync: this);
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
    final banner = Container(
      child: SizedBox(
        child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return getSwiperItem(images[index]);
          },
          itemCount: images.length,
          itemWidth: 300,
          //页卡分层比例
//          viewportFraction: 0.6,
//          //页卡的间距
          scale: 0.9,
          layout: SwiperLayout.STACK,
        ),
        height: 160,
      ),
    );
    return banner;
  }

  Widget getSwiperItem(var image) {
    return Image.network(
      image,
      height: 180,
      width: 600,
      fit: BoxFit.fill,
    );
  }

  ///下方的tab
  Widget _buildTableList() {
    final _tabBar = TabBar(
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

    final tabBarView = TabBarView(
      controller: _tabController,
      children: myTabs.map((Tab tab) {
        return getBottomListView();
      }).toList(),
      physics: NeverScrollableScrollPhysics(), //禁止混动切换tab
    );

    return Container(
      child: Column(children: <Widget>[
//        BaseTitleBar("Home"),
        _topBannerView(),
        SizedBox(
          height: 30,
        ),
        _tabBar,
        Expanded(child: tabBarView),
      ]),
    );
  }

  Widget getBottomListView() {
    return ListView.builder(
      itemCount: images.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          child: Row(
            children: <Widget>[
              getBottomListItem(images[index]),
              Divider(indent: 3, color: Colors.orange), //横向分割间距 indent
            ],
          ),
        );
      },
      scrollDirection: Axis.horizontal,
    );
  }

  Widget getBottomListItem(var image) {
    gotoShopDetail() {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => new ShopDetail()));
    }

    /// 在图片上方叠加一个背景色的text文本样式
    return GestureDetector(
      onTap: gotoShopDetail,
      child: Stack(children: <Widget>[
        Image.network(
          image,
          width: 200,
          height: 200,
          fit: BoxFit.fill,
        ),
        Positioned(
            top: 10,
            right: 20,
            child: Row(
              children: <Widget>[
                Text(
                  "123",
                  style: TextStyle(color: Colors.red),
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
              ],
            )),
        Positioned(
            bottom: 10,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, //左边对齐
              children: <Widget>[
                Text(
                  "Clue Hao dou",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                SizedBox(height: 5),
                Text(
                  "Ceshi Demo flutter",
                  style: TextStyle(color: Colors.grey, fontSize: 15),
                ),
              ],
            )),
      ]),
    );
  }
}

