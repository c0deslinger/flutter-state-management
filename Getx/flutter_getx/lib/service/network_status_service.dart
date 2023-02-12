import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

enum NetworkStatus { online, offline }

class NetworkStatusService {
  Connectivity? _connectivity;

  static NetworkStatusService? _instance;

  static NetworkStatusService get instance {
    return _instance ?? NetworkStatusService.internal();
  }

  NetworkStatusService.internal() {
    initialize();
  }

  void initialize() {
    _connectivity = Connectivity();
  }

  Future<NetworkStatus> checkInternet() async {
    var connectivityResult = await (_connectivity!.checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      return NetworkStatus.online;
    } else {
      return NetworkStatus.offline;
    }
  }

  Stream get stream => _connectivity!.onConnectivityChanged;

  NetworkStatus getNetworkStatus(ConnectivityResult? status) {
    return status == ConnectivityResult.mobile ||
            status == ConnectivityResult.wifi
        ? NetworkStatus.online
        : NetworkStatus.offline;
  }
}
