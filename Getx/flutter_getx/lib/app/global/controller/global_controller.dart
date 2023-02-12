import 'package:flutter/material.dart';
import 'package:flutter_getx_example/styles/app_themes.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class GlobalController extends GetxController {
  ThemeMode theme = ThemeMode.light;
  Locale locale = const Locale("en");

  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    _getLastMode();
  }

  _getLastMode() async {
    theme =
        (box.read("isDarkMode") ?? false) ? ThemeMode.dark : ThemeMode.light;
    String langCode = box.read("locale") ?? "en";
    locale = Locale(langCode);
    update();
  }

  _saveThemeMode(bool isDarkMode) async {
    box.write("isDarkMode", isDarkMode);
    theme = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    update();
  }

  changeLanguage(String languageCode) async {
    box.write("locale", languageCode);
    Get.updateLocale(Locale(languageCode));
  }

  switchTheme() {
    bool isDarkMode = Get.isDarkMode;
    Get.changeTheme(isDarkMode ? AppTheme.lightTheme : AppTheme.darkTheme);
    _saveThemeMode(!isDarkMode);
  }
}
