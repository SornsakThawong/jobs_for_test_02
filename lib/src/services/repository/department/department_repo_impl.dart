import 'package:dio/dio.dart';
import 'package:project_test_02/src/core/config/app_config.dart';

import '../../api/dio_service.dart';
import 'department_repo.dart';

class DepartmentRepoImpl extends DioService implements DepartmentRepo {
  @override
  Future<Response> departments() async {
    var endpoint = "$baseUrl${AppConfig.carouselUrl}";
    return await httpDio.get(endpoint);
  }
}
