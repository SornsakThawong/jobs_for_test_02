import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'flavor/build_config.dart';
import 'flavor/env_config.dart';
import 'flavor/environment.dart';
import 'src/app.dart';
import 'src/core/config/app_config.dart';
import 'src/language/language_controller.dart';

void main() async {
  EnvConfig devConfig = EnvConfig(
    appName: "Prod",
    baseUrl: AppConfig.baseUrl,
  );

  BuildConfig.instantiate(
    envType: Environment.PRODUCTION,
    envConfig: devConfig,
  );

  await Get.putAsync(() => LanguageController().init());
  runApp(App());
}
