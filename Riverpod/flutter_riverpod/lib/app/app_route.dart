import 'package:flutter/material.dart';
import 'package:flutter_riverpod_example/app/global/pages/splash_page.dart';
import 'global/pages/error_page.dart';
import 'modules/details/pages/details_page.dart';
import 'modules/home/pages/home_page.dart';

class AppRoute {
  static Route generateRoute(RouteSettings settings) {
    Map<String, dynamic> args = Map();
    if (settings.arguments != null) {
      args = settings.arguments as Map<String, dynamic>;
    }
    switch (settings.name) {
      case HomePage.routeName:
        return MaterialPageRoute(builder: (context) {
          return const HomePage();
        });
      case DetailsPage.routeName:
        return MaterialPageRoute(builder: (context) {
          return DetailsPage(articles: args['article']);
        });
      default:
        return MaterialPageRoute(builder: (context) {
          return const SplashPage();
        });
    }
  }
}
