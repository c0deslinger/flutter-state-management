import 'package:either_option/either_option.dart';
import 'package:flutter_getx_example/app/global/model/error.dart';
import 'package:flutter_getx_example/app/modules/auth/model/login_response.dart';
import 'package:flutter_getx_example/connection/http_getconnect.dart';

abstract class ILoginApiDatasource {
  Future<Either<Failure, LoginResponse>> login(String email, String password);
}

class LoginApiDatasource implements ILoginApiDatasource {
  HttpGetConnect httpGetConnect;

  LoginApiDatasource({required this.httpGetConnect});

  @override
  Future<Either<Failure, LoginResponse>> login(
      String email, String password) async {
    if (email.isNotEmpty && password.isNotEmpty) {
      return Right(LoginResponse(status: "login", code: "0", token: "123"));
    }
    return Left(ServerFailure(msg: "test ahay"));
  }
}
