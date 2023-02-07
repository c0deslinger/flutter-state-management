import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod_example/app/modules/home/model/list_news.dart';

class DetailsPage extends StatelessWidget {
  static const routeName = "/details";
  final Articles articles;
  const DetailsPage({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Details Page")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              Container(
                  padding: const EdgeInsets.all(16),
                  child: Text(articles.content!)),
            ],
          ),
        ),
      ),
    );
  }
}
