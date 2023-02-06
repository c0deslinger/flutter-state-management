import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_flutter_bloc/modules/home/controller/theme_bloc.dart';
import 'package:latihan_flutter_bloc/modules/home/controller/user_bloc.dart';
import 'package:latihan_flutter_bloc/modules/home/home_page.dart';
import 'package:latihan_flutter_bloc/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale("en", "US"), Locale("id", "ID")],
      path: "assets/locale",
      saveLocale: true,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final ThemeBloc themeBloc = ThemeBloc();
  final MyRouter myRouter = MyRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => UserBloc()),
        BlocProvider(create: (context) => themeBloc)
      ],
      child: BlocBuilder<ThemeBloc, bool>(
        builder: (context, isDarkTheme) {
          return MaterialApp(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            onGenerateRoute: (settings) {
              return myRouter.changeRoute(settings);
            },
            title: 'Latihan Bloc',
            theme: isDarkTheme ? ThemeData.dark() : ThemeData.light(),
            home: const HomePage(),
          );
        },
        bloc: themeBloc,
      ),
    );
  }
}
