// import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_example/app/global/controller/network_status_controller.dart';
import 'package:flutter_getx_example/app/global/controller/global_controller.dart';
import 'package:flutter_getx_example/app/global/pages/error_page.dart';
import 'package:flutter_getx_example/app/global/pages/splash_page.dart';
import 'package:flutter_getx_example/app/modules/auth/view/login_page.dart';
import 'package:flutter_getx_example/locale/app_translation.dart';
import 'package:flutter_getx_example/app/routes/app_route.dart';
import 'package:flutter_getx_example/styles/app_themes.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final NetworkStatusController networkStatusController =
        Get.put(NetworkStatusController());

    final GlobalController globalController = Get.put(GlobalController());
    return GetBuilder<GlobalController>(
        init: globalController,
        builder: (appControllerVal) {
          return GetMaterialApp(
            initialRoute: appControllerVal.token != null
                ? SplashPage.routeName
                : LoginPage.routeName,
            locale: appControllerVal.locale,
            translations: AppTranslation(),
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: appControllerVal.theme,
            getPages: AppRoute.pages,
            builder: (context, child) {
              return Obx(() {
                if (networkStatusController.currentNetworkStatus.value ==
                    NetworkStatus.offline) {
                  return const ErrorPage(message: "Connection Error");
                }
                return child!;
              });
            },
          );
        });
  }
}
