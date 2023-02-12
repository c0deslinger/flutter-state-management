import 'dart:convert';

import 'package:flutter/services.dart';

abstract class ConfigReader {
  static Map<String, dynamic>? _config;

  static Future<void> initialize(String env) async {
    var configString = '{}';
    try {
      configString = await rootBundle.loadString('config/$env.json');
    } catch (_) {
      configString = await rootBundle.loadString('config/default.json');
    }
    _config = json.decode(configString) as Map<String, dynamic>;
  }

  static String getBaseUrl() {
    return _config!['baseUrl'] as String;
  }

  static String getApikey() {
    return _config!['apikey'] as String;
  }
}
