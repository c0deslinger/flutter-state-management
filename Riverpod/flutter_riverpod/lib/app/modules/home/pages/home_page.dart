import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod_example/app/global/widget/body_builder.dart';
import 'package:flutter_riverpod_example/app/modules/details/pages/details_page.dart';
import 'package:flutter_riverpod_example/app/modules/home/notifier/home.notifier.dart';
import 'package:flutter_riverpod_example/providers.dart';
import 'package:flutter_riverpod_example/styles/text_styles.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends StatefulHookConsumerWidget {
  static const routeName = "/home";

  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    var listNewsNotifier = ref.watch(homeProvider);
    String? currentLanguage =
        EasyLocalization.of(context)!.currentLocale!.languageCode;

    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "wellcome".tr(),
                style: AppTextStyle.caption,
              ),
              Row(
                children: [
                  Text(
                    "language_label".tr(),
                    style: AppTextStyle.caption,
                  ),
                  Expanded(
                    child: RadioListTile(
                      title: const Text("English"),
                      value: "en",
                      groupValue: currentLanguage,
                      onChanged: (value) {
                        context.setLocale(const Locale("en", "US"));
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile(
                      title: const Text("Indo"),
                      value: "id",
                      groupValue: currentLanguage,
                      onChanged: (value) {
                        context.setLocale(const Locale("in", "ID"));
                      },
                    ),
                  ),
                ],
              ),
              Text(
                "news_label".tr(),
                style: AppTextStyle.caption,
              ),
              Expanded(
                child: BodyBuilder(
                    requestStatus: listNewsNotifier.requestStatus,
                    errorMessage: listNewsNotifier.errorMessage,
                    onRetry: () {
                      listNewsNotifier.getData();
                    },
                    child: _createListView(listNewsNotifier)),
              ),
            ],
          )),
    );
  }

  Widget _createListView(HomeNotifier homeNotifier) {
    return RefreshIndicator(
      onRefresh: () async {
        homeNotifier.getData();
      },
      child: ListView.builder(
        itemCount: homeNotifier.listNews?.totalResults ?? 0,
        itemBuilder: (context, index) {
          var article = homeNotifier.listNews!.articles![index];
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
              Navigator.of(context).pushNamed(DetailsPage.routeName,
                  arguments: {"article": article});
            },
          );
        },
      ),
    );
  }
}
