import 'package:flutter/material.dart';
import 'package:flutter_riverpod_example/app/modules/home/model/list_news.dart';
import 'package:flutter_riverpod_example/connection/states.dart';

import '../repository/home_repository.dart';

class ListNewsNotifier extends ChangeNotifier {
  StatusState statusState = StatusState.initial;
  String? errorMessage;
}

class HomeNotifier extends ChangeNotifier {
  StatusState requestStatus = StatusState.initial;
  String? errorMessage;
  IHomeRepository homeRepository;
  ListNews? listNews;

  HomeNotifier(this.homeRepository) {
    getData();
  }

  getData() async {
    requestStatus = StatusState.loading;
    notifyListeners();
    final either = await homeRepository.getListNews();
    listNews = either.fold((l) {
      errorMessage = l.message;
      requestStatus = StatusState.failed;
      return null;
    }, (r) {
      requestStatus = StatusState.loaded;
      return r;
    });
    notifyListeners();
  }
}
