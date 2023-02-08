import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppThemeNotifier extends ChangeNotifier {
  var isDarkModeEnabled = false;

  AppThemeNotifier() {
    _setLastMode();
  }

  _setLastMode() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    isDarkModeEnabled = pref.getBool("isDarkMode") ?? false;
  }

  _saveMode(bool isDarkMode) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool("isDarkMode", isDarkMode);
  }

  void setLightTheme() {
    isDarkModeEnabled = false;
    _saveMode(isDarkModeEnabled);
    notifyListeners();
  }

  void setDarkTheme() {
    isDarkModeEnabled = true;
    _saveMode(isDarkModeEnabled);
    notifyListeners();
  }
}
