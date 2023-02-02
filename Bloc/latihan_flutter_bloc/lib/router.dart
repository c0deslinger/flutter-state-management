import 'package:flutter/material.dart';
import 'package:latihan_flutter_bloc/modules/details/details_page.dart';
import 'package:latihan_flutter_bloc/modules/home/home_page.dart';

class MyRouter {
  Route changeRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) {
      switch (settings.name) {
        case HomePage.routeName:
          return const HomePage();
        case DetailsPage.routeName:
          return const DetailsPage();
        default:
          return const HomePage();
      }
    });
  }
}
