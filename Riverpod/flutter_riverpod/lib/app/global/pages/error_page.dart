import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  static const routeName = "/error";

  final String message;

  const ErrorPage({super.key, this.message = "Unknown Error"});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Error")),
      body: Center(child: Text(message)),
    );
  }
}
