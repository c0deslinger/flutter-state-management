import 'package:flutter_riverpod_example/app/global/notifier/app_theme.notifier.dart';
import 'package:flutter_riverpod_example/app/modules/home/data/home_api_datasource.dart';
import 'package:flutter_riverpod_example/app/modules/home/notifier/home.notifier.dart';
import 'package:flutter_riverpod_example/app/modules/home/repository/home_repository.dart';
import 'package:flutter_riverpod_example/connection/http.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final appThemeStateNotifier =
    ChangeNotifierProvider((ref) => AppThemeNotifier());

final homeApiDatasourceProvider =
    Provider<IHomeApiDatasource>((ref) => HomeApiDatasource(HttpDio.instance));

final homeRepositoryProvider = Provider<IHomeRepository>(
    (ref) => HomeRepository(ref.read(homeApiDatasourceProvider)));

final homeProvider = ChangeNotifierProvider.autoDispose<HomeNotifier>(
    (ref) => HomeNotifier(ref.read(homeRepositoryProvider)));
