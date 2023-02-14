import 'package:flutter/material.dart';
import 'package:flutter_getx_example/app/modules/details/controllers/cart_controller.dart';
import 'package:flutter_getx_example/app/modules/details/widget/item_cart.dart';
import 'package:flutter_getx_example/app/modules/home/model/list_news.dart';
import 'package:flutter_getx_example/styles/text_styles.dart';
import 'package:get/get.dart';

class DetailsPage extends StatelessWidget {
  static const routeName = "/details";
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Articles articles = Get.arguments['article'];

    final cartTotalController = Get.find<CartController>(tag: "cart-total");

    return Scaffold(
      appBar: AppBar(title: const Text("Details Page")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              Container(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    articles.title!,
                    style: AppTextStyle.heading3,
                  )),
              Expanded(
                child: Container(
                    padding: const EdgeInsets.all(16),
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            child: Text(articles.content!),
                          );
                        } else if (index == 1) {
                          return Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              child: Obx(() => Text(
                                    "total: ${cartTotalController.total.value}",
                                    textAlign: TextAlign.end,
                                    style: const TextStyle(fontSize: 20),
                                  )));
                        } else {
                          return ItemCartWidget();
                        }
                      },
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
