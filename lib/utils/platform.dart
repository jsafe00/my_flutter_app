import 'dart:io';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class Config {
  final String androidBaseUrl;
  final String iosBaseUrl;

  Config({required this.androidBaseUrl, required this.iosBaseUrl});

  factory Config.fromJson(Map<String, dynamic> json) {
    return Config(
      androidBaseUrl: json['baseUrl']['android'],
      iosBaseUrl: json['baseUrl']['ios'],
    );
  }
}

Future<Config> loadConfig() async {
  final configJson = await rootBundle.loadString('assets/config/config.json');
  final configMap = jsonDecode(configJson);
  return Config.fromJson(configMap);
}

Future<String> getBaseUrl() async {
  final config = await loadConfig();

  if (Platform.isAndroid) {
    return config.androidBaseUrl;
  } else if (Platform.isIOS) {
    return config.iosBaseUrl;
  } else {
    throw UnsupportedError('Unsupported platform');
  }
}
