import 'dart:developer';

import 'package:flutter/services.dart';

class CustomEncrypt {
  static const MethodChannel _channel =
      MethodChannel('com.diyar.eBusinessCard.dev/encrypt');

  static Future<String?> encryptData(
      String data, String publicKeyBase64) async {
    final String? encryptedData =
        await _channel.invokeMethod('encryptData', <String, String>{
      'data': data,
      'publicKeyBase64': publicKeyBase64,
    });
    log(encryptedData!);
    return encryptedData;
  }
}
