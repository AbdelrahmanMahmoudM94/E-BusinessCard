import 'package:flutter/material.dart';
 
class LanguageHelper {
  static bool isAr(BuildContext context) =>
      Localizations.localeOf(context).languageCode == "ar";
  static bool isEN(BuildContext context) =>
      Localizations.localeOf(context).languageCode == "en";
  static late String currentLangCode;
  static late String currentCountryLangCode;

  static void setCurrentAcceptLanguage(String counteryCode) {
    currentCountryLangCode = counteryCode;
  }

  static void setCurrentLanguage(String languageCode) {
    currentLangCode = languageCode;
  }
}
