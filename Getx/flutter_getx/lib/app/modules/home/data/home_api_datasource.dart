import 'package:dio/dio.dart';
import 'package:either_option/either_option.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_example/connection/http.dart';
import 'package:intl/intl.dart';

import '../../../global/model/error.dart';
import '../model/list_news.dart';

abstract class IHomeApiDatasource {
  Future<Either<Failure, ListNews>> getListNewsEither();
}

class HomeApiDatasource extends IHomeApiDatasource {
  final HttpDio httpDio;

  HomeApiDatasource(this.httpDio);

  @override
  Future<Either<Failure, ListNews>> getListNewsEither() async {
    try {
      String requestDate = DateFormat('yyyy-MM-dd')
          .format(DateTime.now().subtract(const Duration(days: 7)));
      final response = await httpDio.get(
          path: "everything?q=google&from=$requestDate&sortBy=publishedAt");
      // debugPrint("Response List News: ${response.data}");
      var model = ListNews.fromJson(response.data);
      return Right(model);
    } on DioError catch (e) {
      return Left(ServerFailure(msg: e.message.toString()));
    } on Exception catch (e) {
      return Left(ServerFailure(msg: e.toString()));
    } catch (e) {
      return Left(UnhandledFailure());
    }
  }
}
