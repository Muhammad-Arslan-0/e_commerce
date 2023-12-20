import 'package:e_commerce/controllers/dashboard_controller.dart';
import 'package:e_commerce/helper/app_colors.dart';
import 'package:e_commerce/models/product_model.dart';
import 'package:e_commerce/views/product_view_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DashboardController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
        child: Obx(
          () => GridView.builder(
              shrinkWrap: true,
              itemCount: controller.products.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  childAspectRatio: .65),
              itemBuilder: (context, index) {
                ProductModel currentProduct = controller.products[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.to(() => ProductViewScreen(),
                                  arguments: currentProduct);
                            },
                            child: Container(
                              width: Get.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: AppColors.cardBgColor,
                              ),
                              child: Image.asset(currentProduct.productIMG),
                            ),
                          ),
                          Positioned(
                            bottom: 15,
                            left: 10,
                            child: GestureDetector(
                              onTap: () {
                                currentProduct.isFavoriteProduct =
                                    !currentProduct.isFavoriteProduct;
                                controller.products.refresh();
                                if (!controller.favouriteProducts
                                    .contains(currentProduct)) {
                                  controller.favouriteProducts
                                      .add(currentProduct);
                                } else {
                                  controller.favouriteProducts
                                      .remove(currentProduct);
                                }
                                controller.products.refresh();
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                      currentProduct.isFavoriteProduct
                                          ? Icons.favorite
                                          : Icons.favorite_outline,
                                      color: Colors.indigo),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      currentProduct.productTitle,
                      style: TextStyle(color: Colors.blueGrey, fontSize: 15),
                    ).tr(),
                    Text(
                      "\$${currentProduct.productPrice.toString()}",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
