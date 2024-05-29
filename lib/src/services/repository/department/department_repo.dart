import 'package:dio/dio.dart';

abstract class DepartmentRepo {
  Future<Response> departments();
}
