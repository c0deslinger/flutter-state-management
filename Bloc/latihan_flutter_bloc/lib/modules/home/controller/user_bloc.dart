import 'package:bloc/bloc.dart';
import 'package:latihan_flutter_bloc/modules/home/datasource/user_data.dart';
import 'package:latihan_flutter_bloc/modules/home/model/user.dart';

class UserBloc extends Cubit<Response> {
  UserDatasource userData = UserDatasourceImpl();

  UserBloc()
      : super(Response(
            status: Status.idle, userDetails: UserDetails(nama: "", umur: 0)));

  void changeNama(String nama) {
    emit(Response(
        userDetails: UserDetails(nama: nama, umur: state.userDetails!.umur),
        status: Status.idle));
  }

  Future<void> changeUmur(bool isAdd) async {
    emit(Response(status: Status.loading, userDetails: state.userDetails));
    int responseNewUmur =
        await userData.getNextData(state.userDetails!.umur, isAdd);
    emit(Response(
        userDetails:
            UserDetails(nama: state.userDetails!.nama, umur: responseNewUmur),
        status: Status.success));
  }
}
