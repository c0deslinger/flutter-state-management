import 'package:bloc/bloc.dart';

class ThemeBloc extends Cubit<bool> {
  bool isDarkMode;

  ThemeBloc({required this.isDarkMode}) : super(isDarkMode);

  void changeTheme() {
    emit(!state);
  }
}
