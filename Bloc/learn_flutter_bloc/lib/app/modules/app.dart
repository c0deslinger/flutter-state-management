import 'package:flutter/material.dart';
import 'package:learn_flutter_bloc/app/router.dart';

class MyApp extends StatelessWidget {
  final bool isDarkTheme;
  final MyRouter router;

  const MyApp({super.key, required this.isDarkTheme, required this.router});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: isDarkTheme ? ThemeData.dark() : ThemeData.light(),
      initialRoute: "/",
      onGenerateRoute: (settings) => router.generatedRoute(settings),
    );
  }
}
