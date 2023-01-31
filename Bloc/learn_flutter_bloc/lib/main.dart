import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter_bloc/modules/app.dart';
import 'package:learn_flutter_bloc/modules/bloc/theme_bloc.dart';
import 'package:learn_flutter_bloc/modules/home/controller/counter.dart';
import 'package:learn_flutter_bloc/modules/home/routes/router.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  App({super.key});

  final ThemeBloc themeBloc = ThemeBloc(isDarkMode: false);
  final MyRouter router = MyRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => Counter(init: 0)),
          BlocProvider(create: (context) => themeBloc)
        ],
        child: BlocBuilder<ThemeBloc, bool>(
          builder: (context, isDarkTheme) {
            return MyApp(
              isDarkTheme: isDarkTheme,
              router: router,
            );
          },
          bloc: themeBloc,
        ));
  }
}
