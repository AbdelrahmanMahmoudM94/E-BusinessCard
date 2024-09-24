import 'dart:convert';

import 'package:karty/features/di/dependency_init.dart';
import 'package:karty/features/home_profile/data/models/response/home_profile_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalData {
  static final SharedPreferences sharedPreferences = getIt<SharedPreferences>();

  static Future<void>? setApplicationTheme(bool isDarkMode) async {
    await sharedPreferences.setBool("isDarkMode", isDarkMode);
  }

  static bool? getApplicationTheme() {
    return sharedPreferences.getBool("isDarkMode");
  }

  static Future<void>? setLangCode(String langCode) async {
    await sharedPreferences.setString("LangCode", langCode);
  }

  static String? getLangCode() {
    return sharedPreferences.getString("LangCode");
  }

  static Future<void>? setMobKey(String mobKey) async {
    await sharedPreferences.setString("mobKey", mobKey);
  }

  static String? getMobKey() {
    return sharedPreferences.getString("mobKey");
  }

  static Future<void>? setAppIosVersion(String iosVersion) async {
    await sharedPreferences.setString("iosVersion", iosVersion);
  }

  static String? getAppIosVersion() {
    return sharedPreferences.getString("iosVersion");
  }

  static Future<void>? setAppAndroidVersion(String androidVersion) async {
    await sharedPreferences.setString("androidVersion", androidVersion);
  }

  static String? getAppAndroidVersion() {
    return sharedPreferences.getString("androidVersion");
  }

  static Future<void>? setHomeProfile(
      HomeProfileResponseModel homeProfile) async {
    await sharedPreferences.setString("homeProfile", jsonEncode(homeProfile));
  }

  static HomeProfileResponseModel? getHomeProfile() {
    final String? homeProfile = sharedPreferences.getString("homeProfile");
    if (homeProfile != null) {
      return HomeProfileResponseModel.fromJson(jsonDecode(homeProfile));
    }
    return null;
  }
}
