import 'package:get/get.dart';
import 'package:project_test_02/src/services/repository/products/products_repo.dart';

import '../../services/repository/products/products_repo_impl.dart';

class ProductsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductsRepo>(
      () => ProductsRepoImpl(),
      tag: (ProductsRepo).toString(),
    );
  }
}
