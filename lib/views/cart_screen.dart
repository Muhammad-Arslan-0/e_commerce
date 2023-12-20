import 'package:e_commerce/controllers/cart_controller.dart';
import 'package:e_commerce/widgets/no_product_widget.dart';
import 'package:e_commerce/widgets/snackbars.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import '../generated/locale_keys.g.dart';
import '../widgets/cart_item_box.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CartController());
    return Obx(
      () => Scaffold(
          body: controller.cartItems.isEmpty && controller.isRequest.value
              ? NoProductWidget(text: LocaleKeys.no_product_in_cart)
              : !controller.isRequest.value
                  ? Shimmer.fromColors(
                      baseColor: Colors.transparent,
                      highlightColor: Colors.indigo.shade100,
                      period: Duration(seconds: 2),
                      child: Container(
                        width: Get.width,
                        height: Get.height,
                        color: Colors.white,
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            ListView.builder(
                                primary: false,
                                shrinkWrap: true,
                                itemCount: controller.cartItems.length,
                                itemBuilder: (context, index) {
                                  return CartItemBox(
                                      controller.cartItems[index], index);
                                }),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Container(
                                    height: 70,
                                    width: 70,
                                    decoration: BoxDecoration(
                                        color: Colors.indigo,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.bus_alert,
                                          color: Colors.white,
                                          size: 25,
                                        ),
                                        Text("FREE",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18))
                                      ],
                                    )),
                                SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      LocaleKeys.total,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ).tr(),
                                    Text(
                                      "\$${controller.totalAmount.value.toStringAsFixed(2)}",
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                          decoration: TextDecoration.underline,
                                          decorationColor: Colors.grey),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(height: 20),
                            Center(
                              child: GestureDetector(
                                onTap: () {
                                  controller.clearAllProducts();
                                  controller.cartItems.clear();
                                  myToast(
                                      true, LocaleKeys.purchased_successfully);
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
                                      LocaleKeys.purchase_now,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ).tr()),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )),
    );
  }
}
