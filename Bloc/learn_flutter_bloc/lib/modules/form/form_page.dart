import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter_bloc/modules/form/bloc/form_bloc.dart';

class FormPage extends StatelessWidget {
  const FormPage({super.key});

  @override
  Widget build(BuildContext context) {
    FormBloc formBloc = context.read<FormBloc>();

    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Contoh Bloc Selector"),
          BlocSelector<FormBloc, Map<String, dynamic>, String>(
            selector: (state) {
              return state["nama"];
            },
            builder: (context, state) {
              debugPrint("Rebuild nama");
              return Text("Nama: $state");
            },
          ),
          BlocSelector<FormBloc, Map<String, dynamic>, int>(
            selector: (state) {
              return state["umur"];
            },
            builder: (context, state) {
              debugPrint("Rebuild umur");
              return Text("Umur: $state");
            },
          ),
          BlocBuilder<FormBloc, Map<String, dynamic>>(
            bloc: formBloc,
            builder: (context, state) {
              return Row(
                children: [
                  Expanded(
                      child: TextField(
                    decoration:
                        const InputDecoration(border: OutlineInputBorder()),
                    onChanged: (value) {
                      formBloc.ubahNama(value);
                    },
                  )),
                  InkWell(
                    child: const Icon(Icons.add),
                    onTap: () {
                      formBloc.ubahUmur(state["umur"] + 1);
                    },
                  ),
                  InkWell(
                    child: const Icon(Icons.remove),
                    onTap: () {
                      formBloc.ubahUmur(state["umur"] - 1);
                    },
                  ),
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
