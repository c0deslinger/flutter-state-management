import 'package:bloc/bloc.dart';

class FormBloc extends Cubit<Map<String, dynamic>> {
  FormBloc() : super({"nama": "", "umur": 0});

  void ubahNama(String newName) {
    emit({"nama": newName, "umur": state["umur"]});
  }

  void ubahUmur(int umur) {
    emit({"nama": state["nama"], "umur": umur});
  }
}
