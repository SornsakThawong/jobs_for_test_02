import 'package:get/get.dart';

import '../../../core/base/base_controller.dart';
import '../../../core/config/enum_config.dart';
import '../../../core/widgets/dialog/basic_alert_widget.dart';
import '../../../services/repository/department/department_repo.dart';
import '../../../services/repository/products/products_repo.dart';
import '../models/department_model.dart';
import '../models/product_model.dart';

class HomeController extends BaseController {
  final DepartmentRepo _departmentRepo =
      Get.find(tag: (DepartmentRepo).toString());
  final ProductsRepo _productsRepo = Get.find(tag: (ProductsRepo).toString());

  // Department
  final _departments = <DepartmentModel>[].obs;
  List<DepartmentModel> get departments => _departments;
  set _setDepartments(List<DepartmentModel> value) =>
      _departments.value = value;

  final _department = DepartmentModel().obs;
  DepartmentModel get department => _department.value;
  set _setDepartment(DepartmentModel value) => _department.value = value;

  // Products
  final _products = <ProductModel>[].obs;
  List<ProductModel> get products => _products;
  set _setProducts(List<ProductModel> value) => _products.value = value;

  // Api State
  final _departmentsState = ApiState.START.obs;
  ApiState get departmentsState => _departmentsState.value;
  set _setDepartmentsState(ApiState value) => _departmentsState.value = value;

  final _productsState = ApiState.START.obs;
  ApiState get productsState => _productsState.value;
  set _setProductsState(ApiState value) => _productsState.value = value;

  onSelectDepart(DepartmentModel item) async {
    _setDepartment = item;
    _departments.refresh();
    await getProducts();
  }

  onProductDesc(ProductModel item) {
    BasicAlertWidget.alertWarning(
        title: item.name ?? "", contents: item.desc ?? "");
  }

  Future getDepartments() async {
    try {
      _setDepartmentsState = ApiState.LOADING;
      await 1.delay();
      var res = await _departmentRepo.departments();
      _setDepartments = List<DepartmentModel>.from(
          res.data.map((x) => DepartmentModel.fromJson(x)));
      if (departments.isEmpty) {
        _setDepartmentsState = ApiState.SUCCESSNULL;
        return;
      }
      _setDepartment = departments.first;
      _setDepartmentsState = ApiState.SUCCESS;
    } catch (e) {
      _setDepartmentsState = ApiState.ERROR;
      // logError("message: ${e}");
    }
  }

  Future getProducts() async {
    try {
      _setProductsState = ApiState.LOADING;
      var res = await _productsRepo.products(departmentId: department.id ?? "");
      _setProducts = List<ProductModel>.from(
          res.data.map((x) => ProductModel.fromJson(x)));
      if (products.isEmpty) {
        _setProductsState = ApiState.SUCCESSNULL;
        return;
      }
      _setProductsState = ApiState.SUCCESS;
    } catch (e) {
      _setProductsState = ApiState.ERROR;
      // logError("message: ${e}");
    }
  }

  init() async {
    await getDepartments().then((value) async {
      if (departmentsState == ApiState.SUCCESS) {
        await getProducts();
      }
    });
  }

  @override
  void onInit() {
    init();
    super.onInit();
  }
}
