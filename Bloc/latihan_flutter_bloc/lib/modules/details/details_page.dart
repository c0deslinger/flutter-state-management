import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_flutter_bloc/modules/home/controller/user_bloc.dart';
import 'package:latihan_flutter_bloc/modules/home/model/user.dart';

class DetailsPage extends StatelessWidget {
  static const routeName = "/details";

  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    UserBloc userBloc = context.read<UserBloc>();

    return Scaffold(
      appBar: AppBar(title: const Text("Details")),
      body: Center(
        child: BlocBuilder<UserBloc, Response>(
          bloc: userBloc,
          builder: (context, state) {
            return Column(
              children: [
                Text("${state.userDetails!.umur}",
                    style: const TextStyle(fontSize: 20)),
                Row(
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
              ],
            );
          },
        ),
      ),
    );
  }
}
