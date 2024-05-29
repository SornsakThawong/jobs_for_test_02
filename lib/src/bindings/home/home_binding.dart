import 'package:get/get.dart';

import '../department/department_binding.dart';
import '../products/products_binding.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    DepartmentBindings().dependencies();
    ProductsBinding().dependencies();
  }
}
