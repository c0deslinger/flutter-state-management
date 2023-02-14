import 'package:flutter/material.dart';
import 'package:flutter_getx_example/app/modules/auth/controller/login_controller.dart';
import 'package:flutter_getx_example/app/modules/home/views/home_page.dart';
import 'package:flutter_getx_example/connection/states.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  static const routeName = "/auth/login";
  LoginPage({super.key});

  final LoginController loginController = Get.find();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Login")),
        body: Container(
          margin: const EdgeInsets.all(16),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: const Text("Email"),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8))),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: const Text("Password"),
            ),
            Obx(() => TextField(
                  controller: passwordController,
                  obscureText: loginController.isPasswordObscured.value,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8)),
                      suffixIcon: IconButton(
                        icon: Icon(loginController.isPasswordObscured.value
                            ? Icons.remove_red_eye
                            : Icons.remove_red_eye_outlined),
                        onPressed: () {
                          loginController.isPasswordObscured.value =
                              !loginController.isPasswordObscured.value;
                        },
                      )),
                )),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16),
              child: GetBuilder<LoginController>(
                builder: (loginControllerResp) {
                  return ElevatedButton(
                    onPressed: () {
                      loginController.login(
                          emailController.text, passwordController.text);
                    },
                    style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.amber)),
                    child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: loginControllerResp.loginState ==
                                RequestStatusState.loading
                            ? const CircularProgressIndicator()
                            : const Text("Login")),
                  );
                },
              ),
            )
          ]),
        ));
  }
}
