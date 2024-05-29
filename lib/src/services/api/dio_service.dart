import 'package:dio/dio.dart';

import '../../../flavor/build_config.dart';

abstract class DioService {
  // static Dio? _instance;

  String get baseUrl => BuildConfig.instance.config.baseUrl;

  final BaseOptions _options = BaseOptions(
      baseUrl: BuildConfig.instance.config.baseUrl,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
      contentType: "application/json");

  Dio get httpDio => Dio(_options);
}
