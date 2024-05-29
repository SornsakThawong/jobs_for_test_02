import 'package:dio/dio.dart';

abstract class ProductsRepo {
  Future<Response> products({
    required String departmentId,
  });
}
