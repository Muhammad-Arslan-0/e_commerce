import 'package:e_commerce/helper/app_colors.dart';
import 'package:e_commerce/helper/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/product_view_controller.dart';

class CustomSizeWidget extends StatelessWidget {
  final ProductSize size;
  final bool isSelected;
  const CustomSizeWidget(
      {super.key, required this.size, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(ProductViewController());
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          controller.changeSize(size);
        },
        child: Obx(
          () => Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                color: controller.selectedSize.value == size
                    ? Colors.indigo
                    : AppColors.cardBgColor,
                borderRadius: BorderRadius.circular(15)),
            child: Center(
                child: Text(
              size.name,
              style: TextStyle(
                  color: controller.selectedSize.value == size
                      ? Colors.white
                      : Colors.black),
            )),
          ),
        ),
      ),
    );
  }
}
