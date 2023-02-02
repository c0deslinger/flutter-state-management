import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_flutter_bloc/modules/home/controller/theme_bloc.dart';
import 'package:latihan_flutter_bloc/modules/home/controller/user_bloc.dart';
import 'package:latihan_flutter_bloc/modules/home/home_page.dart';
import 'package:latihan_flutter_bloc/router.dart';

void main() {
  runApp(MyApp());
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
