import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod_example/app/modules/home/pages/home_page.dart';

class SplashPage extends StatelessWidget {
  static const routeName = "/";

  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 1), () {
      Navigator.of(context).pushReplacementNamed(HomePage.routeName);
    });

    return const Scaffold(
      body: Center(child: Text("Splash")),
    );
  }
}
