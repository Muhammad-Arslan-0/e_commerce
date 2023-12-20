import 'package:flutter/material.dart';
import 'package:get/get.dart';

myToast(bool status, String text) {
  Get.showSnackbar(GetSnackBar(
    message: text,
    duration: Duration(milliseconds: 1500),
    snackPosition: SnackPosition.TOP,
    backgroundColor: status ? Colors.green : Colors.red,
  ));
}
