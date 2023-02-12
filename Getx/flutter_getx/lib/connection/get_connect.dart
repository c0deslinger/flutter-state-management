// import 'package:get/get.dart';

// import '../utils/config_reader.dart';

// class ApiConnect extends GetConnect {
//   final _baseUrl = ConfigReader.getBaseUrl();
//   final _suffixUrl = "&apiKey=${ConfigReader.getApikey()}";
//   final Map<String, dynamic> _header = {};
  
// static ApiConnect? _instance;

//   ApiConnect._internal() {
//     _instance = this;
//   }

//   setHttpHeader(String key, dynamic val) {
//     _header[key] = val;
//     httpClient.addRequestModifier((request) {
//       return request;
//     });
//   }

//   @override
//   void onInit() {
//     super.onInit();
//     httpClient.baseUrl = _baseUrl;
//   }

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
// }
