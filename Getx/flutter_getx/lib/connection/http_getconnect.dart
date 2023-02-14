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
  }

  void setAuth(String token) {
    _header['Authorization'] = "Bearer $token";
  }

  void remoteAuth() {
    _header.remove("Authorization");
  }

  Future<Response<dynamic>> getData({String path = ""}) async {
    String requestUrl = path + _suffixUrl;
    httpClient.addRequestModifier((Request request) {
      request.headers.addAll(_header);
      return request;
    });
    return await get(requestUrl);
  }

  Future<Response<dynamic>> postData({dynamic body, String path = ""}) async {
    String requestUrl = path + _suffixUrl;
    return await post(requestUrl, body);
  }

  Future<Response<dynamic>> putData({dynamic body, String path = ""}) async {
    String requestUrl = path + _suffixUrl;
    return await put(requestUrl, body);
  }

  Future<Response<dynamic>> deleteData({String path = ""}) async {
    String requestUrl = path + _suffixUrl;
    return await delete(requestUrl);
  }

  Future<Response<dynamic>> uploadData(
      {required FormData body, String path = ""}) async {
    String requestUrl = path + _suffixUrl;
    return await post(requestUrl, body);
  }

  static HttpGetConnect get instance {
    return _instance ?? HttpGetConnect._internal();
  }
}
