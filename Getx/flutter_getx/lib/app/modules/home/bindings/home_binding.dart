import 'package:flutter_getx_example/app/global/controller/global_controller.dart';
import 'package:flutter_getx_example/connection/http_getconnect.dart';
import 'package:get/get.dart';

import '../../../../connection/http_dio.dart';
import '../../details/controllers/cart_controller.dart';
import '../controllers/home_controller.dart';
import '../data/home_api_datasource.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<GlobalController>(() => GlobalController());

    // Get.put(GlobalController());

    Get.lazyPut<HomeController>(
        () => HomeController(HomeApiDatasource(HttpGetConnect.instance)));

    Get.lazyPut<CartController>(() => CartController(), tag: "cart-total");
    Get.create(() => CartController(), tag: "cart-qty");
  }
}
