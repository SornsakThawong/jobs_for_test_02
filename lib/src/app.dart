import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'language/language_controller.dart';
import 'language/language_locale_string.dart';
import 'routers/route_screen.dart';

class App extends StatelessWidget {
  App({super.key});
  final langCtrl = Get.find<LanguageController>();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouteScreen.initial,
      getPages: RouteScreen.routes,
      translations: LanguageLocaleString(),
      locale: langCtrl.locale,
    );
  }
}
