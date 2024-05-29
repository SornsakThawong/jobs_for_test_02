import 'package:get/get.dart';
import 'package:project_test_02/src/bindings/home/home_binding.dart';

import '../feature/home/screens/home_screen.dart';
import '../feature/initial/screens/splash_screen.dart';
import 'route_path.dart';

class RouteScreen {
  static const initial = RoutePath.splash;

  static final routes = [
    GetPage(
      name: RoutePath.splash,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: RoutePath.home,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
  ];
}
