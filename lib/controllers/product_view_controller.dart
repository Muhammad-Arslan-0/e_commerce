import 'package:get/get.dart';

import '../helper/app_constants.dart';

class ProductViewController extends GetxController {
  var selectedSize = ProductSize.X.obs;

  changeSize(ProductSize value) {
    selectedSize.value = value;
  }
}
