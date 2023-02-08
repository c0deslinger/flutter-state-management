import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  static const routeName = "/error";
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Error")),
    );
  }
}
