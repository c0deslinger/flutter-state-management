import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_getx_example/app/modules/home/views/home_page.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  static const routeName = "/";

  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 1), () {
      Get.offNamed(HomePage.routeName);
    });

    return const Scaffold(
      body: Center(child: Text("Splash")),
    );
  }
}
