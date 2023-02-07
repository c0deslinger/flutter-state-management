import 'package:flutter/material.dart';
import 'package:flutter_riverpod_example/connection/http.dart';

import '../model/list_news.dart';

abstract class IHomeApiDatasource {
  Future<ListNews> getListNews();
}

class HomeApiDatasource extends IHomeApiDatasource {
  final HttpDio httpDio;

  HomeApiDatasource(this.httpDio);

  @override
  Future<ListNews> getListNews() async {
    try {
      final response = await httpDio.get(
          path: "everything?q=testla&from=2023-01-07&sortBy=publishedAt");
      debugPrint("Response List News: ${response.data}");
      var model = ListNews.fromJson(response.data);
      return model;
    } catch (e) {
      rethrow;
    }
  }
}
