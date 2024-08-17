import 'package:e_commerce_app14/core/constant/app_language_theme.dart';
import 'package:e_commerce_app14/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocalController extends GetxController {
  Locale? language;

  MyServices myServices = Get.find();

  ThemeData appThem200 = themeEnglish;

  changeLang(String langCode) {
    appThem200 = langCode == "en"? themeEnglish : themeArabic;
    Locale locale = Locale(langCode);
    myServices.sharedPreference.setString("Lang", langCode);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    if (myServices.sharedPreference.getString("Lang") == 'ar') {
      language = const Locale("ar");
      appThem200 = themeArabic;

    } else if (myServices.sharedPreference.getString("Lang") == 'en') {
      language = const Locale("en");
      appThem200 = themeEnglish;
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
    }
    super.onInit();
  }
}
