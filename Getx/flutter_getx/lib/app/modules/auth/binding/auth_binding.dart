import 'package:flutter_getx_example/app/modules/auth/controller/login_controller.dart';
import 'package:flutter_getx_example/app/modules/auth/data/login_api_datasource.dart';
import 'package:flutter_getx_example/connection/http_getconnect.dart';
import 'package:get/get.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController(
        loginApiDatasource:
            LoginApiDatasource(httpGetConnect: HttpGetConnect.instance)));
  }
}
