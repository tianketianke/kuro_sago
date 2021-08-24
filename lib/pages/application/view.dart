import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:kuro_sago/common/values/values.dart';
import 'package:kuro_sago/common/widgets/widgets.dart';
import 'package:kuro_sago/pages/category/index.dart';
import 'package:kuro_sago/pages/main/index.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'index.dart';

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

  @override
  Widget build(BuildContext context) {
    final iconList = <IconData>[
      Icons.brightness_5,
      Icons.brightness_4,
      Icons.brightness_6,
      Icons.brightness_7,
    ];
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildPageView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: iconList,
        activeIndex: controller.state.page,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.smoothEdge,
        leftCornerRadius: 16,
        rightCornerRadius: 16,
        onTap: (index) => {controller.handleNavBarTap(index)},
        //other params
      ),
    );
  }
}
