import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter_bloc/modules/bloc/theme_bloc.dart';
import 'package:learn_flutter_bloc/modules/details/details_page.dart';
import 'package:learn_flutter_bloc/modules/form/form_page.dart';
import 'package:learn_flutter_bloc/modules/home/components/action_button.dart';
import 'package:learn_flutter_bloc/modules/home/controller/counter.dart';

class HomePage extends StatelessWidget {
  static const routeName = "/home";
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Counter counter = BlocProvider.of<Counter>(context);
    ThemeBloc themeBloc = context.read<ThemeBloc>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Belajar Bloc"),
        actions: [
          GestureDetector(
            onTap: () {
              themeBloc.changeTheme();
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.replay_outlined),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(DetailsPage.routeName);
        },
        child: const Icon(Icons.arrow_forward),
      ),
      body: MultiBlocListener(
        listeners: [
          BlocListener<ThemeBloc, bool>(
            bloc: themeBloc,
            listener: (context, isDarkMode) {
              if (isDarkMode) {
                debugPrint("Dark Mode Aktif");
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Dark Mode Actived"),
                  duration: Duration(seconds: 1),
                ));
              }
            },
          )
        ],
        child: Column(children: [
          const SizedBox(height: 20),
          //Menggunakan stream builder
          StreamBuilder(
              initialData: counter.init,
              stream: counter.stream,
              builder: (context, snapshot) {
                return Text(
                  "ini pakai stream builder: ${snapshot.data}",
                  style: const TextStyle(fontSize: 20),
                );
              }),
          //menggunakan bloc listener & builder
          BlocListener<Counter, int>(
            bloc: counter,
            listener: (context, state) {
              if (state % 2 == 0) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("data updated to "),
                  duration: Duration(seconds: 1),
                ));
              }
            },
            child: BlocBuilder<Counter, int>(
              bloc: counter,
              buildWhen: (previous, current) {
                return (current % 2 == 0);
              },
              builder: (context, state) {
                return Text(
                  "ini pakai bloc builder: $state",
                  style: const TextStyle(fontSize: 20),
                );
              },
            ),
          ),
          //menggunakan bloc consumer
          BlocConsumer<Counter, int>(
            bloc: counter,
            builder: (context, state) {
              return Text(
                "ini pakai bloc consumer: $state",
                style: const TextStyle(fontSize: 20),
              );
            },
            listener: (context, state) {
              if (state % 2 == 0) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("data updated to "),
                  duration: Duration(seconds: 1),
                ));
              }
            },
            buildWhen: (previous, current) {
              return current % 2 == 0;
            },
          ),
          const ActionButton(),
          const FormPage()
        ]),
      ),
    );
  }
}
