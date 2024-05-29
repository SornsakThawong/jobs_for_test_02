import 'package:dio/dio.dart';

import '../../../core/config/app_config.dart';
import '../../api/dio_service.dart';
import 'products_repo.dart';

class ProductsRepoImpl extends DioService implements ProductsRepo {
  @override
  Future<Response> products({required String departmentId}) async {
    var endpoint = "$baseUrl${AppConfig.listing}/$departmentId/products";
    return await httpDio.get(endpoint);
  }
}
