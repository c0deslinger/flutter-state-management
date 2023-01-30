import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter_bloc/modules/home/controller/counter.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Counter counter = BlocProvider.of<Counter>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Details")),
      body: Center(
        child: BlocBuilder(
          bloc: counter,
          builder: (context, state) {
            return Text(
              "${state}",
              style: const TextStyle(fontSize: 40),
            );
          },
        ),
      ),
    );
  }
}
