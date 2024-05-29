import 'package:get/get.dart';
import 'package:project_test_02/src/services/repository/department/department_repo_impl.dart';

import '../../services/repository/department/department_repo.dart';

class DepartmentBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DepartmentRepo>(
      () => DepartmentRepoImpl(),
      tag: (DepartmentRepo).toString(),
    );
  }
}
