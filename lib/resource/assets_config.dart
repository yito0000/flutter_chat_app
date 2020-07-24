import 'dart:async' show Future;
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

Future<String> loadAsset() async {
  return await rootBundle.loadString('assets/config.json');
}

Future<String> loadAssetApiHost() async {
  return await rootBundle.loadString('assets/config.json').then((value) {
    Map<String, dynamic> response = json.decode(value);
    return response['api_host'];
  });
}