import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter_bloc/modules/details/details_page.dart';
import 'package:learn_flutter_bloc/modules/home/home_page.dart';

import '../controller/counter.dart';

class MyRouter {
  Counter counter = Counter(init: 0);

  Route generatedRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomePage.routeName:
        return MaterialPageRoute(
            builder: (context) => BlocProvider.value(
                  value: counter,
                  child: const HomePage(),
                ));
      case DetailsPage.routeName:
        return MaterialPageRoute(
            builder: (context) => BlocProvider.value(
                  value: counter,
                  child: const DetailsPage(),
                ));
      default:
        return MaterialPageRoute(
            builder: (context) => BlocProvider.value(
                  value: counter,
                  child: const HomePage(),
                ));
    }
  }
}
