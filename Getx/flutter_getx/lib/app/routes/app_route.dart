import 'package:flutter_getx_example/app/global/pages/splash_page.dart';
import 'package:flutter_getx_example/app/modules/auth/binding/auth_binding.dart';
import 'package:flutter_getx_example/app/modules/auth/view/login_page.dart';
import 'package:flutter_getx_example/app/modules/details/views/details_page.dart';
import 'package:flutter_getx_example/app/modules/home/bindings/home_binding.dart';
import 'package:flutter_getx_example/app/modules/home/views/home_page.dart';
import 'package:get/get.dart';

class AppRoute {
  static final pages = [
    GetPage(name: SplashPage.routeName, page: () => const SplashPage()),
    GetPage(
        name: LoginPage.routeName,
        page: () => LoginPage(),
        binding: AuthBinding()),
    GetPage(
        name: HomePage.routeName,
        page: () => const HomePage(),
        bindings: [HomeBinding()]),
    GetPage(name: DetailsPage.routeName, page: () => const DetailsPage())
  ];
}
