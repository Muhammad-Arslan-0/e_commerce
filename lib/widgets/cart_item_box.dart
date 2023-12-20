import 'package:e_commerce/controllers/cart_controller.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../helper/app_colors.dart';
import '../models/product_model.dart';
import '../views/product_view_screen.dart';

Widget CartItemBox(ProductModel productModel, int index) {
  final controller=Get.put(CartController());
  var amount = 0.0;
  for (var i in controller.cartItems) {
    amount = amount + (i.productPrice * i.quantity);
  }

  Future.delayed(Duration(milliseconds: 10), () {
    controller.totalAmount.value = amount;
    controller.totalAmount.refresh();
  });
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: GestureDetector(
      onTap: () {
        Get.to(() => ProductViewScreen(), arguments: productModel);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.cardBgColor,
            ),
            child: Image.asset(productModel.productIMG),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  productModel.productTitle,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ).tr(),
                Text(
                  "Size: ${productModel.productSize}",
                  style: TextStyle(color: Colors.grey, fontSize: 20),
                ),
                Text(
                  "\$${productModel.productPrice.toString()}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller.increment(productModel);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(7),
                            border: Border.all(color: Colors.indigo, width: 2)),
                        child: Icon(
                          Icons.add,
                          color: Colors.indigo,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "${productModel.quantity.toString()}",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        if (productModel.quantity > 1) {
                          controller.decrement(productModel);
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(7),
                            border: Border.all(color: Colors.indigo, width: 2)),
                        child: Icon(
                          Icons.remove,
                          color: Colors.indigo,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          GestureDetector(
              onTap: () {
                controller.cartItems.remove(productModel);
                controller.deleteProduct(productModel.productID);
              },
              child: Icon(Icons.clear, size: 40))
        ],
      ),
    ),
  );
}
