import 'package:flutter/material.dart';
import 'package:flutter_getx_example/app/global/controller/global_controller.dart';
import 'package:flutter_getx_example/app/global/widget/body_builder.dart';
import 'package:flutter_getx_example/app/global/widget/language_switch.dart';
import 'package:flutter_getx_example/app/global/widget/loading.dart';
import 'package:flutter_getx_example/app/modules/details/controllers/cart_controller.dart';
import 'package:flutter_getx_example/app/modules/details/views/details_page.dart';
import 'package:flutter_getx_example/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_getx_example/app/modules/home/model/list_news.dart';
import 'package:flutter_getx_example/styles/text_styles.dart';
import 'package:get/get.dart';

import '../../../global/widget/dark_mode_switch.dart';

class HomePage extends StatelessWidget {
  static const routeName = "/home";

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    CartController cartTotalController = Get.find(tag: "cart-total");

    return Scaffold(
      appBar: AppBar(title: const Text("Home Getx")),
      body: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "wellcome".trParams({"nama": "Ucup"}),
                style: AppTextStyle.caption,
              ),
              DarkModeSwitch(),
              const LanguageSetting(),
              Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: Obx(() => Text(
                        "Cart total: ${cartTotalController.total.value}",
                        textAlign: TextAlign.end,
                        style: const TextStyle(fontSize: 20),
                      ))),
              Text(
                "news_label".tr,
                style: AppTextStyle.caption
                    .merge(Theme.of(context).textTheme.bodyMedium),
              ),
              GetBuilder<HomeController>(
                  init: homeController,
                  id: "listNews",
                  builder: (result) {
                    return Expanded(
                      child: BodyBuilder(
                          loadingWidget: const LoadingWidget(),
                          requestStatus: result.listNewsStatusState,
                          errorMessage: result.errorListNews,
                          onRetry: () {
                            homeController.getListNews();
                          },
                          child:
                              _createListView(result.listNews, homeController)),
                    );
                  }),
            ],
          )),
    );
  }

  Widget _createListView(ListNews? listNews, HomeController homeController) {
    if (listNews == null) {
      return Container();
    }
    return RefreshIndicator(
      onRefresh: () async {
        homeController.getListNews();
      },
      child: ListView.builder(
        itemCount: listNews.totalResults ?? 0,
        itemBuilder: (context, index) {
          var article = listNews.articles![index];
          return InkWell(
            child: Card(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                article.title ?? "N/A",
                style: AppTextStyle.bodySmall,
              ),
            )),
            onTap: () {
              Get.toNamed(DetailsPage.routeName,
                  arguments: {"article": article});
            },
          );
        },
      ),
    );
  }
}
