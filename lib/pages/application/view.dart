import 'package:flutter/material.dart';

import 'package:kuro_sago/pages/category/index.dart';
import 'package:kuro_sago/pages/main/index.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:kuro_sago/common/widgets/navBar/src/custome_navigation_bar.dart';
// import 'package:kuro_sago/common/widgets/navBar/src/custom_navigation_bar_item.dart';
// import 'package:kuro_sago/common/values/values.dart';
// import 'package:kuro_sago/common/widgets/widgets.dart';

import 'index.dart';

class ApplicationPage extends GetView<ApplicationController> {
  // 顶部导航
  // AppBar _buildAppBar() {
  //   return transparentAppBar(
  //       title: Obx(() => Text(
  //             controller.tabTitles[controller.state.page],
  //             style: TextStyle(
  //               color: AppColors.primaryText,
  //               fontFamily: 'Montserrat',
  //               fontSize: 18.sp,
  //               fontWeight: FontWeight.w600,
  //             ),
  //           )),
  //       actions: <Widget>[
  //         IconButton(
  //           icon: Icon(
  //             Icons.search,
  //             color: AppColors.primaryText,
  //           ),
  //           onPressed: () {},
  //         )
  //       ]);
  // }

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

  @override
  Widget build(BuildContext context) {
    BorderRadiusGeometry radius = BorderRadius.only(
      topLeft: Radius.circular(24.0),
      topRight: Radius.circular(24.0),
      bottomLeft: Radius.circular(24.0),
      bottomRight: Radius.circular(24.0),
    );

    // 面板内容
    Widget _floatingPanel() {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: radius,
        ),
        // margin: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(10.0),
              width: 30,
              height: 5,
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.all(Radius.circular(12.0))),
            ),
            Container(
              color: Colors.red,
              child: Text('hahahah'),
            )
          ],
        ),
      );
    }

    // 漏出来的部分
    Widget _floatingCollapsed() {
      return Container(
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: radius,
        ),
        // margin: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0.0),
        child: Center(
          child: Text(
            "This is the collapsed Widget",
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    }

    return Scaffold(
      // appBar: _buildAppBar(),
      // body: _buildPageView(),
      extendBody: true, // 这个属性是决定body的延伸到底部还是延伸到bottomnavigationbar
      body: SlidingUpPanel(
        minHeight: 80, // 最小高度
        // maxHeight: 1000 , // 完全体高度
        backdropEnabled: true, // 遮罩层
        // backdropColor: Colors.red, // 遮罩层颜色
        // renderPanelSheet: false,
        // parallaxOffset: 1.0, // 偏移量
        // isDraggable: true, // 是否可拖动
        // collapsed: _floatingCollapsed(),
        panel: _floatingPanel(),
        body: Scaffold(
          appBar: AppBar(
            title: Text("SlidingUpPanelExample"),
          ),
          body: Center(
            child: _buildPageView(),
          ),
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
