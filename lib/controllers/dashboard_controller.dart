import 'package:e_commerce/helper/app_images.dart';
import 'package:e_commerce/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../generated/locale_keys.g.dart';
import '../views/cart_screen.dart';
import '../views/favorite_screen.dart';
import '../views/home_screen.dart';
import '../views/notification_screen.dart';
import '../views/setting_screen.dart';

class DashboardController extends GetxController {
  List<Widget> screens = [
    HomeScreen(),
    FavoriteScreen(),
    CartScreen(),
    NotificationScreen(),
    SettingScreen()
  ];
  List<String> appBarTitles = [
    LocaleKeys.home,
    LocaleKeys.favorites,
    LocaleKeys.cart,
    LocaleKeys.notification,
    LocaleKeys.settings,
  ];
  RxList<ProductModel> favouriteProducts = <ProductModel>[].obs;

  RxList<ProductModel> products = [
    ProductModel(
        productID: 01,
        productIMG: AppImages.cardImage1,
        productTitle: LocaleKeys.the_basic_tree,
        productPrice: 44.29,
        isFavoriteProduct: false),
    ProductModel(
        productID: 02,
        productIMG: AppImages.cardImage2,
        productTitle: LocaleKeys.the_advance_skirt,
        productPrice: 30.99,
        isFavoriteProduct: false),
    ProductModel(
        productID: 03,
        productIMG: AppImages.cardImage3,
        productTitle: LocaleKeys.the_max_tree,
        productPrice: 55.93,
        isFavoriteProduct: false),
    ProductModel(
        productID: 04,
        productIMG: AppImages.cardImage4,
        productTitle: LocaleKeys.fashion_shirts,
        productPrice: 25.99,
        isFavoriteProduct: false),
    ProductModel(
        productID: 05,
        productIMG: AppImages.cardImage5,
        productTitle: LocaleKeys.the_basic_tree,
        productPrice: 35.21,
        isFavoriteProduct: false),
    ProductModel(
        productID: 06,
        productIMG: AppImages.cardImage6,
        productTitle: LocaleKeys.the_advance_skirt,
        productPrice: 55.01,
        isFavoriteProduct: false),
    ProductModel(
        productID: 07,
        productIMG: AppImages.cardImage1,
        productTitle: LocaleKeys.the_max_tree,
        productPrice: 111.99,
        isFavoriteProduct: false),
    ProductModel(
        productID: 08,
        productIMG: AppImages.cardImage2,
        productTitle: LocaleKeys.fashion_shirts,
        productPrice: 99.99,
        isFavoriteProduct: false),
  ].obs;
  Rx<int> currentIndex = 0.obs;
  changeBottomIndex(int index) {
    currentIndex.value = index;
  }

  var productData = <ProductModel>[].obs;
}
