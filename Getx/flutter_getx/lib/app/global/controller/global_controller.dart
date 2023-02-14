import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_getx_example/connection/http_getconnect.dart';
import 'package:flutter_getx_example/styles/app_themes.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class GlobalController extends GetxController {
  ThemeMode theme = ThemeMode.light;
  Locale locale = const Locale("en");
  String? token;

  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    _getLastSetting();
  }

  Future<void> _getLastSetting() async {
    //check last setting theme
    theme =
        (box.read("isDarkMode") ?? false) ? ThemeMode.dark : ThemeMode.light;
    String langCode = box.read("locale") ?? "en";
    //check last setting language
    locale = Locale(langCode);
    //check is already have saved auth token or not
    token = box.read("token");
    if (token != null) {
      HttpGetConnect.instance.setAuth(token!);
    }
    update();
  }

  Future<void> getLastLogin() async {
    token = box.read("token");
    if (token != null) {
      HttpGetConnect.instance.setAuth(token!);
    }
    update();
  }

  Future<void> _saveThemeMode(bool isDarkMode) async {
    box.write("isDarkMode", isDarkMode);
    theme = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    update();
  }

  Future<void> changeLanguage(String languageCode) async {
    box.write("locale", languageCode);
    Get.updateLocale(Locale(languageCode));
  }

  void switchTheme() {
    bool isDarkMode = Get.isDarkMode;
    Get.changeTheme(isDarkMode ? AppTheme.lightTheme : AppTheme.darkTheme);
    _saveThemeMode(!isDarkMode);
  }

  void saveToken(String newToken) {
    box.write("token", newToken);
    HttpGetConnect.instance.setAuth(newToken);
    token = newToken;
    update();
  }

  void remoteToken() {
    box.remove("token");
    HttpGetConnect.instance.remoteAuth();
    token = null;
    update();
  }
}
