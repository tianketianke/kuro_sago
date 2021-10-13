import 'package:flutter/material.dart';

import 'package:kuro_sago/pages/category/index.dart';
import 'package:kuro_sago/pages/main/index.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:kuro_sago/common/widgets/navBar/src/custome_navigation_bar.dart';
// import 'package:kuro_sago/common/widgets/navBar/src/custom_navigation_bar_item.dart';
import 'package:kuro_sago/common/values/values.dart';
import 'package:kuro_sago/common/widgets/widgets.dart';

import 'index.dart';

import 'dart:ui';

class ApplicationPage extends GetView<ApplicationController> {
  // 顶部导航
  AppBar _buildAppBar() {
    return transparentAppBar(
        title: Obx(() => Text(
              controller.tabTitles[controller.state.page],
              style: TextStyle(
                color: AppColors.primaryText,
                fontFamily: 'Montserrat',
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              ),
            )),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: AppColors.primaryText,
            ),
            onPressed: () {},
          )
        ]);
  }

  // 内容页
  Widget _buildPageView() {
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        MainPage(),
        CategoryPage(),
        Text('BookmarksPage'),
        Text('AccountPage'),
      ],
      controller: controller.pageController,
      onPageChanged: controller.handlePageChanged,
    );
  }

  // 高斯层
  Widget _buildBlurUtils(Widget child, double singl) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: singl, sigmaY: singl),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black54,
          // borderRadius: BorderRadius.all(Radius.circular(0))
        ),
        child: SafeArea(
          child: child,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // 圆角
    BorderRadiusGeometry radius = BorderRadius.only(
      topLeft: Radius.circular(24.0),
      topRight: Radius.circular(24.0),
      bottomLeft: Radius.circular(24.0),
      bottomRight: Radius.circular(24.0),
    );

    // 露出高度
    const double _h = 60 ;

    // 面板内容
    // 总高度 == height = 5 + margin = 5 * 2 = 15
    Widget _panel() {
      return ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: _buildBlurUtils(
            Column(
              children: [
                Container(
                  // margin: const EdgeInsets.fromLTRB(0, 5.0, 0, 5.0),
                  width: 1.sw,
                  height: 5.h,
                  decoration: BoxDecoration(
                      // color: Colors.grey[200],
                      borderRadius: BorderRadius.all(Radius.circular(12.0))),
                ),
                Text(
                  'data',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            6.18),
      );
    }

    // 露出来的部分
    Widget _collapsed() {
      return Container(
        child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Container(
          color: Colors.white,
          child: Text(
            "This is the collapsed Widget",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),);
    }

    return Scaffold(
      // appBar: _buildAppBar(),
      // body: _buildPageView(),
      // extendBody: true, // 这个属性是决定body的延伸到底部还是延伸到bottomnavigationbar
      body: SlidingUpPanel(
        // border : Border(top: BorderSide(width: 10.h, color: Colors.black,)) ,
        color :   Color(0x00) , // 主体颜色 === 透明了直接
        // parallaxEnabled : true , // 开启滚动视差
        // parallaxOffset: 1.0, // 偏移量
        minHeight: 60.h, // 最小高度
        maxHeight: 1.sh, // 完全体高度
        // backdropEnabled: true, // 遮罩层
          // backdropOpacity : 0 ,
        // backdropColor: Colors.red, // 遮罩层颜色
        // renderPanelSheet: false,
        // isDraggable: false, // 是否可拖动
        collapsed: _collapsed(),
        panel: _panel(),
        body: Scaffold(
          appBar: _buildAppBar(),
          body: _buildPageView(),
        ),
        borderRadius: radius,
        // margin: const EdgeInsets.all(24.0),
      ),

      // bottomNavigationBar: Obx(() => CustomNavigationBar(
      //     iconSize: 30.0,
      //     strokeColor: Colors.red, // 动画圆圈的颜色
      //     elevation: 30,
      //     unSelectedColor: Colors.black54, // 未点击的
      //     selectedColor: Colors.amber, // 已激活的
      //     backgroundColor: Colors.white24, // 背景色
      //     borderRadius: Radius.circular(15.0), // 角
      //     bubbleCurve: Curves.bounceInOut, // 曲线动画类型
      //     blurEffect: true, // 控制CustomNavigationBar是否显示模糊效果
      //     opacity: 1,
      //     isFloating: true,
      //     items: [
      //       CustomNavigationBarItem(
      //         icon: Icon(Icons.home),
      //         title: Text("首页",
      //             style: TextStyle(
      //               color: Colors.red,
      //             )),
      //         selectedTitle: Text("首页",
      //             style: TextStyle(
      //               color: Colors.red,
      //             )),
      //         showBadge: true, // 角标
      //         badgeCount: 10,
      //       ),
      //       CustomNavigationBarItem(
      //         icon: Icon(Icons.shopping_cart),
      //         title: Text("Cart"),
      //       ),
      //       CustomNavigationBarItem(
      //         icon: Icon(Icons.shopping_cart),
      //         title: Text("Cart"),
      //       ),
      //       CustomNavigationBarItem(
      //         icon: Icon(Icons.lightbulb_outline),
      //         title: Text("Explore"),
      //       ),
      //       CustomNavigationBarItem(
      //         icon: Icon(Icons.search),
      //         title: Text("Search"),
      //       ),
      //     ],
      //     currentIndex: controller.state.page,
      //     onTap: (index) {
      //       controller.state.page = index;
      //       // controller.handleNavBarTap(index);
      //     },
      //     onDoubleTap: (index) {
      //       print(
      //         index,
      //       );
      //       print('双击');
      //     })),
    );
  }
}
