import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod_example/app/app_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'utils/config_reader.dart';

Future<void> mainCommon(String env) async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await ConfigReader.initialize(env);

  runApp(ProviderScope(
      child: EasyLocalization(
    supportedLocales: const [Locale("en", "US"), Locale("id", "ID")],
    path: "assets/locale",
    saveLocale: true,
    child: MyApp(),
  )));
  // runApp(const MyApp());
}
