import 'package:dio/dio.dart';
import 'package:either_option/either_option.dart';
import 'package:flutter_riverpod_example/app/modules/home/data/home_api_datasource.dart';
import 'package:flutter_riverpod_example/app/modules/home/model/list_news.dart';

import '../../../global/model/error.dart';

abstract class IHomeRepository {
  Future<Either<Failure, ListNews>> getListNews();
}

class HomeRepository extends IHomeRepository {
  final IHomeApiDatasource homeApiDatasource;

  HomeRepository(this.homeApiDatasource);

  @override
  Future<Either<Failure, ListNews>> getListNews() async {
    try {
      final data = await homeApiDatasource.getListNews();
      return Right(data);
    } on DioError catch (e) {
      return Left(ServerFailure(msg: e.message.toString()));
    } on Exception catch (e) {
      return Left(ServerFailure(msg: e.toString()));
    } catch (e) {
      return Left(UnhandledFailure());
    }
  }
}
