import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/counter.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Counter counter = BlocProvider.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
            onPressed: () {
              counter.increment();
            },
            icon: const Icon(Icons.add)),
        IconButton(
            onPressed: () {
              counter.decrement();
            },
            icon: const Icon(Icons.remove)),
      ],
    );
  }
}
