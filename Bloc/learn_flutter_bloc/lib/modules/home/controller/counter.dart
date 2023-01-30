import 'package:bloc/bloc.dart';

class Counter extends Cubit<int> {
  int init;

  Counter({required this.init}) : super(init);

  void increment() {
    emit(state + 1);
  }

  void decrement() {
    emit(state - 1);
  }
}
