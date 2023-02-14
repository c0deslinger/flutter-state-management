import 'package:either_option/either_option.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_example/app/global/model/error_response.dart';
import 'package:flutter_getx_example/connection/http_getconnect.dart';
import 'package:intl/intl.dart';

import '../../../global/model/error.dart';
import '../model/list_news.dart';

abstract class IHomeApiDatasource {
  Future<Either<Failure, ListNews>> getListNews();
}

class HomeApiDatasource extends IHomeApiDatasource {
  final HttpGetConnect httpRequest;

  HomeApiDatasource(this.httpRequest);

  @override
  Future<Either<Failure, ListNews>> getListNews() async {
    List successCode = [200, 201, 202];

    try {
      String requestDate = DateFormat('yyyy-MM-dd')
          .format(DateTime.now().subtract(const Duration(days: 7)));
      final response = await httpRequest.getData(
          path: "everything?q=google&from=$requestDate&sortBy=publishedAt");
      debugPrint("res " + response.body.toString());
      if (successCode.contains(response.statusCode)) {
        return Right(ListNews.fromJson(response.body));
      } else {
        return Left(ServerFailure(
            msg: (ErrorResponse.fromJson(response.body)).message));
      }
    } on Exception catch (e) {
      return Left(ServerFailure(msg: e.toString()));
    } catch (e) {
      debugPrint("e: " + e.toString());
      return Left(UnhandledFailure());
    }
  }
}
