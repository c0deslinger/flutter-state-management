import 'package:flutter_getx_example/service/network_status_service.dart';
import 'package:get/get.dart';

class NetworkStatusController extends GetxController {
  final currentNetworkStatus = NetworkStatus.offline.obs;

  @override
  void onInit() {
    super.onInit();
    NetworkStatusService.instance.stream.listen((event) {
      currentNetworkStatus.value =
          NetworkStatusService.instance.getNetworkStatus(event);
    });
  }
}
