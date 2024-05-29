import 'dart:developer';

import 'package:get/get.dart';

abstract class BaseController extends GetxController {
  logInfo(String? message) {
    log(" ============ [INFO] : $message");
  }

  logError(String? message) {
    log(" ============ [ERROR] : $message");
  }
}
