import 'package:flutter/material.dart';
import 'package:kuro_sago/common/routes/app_pages.dart';
import 'package:kuro_sago/common/services/global_config.dart';
import 'package:kuro_sago/common/utils/utils.dart';
import 'package:kuro_sago/global.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Future<void> main() async {
  await initServices();
  runApp(MyApp());
}

Future<void> initServices() async {
  print('starting services ...');
  await Get.putAsync(() => GlobalConfigService().init());
  await Global.init();
  // await Get.putAsync(() => GlobalConfigService().init());
  // // await Get.putAsync(SettingsService()).init();
  print('All services started...');
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812 - 44 - 34),
      builder: () => GetMaterialApp(
        debugShowCheckedModeBanner: false,

        // 日志
        enableLog: true,
        logWriterCallback: Logger.write,

        // 路由
        getPages: AppPages.routes,
        // unknownRoute: AppPages.unknownRoute,

        // 启动页面
        initialRoute: AppPages.INITIAL,
        // initialBinding: SplashBinding(),
        // home: SplashPage(),

        // 多语言
        // locale: TranslationService.locale,
        // fallbackLocale: TranslationService.fallbackLocale,
        // translations: TranslationService(),

        // 主题
        // theme: appThemeData,
      ),
    );
  }
}
