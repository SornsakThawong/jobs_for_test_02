import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageController extends GetxController {
  Future<LanguageController> init() async {
    return this;
  }

  final _locale = const Locale('th', 'TH').obs;

  Locale get locale => _locale.value;

  final _all = [
    const Locale('en', 'US'),
    const Locale('th', 'TH'),
  ];
  List<Locale> get all => _all;

  setLocal(Locale locale) {
    Get.updateLocale(locale).then((value) async {});
    _locale.value = locale;
  }

  String getFlag(String code) {
    switch (code) {
      case 'en':
        return '🇺🇸';
      default:
        return '🇹🇭';
    }
  }
}
