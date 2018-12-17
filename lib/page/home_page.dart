import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_waynelee/page/events_page.dart';
import 'package:flutter_waynelee/page/shop_detail_page.dart';
import 'package:flutter_waynelee/page/venues_page.dart';
import 'package:flutter_waynelee/widgets/base_title_bar.dart';

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
    Tab(text: 'Venues'),
    Tab(text: 'Events'),
  ];

  ///外层的tab控制
  TabController _mainTabController;

  @override
  void dispose() {
    super.dispose();
    _mainTabController.dispose();
  }

  @override
  void initState() {
    super.initState();
    _mainTabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return homePageView();
  }

  /// 首页组合布局view
  Widget homePageView() {
    return _buildTableList();
  }

  Widget _buildTableList() {
    final _tabBar = TabBar(
      isScrollable: true,
      //设置tab bar 可滚动
      indicatorWeight: 4,
      //设置底部标的高度权重
      tabs: myTabs,
      controller: _mainTabController,
      //下标透明不显示
      indicatorColor: Colors.transparent,
      unselectedLabelColor: Colors.white70,
      labelColor: Colors.white,
      labelPadding: EdgeInsets.all(10),
      //选中tab标题放大加粗
      labelStyle:TextStyle(fontSize: 28,fontWeight: FontWeight.w700),
      unselectedLabelStyle:TextStyle(fontSize: 16,),
    );

    final tabBarView = TabBarView(
      controller: _mainTabController,
      children: [
        VenuesPage(),
        EventsPage(),
      ],
      physics: NeverScrollableScrollPhysics(), //禁止混动切换tab
    );

    return SafeArea(
        top: true, //SafeArea 避免默认沉浸式，
        child: Container(
          color: const Color(0xFF1F1F1F),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
            _tabBar,
            Expanded(child: tabBarView),
          ]),
        ));

  }
}
