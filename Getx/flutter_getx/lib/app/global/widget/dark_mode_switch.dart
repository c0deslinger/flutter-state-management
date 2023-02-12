import 'package:flutter/material.dart';
import 'package:flutter_getx_example/app/global/controller/global_controller.dart';
import 'package:flutter_getx_example/styles/app_themes.dart';
import 'package:get/get.dart';

class DarkModeSwitch extends StatelessWidget {
  DarkModeSwitch({super.key});

  final GlobalController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: Get.isDarkMode,
      onChanged: (val) {
        themeController.switchTheme();
      },
    );
  }
}
