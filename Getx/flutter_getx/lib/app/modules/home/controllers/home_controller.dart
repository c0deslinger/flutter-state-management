import 'package:flutter_getx_example/connection/states.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../data/home_api_datasource.dart';
import '../model/list_news.dart';

abstract class IHomeController {
  Future<void> getListNews();
}

class HomeController extends GetxController implements IHomeController {
  final IHomeApiDatasource homeApiDatasource;

  HomeController(this.homeApiDatasource);

  RequestStatusState listNewsStatusState = RequestStatusState.initial;
  String? errorListNews;
  ListNews? listNews;

  @override
  void onInit() {
    super.onInit();
    getListNews();
  }

  @override
  Future<void> getListNews() async {
    listNewsStatusState = RequestStatusState.loading;
    update(["listNews"]);
    final either = await homeApiDatasource.getListNews();
    listNews = either.fold((l) {
      errorListNews = l.message;
      listNewsStatusState = RequestStatusState.failed;
      update(["listNews"]);
      return null;
    }, (r) {
      listNewsStatusState = RequestStatusState.loaded;
      update(["listNews"]);
      return r;
    });
  }
}
