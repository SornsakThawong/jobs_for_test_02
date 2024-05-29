import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_test_02/src/core/config/enum_config.dart';
import 'package:project_test_02/src/feature/home/models/product_model.dart';

import '../controllers/home_controller.dart';
import '../models/department_model.dart';
import 'home_screen.dart';

class HomeScreenSM extends BaseHomeScreen {
  HomeScreenSM({super.key});
  final ctrl = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      // body: Padding(
      //   padding: const EdgeInsets.symmetric(horizontal: 10),
      //   child: Column(
      //     children: [
      //       departmentsLoadingWidget,
      //       productsLoadingWidget,
      //     ],
      //   ),
      // ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: paddingAll),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              department,
              style: titleTextStyle,
            ),
            SizedBox(
              height: boxHeight_1,
            ),
            buildDepartmentsBody(),
            SizedBox(
              height: boxHeight_2,
            ),
            Obx(
              () => Text(
                "$productList : ${ctrl.department.name ?? ""}",
                style: titleTextStyle,
              ),
            ),
            SizedBox(
              height: boxHeight_1,
            ),
            buildProductsBody(),
          ],
        ),
      ),
    );
  }

  Widget buildDepartmentsBody() {
    return Obx(
      () {
        if (ctrl.departmentsState == ApiState.START ||
            ctrl.departmentsState == ApiState.LOADING) {
          return departmentsLoadingWidget;
        }
        if (ctrl.departmentsState == ApiState.ERROR) {
          return const Center(child: Text("Error departments."));
        }
        return SizedBox(
          height: departmentsHeight,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: ctrl.departments.length,
            itemBuilder: (context, index) {
              if (ctrl.departmentsState == ApiState.SUCCESSNULL) {
                return const Center(
                  child: Text("Empty department data."),
                );
              }

              DepartmentModel item = ctrl.departments[index];
              return AspectRatio(
                aspectRatio: 1,
                child: Material(
                  borderRadius: BorderRadius.circular(11),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: InkWell(
                    onTap: () => ctrl.onSelectDepart(item),
                    child: Ink.image(
                      image: NetworkImage(
                        item.imageUrl ?? "",
                      ),
                      fit: BoxFit.cover,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        color: item.id == ctrl.department.id
                            ? Colors.transparent
                            : Colors.black.withOpacity(0.8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              item.name ?? "-",
                              style: subTitleTextStyle.copyWith(
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
              width: 10,
            ),
          ),
        );
      },
    );
  }

  Widget buildProductsBody() {
    return Obx(() {
      if (ctrl.productsState == ApiState.START ||
          ctrl.productsState == ApiState.LOADING) {
        return productsLoadingWidget;
      }
      if (ctrl.productsState == ApiState.ERROR) {
        return const Center(child: Text("Error products."));
      }
      return Expanded(
        child: GridView.builder(
          padding: EdgeInsets.only(bottom: paddingAll),
          itemCount: ctrl.products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: paddingAll,
            crossAxisSpacing: paddingAll,
            mainAxisExtent: productsHeight,
          ),
          itemBuilder: (context, index) {
            if (ctrl.productsState == ApiState.SUCCESSNULL) {
              return const Center(
                child: Text("Empty product data."),
              );
            }
            ProductModel item = ctrl.products[index];
            return Material(
              color: Colors.white,
              elevation: 2,
              borderRadius: BorderRadius.circular(11),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: InkWell(
                onTap: () => ctrl.onProductDesc(item),
                child: Column(
                  children: [
                    Expanded(
                      child: SizedBox.expand(
                        child: Image.network(
                          item.imageUrl ?? "",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              item.name ?? "",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: labelTextStyle,
                            ),
                            Text(
                              item.desc ?? "",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: subLabelTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  item.price ?? "0.0",
                                  style: labelTextStyle.copyWith(fontSize: 18),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    });
  }
}
