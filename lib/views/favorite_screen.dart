import 'package:e_commerce/views/product_view_screen.dart';
import 'package:e_commerce/widgets/no_product_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/dashboard_controller.dart';
import '../generated/locale_keys.g.dart';
import '../helper/app_colors.dart';
import '../models/product_model.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DashboardController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
        child: Obx(
          () => controller.favouriteProducts.isEmpty
              ? NoProductWidget(text: LocaleKeys.no_product_in_favorite)
              : GridView.builder(
                  shrinkWrap: true,
                  itemCount: controller.favouriteProducts.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 15,
                      childAspectRatio: .65),
                  itemBuilder: (context, index) {
                    ProductModel currentProduct =
                        controller.favouriteProducts[index];
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
                                  child: Image.asset(controller
                                      .favouriteProducts[index].productIMG),
                                ),
                              ),
                              Positioned(
                                bottom: 15,
                                left: 10,
                                child: GestureDetector(
                                  onTap: () {
                                    var indexOfProduct = controller.products
                                        .indexWhere((element) =>
                                            element.productID ==
                                            controller.favouriteProducts[index]
                                                .productID);
                                    controller.favouriteProducts.remove(
                                        controller.favouriteProducts[index]);
                                    controller.favouriteProducts.refresh();

                                    controller.products[indexOfProduct]
                                            .isFavoriteProduct =
                                        !controller.products[indexOfProduct]
                                            .isFavoriteProduct;

                                    controller.products.refresh();
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(
                                          controller.favouriteProducts[index]
                                                  .isFavoriteProduct
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
                          controller.favouriteProducts[index].productTitle,
                          style: TextStyle(color: Colors.grey, fontSize: 15),
                        ).tr(),
                        Text(
                          "\$${controller.favouriteProducts[index].productPrice.toString()}",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ],
                    );
                  }),
        ),
      ),
    );
  }
}
