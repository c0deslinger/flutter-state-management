// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_getx_example/connection/http_getconnect.dart';
// import 'package:flutter_getx_example/utils/config_reader.dart';
// import 'package:get/get_connect/http/src/response/response.dart';

// class HttpDio implements HttpRequest {
//   final _baseUrl = ConfigReader.getBaseUrl();
//   final _suffixUrl = "&apiKey=${ConfigReader.getApikey()}";

//   static HttpDio? _instance;
//   Dio? _client;
//   final Map<String, dynamic> _header = {};

//   HttpDio._internal() {
//     _instance = this;
//     _client = Dio();
//   }

//   client() => _client;

//   @override
//   setHttpHeader(String key, dynamic val) {
//     _header[key] = val;
//   }

//   @override
//   Future<Response<dynamic>> get({String path = ""}) async {
//     String requestUrl = _baseUrl + path + _suffixUrl;
//     debugPrint(requestUrl);
//     return await _client!.get(requestUrl, options: Options(headers: _header));
//   }

//   Future<Response<dynamic>> post({String path = "", dynamic data}) async {
//     String requestUrl = _baseUrl + path + _suffixUrl;
//     return await _client!
//         .post(requestUrl, options: Options(headers: _header), data: data);
//   }

//   static HttpDio get instance {
//     return _instance ?? HttpDio._internal();
//   }

//   @override
//   Future<Response> getData({String path = ""}) {
//     // TODO: implement getData
//     throw UnimplementedError();
//   }

//   @override
//   Future<Response> postData({body, String path = ""}) {
//     // TODO: implement postData
//     throw UnimplementedError();
//   }

//   @override
//   setAuth(String token) {
//     // TODO: implement setAuth
//     throw UnimplementedError();
//   }
// }
