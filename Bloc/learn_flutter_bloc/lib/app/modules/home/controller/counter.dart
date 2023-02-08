import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class Counter extends Cubit<int> {
  int init;

  Counter({required this.init}) : super(init) {
    debugPrint("rebuild");
  }

  void increment() {
    emit(state + 1);
  }

  void decrement() {
    emit(state - 1);
  }
}
