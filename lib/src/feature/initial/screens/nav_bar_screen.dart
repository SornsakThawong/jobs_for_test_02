// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../controllers/nav_bar_controller.dart';

// class NavBarScreen extends StatelessWidget {
//   NavBarScreen({super.key});
//   final navBarCtrl = Get.put(NavBarController());

//   @override
//   Widget build(BuildContext context) {
//     return Obx(
//       () => Scaffold(
//         // floatingActionButton: FloatingActionButton(
//         //   onPressed: () => navBarCtrl.onRefreshToken(),
//         // ),
//         body: SafeArea(
//           child: Center(
//             child: navBarCtrl.screens.elementAt(navBarCtrl.selectedIndex),
//           ),
//         ),
//         bottomNavigationBar: BottomNavigationBar(
//           items: <BottomNavigationBarItem>[
//             BottomNavigationBarItem(
//               icon: const Icon(Icons.home),
//               label: LanguageKey.first.tr,
//             ),
//             BottomNavigationBarItem(
//               icon: const Icon(Icons.home),
//               label: LanguageKey.second.tr,
//             ),
//             BottomNavigationBarItem(
//               icon: const Icon(Icons.home),
//               label: LanguageKey.third.tr,
//             ),
//           ],
//           type: BottomNavigationBarType.fixed,
//           backgroundColor: Colors.grey.shade900,
//           currentIndex: navBarCtrl.selectedIndex,
//           selectedItemColor: Colors.white,
//           unselectedItemColor: Colors.grey,
//           onTap: navBarCtrl.onSelectIndex,
//         ),
//       ),
//     );
//   }
// }
