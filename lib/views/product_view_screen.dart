import 'package:e_commerce/controllers/cart_controller.dart';
import 'package:e_commerce/helper/app_colors.dart';
import 'package:e_commerce/helper/app_constants.dart';
import 'package:e_commerce/models/product_model.dart';
import 'package:e_commerce/widgets/custom_size_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/connection_manager_controller.dart';
import '../controllers/dashboard_controller.dart';
import '../controllers/product_view_controller.dart';
import '../generated/locale_keys.g.dart';
import '../widgets/custom_icon.dart';
import '../widgets/snackbars.dart';

class ProductViewScreen extends StatelessWidget {
  ProductViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductModel productModel = Get.arguments;
    final _connectionController = Get.put(ConnectionManagerController());
    final controller = Get.put(ProductViewController());
    final _dashboardController = Get.put(DashboardController());
    final _cartController = Get.put(CartController());

    final indexOfProduct = _dashboardController.products
        .indexWhere((element) => element.productID == productModel.productID);

    return Obx(
      () => Stack(
        children: [
          Scaffold(
            body: Column(
              children: [
                Stack(
                  children: [
                    Container(
                        height: Get.height * .6,
                        width: Get.width,
                        decoration: BoxDecoration(
                            color: AppColors.cardBgColor,
                            borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(20))),
                        child: Center(
                            child: Image.asset(productModel.productIMG))),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 40, horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomIcon(Icons.arrow_back, () => Get.back()),
                          Obx(
                            () => CustomIcon(
                              _dashboardController.products[indexOfProduct]
                                      .isFavoriteProduct
                                  ? Icons.favorite
                                  : Icons.favorite_outline,
                              () {
                                _dashboardController.products[indexOfProduct]
                                        .isFavoriteProduct =
                                    !_dashboardController
                                        .products[indexOfProduct]
                                        .isFavoriteProduct;

                                if (!_dashboardController.favouriteProducts
                                    .contains(productModel)) {
                                  _dashboardController.favouriteProducts
                                      .add(productModel);
                                } else {
                                  _dashboardController.favouriteProducts
                                      .remove(productModel);
                                }

                                _dashboardController.favouriteProducts
                                    .refresh();
                                _dashboardController.products.refresh();
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productModel.productTitle,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ).tr(),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Text("\$${productModel.productPrice}",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          SizedBox(width: 20),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.amber),
                              Text("4.4",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(width: 10),
                              Row(
                                children: [
                                  Text("(10k ", style: TextStyle(fontSize: 20)),
                                  Text(LocaleKeys.reviews,
                                          style: TextStyle(fontSize: 20))
                                      .tr(),
                                  Text(")", style: TextStyle(fontSize: 20)),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 5),
                      Text(
                        LocaleKeys.choose_your_size,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ).tr(),
                      Row(
                        children: [
                          CustomSizeWidget(
                            size: ProductSize.X,
                            isSelected: true,
                          ),
                          CustomSizeWidget(
                            size: ProductSize.M,
                            isSelected: false,
                          ),
                          CustomSizeWidget(
                            size: ProductSize.L,
                            isSelected: false,
                          ),
                          CustomSizeWidget(
                            size: ProductSize.XL,
                            isSelected: false,
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            if (!_cartController.cartItems
                                .contains(productModel)) {
                              productModel.productSize =
                                  controller.selectedSize.value.name.toString();
                              _cartController.cartItems.add(productModel);

                              _cartController.insertData(productModel);
                              myToast(true, "${LocaleKeys.added_to_cart}");
                            } else {
                              myToast(
                                  true, "${LocaleKeys.purchased_successfully}");
                            }
                          },
                          child: Container(
                            width: Get.width * .85,
                            decoration: BoxDecoration(
                                color: Colors.indigo,
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Center(
                                  child: Text(
                                !_cartController.cartItems
                                        .contains(productModel)
                                    ? LocaleKeys.add_to_cart
                                    : LocaleKeys.buy_now,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ).tr()),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Visibility(
              visible: !_connectionController.isConnected.value,
              child: Scaffold(
                backgroundColor: Colors.black.withOpacity(.4),
                body: Center(
                  child: Text(
                    "No Internet 😟",
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
