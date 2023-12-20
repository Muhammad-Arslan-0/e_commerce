class ProductModel {
  int productID;
  String productIMG;
  String productTitle;
  double productPrice;
  bool isFavoriteProduct;
  String productSize;
  int quantity;
  ProductModel(
      {this.productSize = "X",
      this.quantity = 1,
      required this.productID,
      required this.productIMG,
      required this.productTitle,
      required this.productPrice,
      required this.isFavoriteProduct});
  Map<String, dynamic> toMap() {
    return {
      "productID": productID,
      "productIMG": productIMG,
      "productTitle": productTitle,
      "productPrice": productPrice,
      "isFavoriteProduct": isFavoriteProduct ? 1 : 0,
      "productSize": productSize,
      "quantity": quantity
    };
  }


  factory ProductModel.fromMap(Map<String, dynamic> json) {
    return ProductModel(
        productID: json["productID"],
        productIMG: json["productIMG"],
        productTitle: json["productTitle"],
        productPrice: json["productPrice"],
        isFavoriteProduct: json["isFavoriteProduct"] == 0 ? false : true,
        productSize: json["productSize"],
        quantity: json["quantity"]);
  }

  // void incrementCounter(){
  //   quantity++;
  // }
}
