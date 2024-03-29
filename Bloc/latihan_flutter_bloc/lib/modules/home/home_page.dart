// ignore_for_file: prefer_const_constructors

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_flutter_bloc/modules/details/details_page.dart';
import 'package:latihan_flutter_bloc/modules/home/controller/theme_bloc.dart';
import 'package:latihan_flutter_bloc/modules/home/controller/user_bloc.dart';
import 'package:latihan_flutter_bloc/style/response_widget.dart';

import 'model/user.dart';

class HomePage extends StatelessWidget {
  static const routeName = "/home";

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    UserBloc userBloc = context.read<UserBloc>();
    ThemeBloc themeBloc = context.read<ThemeBloc>();

    String? currentLanguage =
        EasyLocalization.of(context)!.currentLocale!.languageCode;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Umur"),
        actions: [
          IconButton(
              onPressed: () {
                themeBloc.changeTheme();
              },
              icon: Icon(Icons.animation))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.animation),
        onPressed: () {
          Navigator.of(context).pushNamed(DetailsPage.routeName);
        },
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: BlocBuilder<UserBloc, Response>(
          bloc: userBloc,
          builder: (context, state) {
            return Column(children: [
              Text("wellcome".tr()),
              RadioListTile(
                title: Text("English"),
                value: "en",
                groupValue: currentLanguage,
                onChanged: (value) {
                  context.setLocale(Locale("en", "US"));
                },
              ),
              RadioListTile(
                title: Text("Bahasa"),
                value: "id",
                groupValue: currentLanguage,
                onChanged: (value) {
                  context.setLocale(Locale("in", "ID"));
                },
              ),
              SizedBox(height: 10),
              ResponseWidget(
                  successWidget: Text("Umur: ${state.userDetails!.umur}"),
                  status: state.status),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: () {
                        userBloc.changeUmur(false);
                      }),
                  IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        userBloc.changeUmur(true);
                      }),
                ],
              )
            ]);
          },
        ),
      ),
    );
  }
}
