import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';

import '../utils/config_reader.dart';

class HttpGetConnect extends GetConnect {
  final _baseUrl = ConfigReader.getBaseUrl();
  final _suffixUrl = ConfigReader.getSuffixUrl();
  final Map<String, String> _header = {};

  static HttpGetConnect? _instance;

  HttpGetConnect._internal() {
    _instance = this;
    httpClient.baseUrl = _baseUrl;
  }

  void setHttpHeader(String key, dynamic val) {
    _header[key] = val;
    httpClient.addRequestModifier((Request request) {
      request.headers.addAll(_header);
      return request;
    });
  }

  void setAuth(String token) {
    httpClient.addAuthenticator((Request request) async {
      var authHeaders = {'Authorization': "Bearer $token"};
      request.headers.addAll(authHeaders);
      return request;
    });
  }

  Future<Response<dynamic>> getData({String path = ""}) async {
    String requestUrl = path + _suffixUrl;
    return await get(requestUrl, headers: _header);
  }

  Future<Response<dynamic>> postData({dynamic body, String path = ""}) async {
    String requestUrl = path + _suffixUrl;
    return await post(requestUrl, body, headers: _header);
  }

  Future<Response<dynamic>> putData({dynamic body, String path = ""}) async {
    String requestUrl = path + _suffixUrl;
    return await put(requestUrl, body, headers: _header);
  }

  Future<Response<dynamic>> deleteData({String path = ""}) async {
    String requestUrl = path + _suffixUrl;
    return await delete(requestUrl, headers: _header);
  }

  Future<Response<dynamic>> uploadData(
      {required FormData body, String path = ""}) async {
    String requestUrl = path + _suffixUrl;
    return await post(requestUrl, body, headers: _header);
  }

  static HttpGetConnect get instance {
    return _instance ?? HttpGetConnect._internal();
  }
}
