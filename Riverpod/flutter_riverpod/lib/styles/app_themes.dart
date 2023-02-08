import 'package:flutter/material.dart';
import 'package:flutter_riverpod_example/styles/colors.dart';
import 'package:flutter_riverpod_example/styles/text_styles.dart';

class AppTheme {
  // Private Constructor
  AppTheme._();

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      color: Colors.teal,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        color: AppColors.neutralGrey80,
      ),
    ),
  );

  static final darkTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.darkBlue1,
      appBarTheme: const AppBarTheme(
        color: AppColors.darkBlue1,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(
          color: Colors.white,
        ),
      ),
      radioTheme:
          RadioThemeData(fillColor: MaterialStateColor.resolveWith((states) {
        return (states.contains(MaterialState.selected))
            ? AppColors.primaryYellow
            : Colors.white;
      })),
      cardTheme: const CardTheme(color: AppColors.darkBlue2));
}
