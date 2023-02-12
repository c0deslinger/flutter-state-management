import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_example/utils/config_reader.dart';

class HttpDio {
  final _baseUrl = ConfigReader.getBaseUrl();
  final _suffixUrl = "&apiKey=${ConfigReader.getApikey()}";

  static HttpDio? _instance;
  Dio? _client;
  final Map<String, dynamic> _header = {};

  HttpDio._internal() {
    _instance = this;
    _client = Dio();
  }

  client() => _client;

  setHttpHeader(String key, dynamic val) {
    _header[key] = val;
  }

  Future<Response<dynamic>> get({String path = ""}) async {
    String requestUrl = _baseUrl + path + _suffixUrl;
    debugPrint(requestUrl);
    return await _client!.get(requestUrl, options: Options(headers: _header));
  }

  Future<Response<dynamic>> post({String path = "", dynamic data}) async {
    String requestUrl = _baseUrl + path + _suffixUrl;
    return await _client!
        .post(requestUrl, options: Options(headers: _header), data: data);
  }

  static HttpDio get instance {
    return _instance ?? HttpDio._internal();
  }
}
