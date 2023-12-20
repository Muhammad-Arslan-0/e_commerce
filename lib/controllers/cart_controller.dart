import 'package:get/get.dart';

import '../database/database_helper.dart';
import '../models/product_model.dart';

class CartController extends GetxController {
  var totalAmount = 0.0.obs;
  var isRequest = false.obs;

  void increment(ProductModel value) {
    value.quantity++;
    updateQuantity(value);
  }

  void decrement(ProductModel value) {
    value.quantity--;
    updateQuantity(value);
  }

  void insertData(ProductModel productModel) async {
    await DatabaseHelper.instance.insert(productModel);
  }

  var cartItems = List<ProductModel>.empty(growable: true).obs;

  Future getProducts() async {
    var cartProducts = await DatabaseHelper.instance.queryAllRows();
    for (var product in cartProducts) {
      cartItems.add(ProductModel.fromMap(product));
    }
    isRequest.value = true;
  }

  Future deleteProduct(int id) async {
    await DatabaseHelper.instance.delete(id);
  }

  Future updateQuantity(ProductModel productModel) async {
    await DatabaseHelper.instance
        .updateQuantity(productModel.productID, productModel.quantity);
  }

  Future clearAllProducts() async {
    DatabaseHelper.instance.clearTable();
  }

  @override
  void onInit() {
    getProducts();
    super.onInit();
  }
}
