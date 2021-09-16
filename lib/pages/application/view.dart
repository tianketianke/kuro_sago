import 'package:flutter/material.dart';
import 'package:kuro_sago/common/values/values.dart';
import 'package:kuro_sago/common/widgets/widgets.dart';
import 'package:kuro_sago/pages/category/index.dart';
import 'package:kuro_sago/pages/main/index.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:kuro_sago/common/widgets/navBar/src/custome_navigation_bar.dart';
import 'package:kuro_sago/common/widgets/navBar/src/custom_navigation_bar_item.dart';

import 'package:animated_text_kit/animated_text_kit.dart';

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
    return Scaffold(
      // appBar: _buildAppBar(),
      body: _buildPageView(),
      extendBody: true, // 这个属性是决定body的延伸到底部还是延伸到bottomnavigationbar

      // body: Container(
      //   color: Colors.amber,
      // ),
      bottomNavigationBar: Obx(() => CustomNavigationBar(
          iconSize: 30.0,
          strokeColor: Colors.amber, // 动画圆圈的颜色
          // elevation: 30.2,
          unSelectedColor: Colors.white, // 未点击的
          selectedColor: Colors.amber, // 已激活的
          backgroundColor: Colors.white10, // 背景色
          borderRadius: Radius.circular(20.0), // 角
          // bubbleCurve: Curves.bounceInOut, // 曲线动画类型
          // blurEffect: true, // 控制CustomNavigationBar是否显示模糊效果
          opacity: 0.9,
          // isFloating: true,
          items: [
            CustomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("首页",
                  style: TextStyle(
                    color: Colors.red,
                  )),
              selectedTitle: AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    '首页',
                    textStyle: const TextStyle(
                      color: Colors.red,
                    ),
                    speed: const Duration(milliseconds: 200),
                  ),
                ],
                totalRepeatCount: 4,
                pause: const Duration(milliseconds: 1000),
                displayFullTextOnTap: true,
                stopPauseOnTap: true,
              ),
              showBadge: true, // 角标
              badgeCount: 10,
            ),
            CustomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              title: Text("Cart"),
            ),
            CustomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              title: Text("Cart"),
            ),
            CustomNavigationBarItem(
              icon: Icon(Icons.lightbulb_outline),
              title: Text("Explore"),
            ),
            CustomNavigationBarItem(
              icon: Icon(Icons.search),
              title: Text("Search"),
            ),
          ],
          currentIndex: controller.state.page,
          onTap: (index) {
            controller.state.page = index;
            // controller.handleNavBarTap(index);
          },
          onDoubleTap: (index) {
            print(
              index,
            );
            print('双击');
          })),
    );
  }
}
