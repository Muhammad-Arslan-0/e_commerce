import 'package:e_commerce/services/shared_pref_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  var isDarkMode = false.obs;
  @override
  void onInit() {
    getThemeFromPref();
    super.onInit();
  }

  getThemeFromPref() async {
    bool? theme = await SharedPrefServices.getThemeFromPref();
    if (theme == null) {
      isDarkMode.value = false;
    } else {
      isDarkMode.value = theme;
    }

    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    SharedPrefServices.setThemeToPref(isDarkMode.value);
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }
}
