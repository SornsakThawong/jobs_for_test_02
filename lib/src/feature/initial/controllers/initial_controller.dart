import 'package:get/get.dart';

import '../../../routers/route_path.dart';

class InitialController extends GetxController {
  Future init() async {
    await 1.delay();
    Get.offNamed(RoutePath.home);
  }

  @override
  void onInit() {
    init();
    super.onInit();
  }
}
