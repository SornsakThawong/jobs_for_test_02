import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/initial_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  final ctrl = Get.put(InitialController());

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
