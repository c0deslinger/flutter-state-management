import 'package:flutter/widgets.dart';
import 'package:flutter_getx_example/app/global/controller/global_controller.dart';
import 'package:flutter_getx_example/app/modules/auth/data/login_api_datasource.dart';
import 'package:flutter_getx_example/app/modules/auth/model/login_response.dart';
import 'package:get/get.dart';

import '../../../../connection/states.dart';
import '../../home/views/home_page.dart';

abstract class ILoginController {
  void login(String email, String password);
  void logout();
}

class LoginController extends GetxController implements ILoginController {
  LoginApiDatasource loginApiDatasource;
  GlobalController globalController = Get.find();

  LoginController({required this.loginApiDatasource});

  LoginResponse? loginResponse;
  RequestStatusState loginState = RequestStatusState.initial;
  String? errorLogin;

  var isPasswordObscured = true.obs;

  @override
  void login(String email, String password) async {
    loginState = RequestStatusState.loading;
    update();
    await Future.delayed(Duration(seconds: 1));
    final either = await loginApiDatasource.login(email, password);
    loginResponse = either.fold((left) {
      Get.defaultDialog(title: "Login Gagal", content: Text(left.message));
      loginState = RequestStatusState.failed;
      update();
      return null;
    }, (right) {
      loginResponse = right;
      loginState = RequestStatusState.loaded;
      globalController.saveToken(loginResponse!.token!);
      update();
      Get.offAllNamed(HomePage.routeName);
      return right;
    });
  }

  @override
  void logout() {}
}
