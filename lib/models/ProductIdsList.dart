// To parse this JSON data, do
//
//     final productIdsList = productIdsListFromJson(jsonString);

import 'dart:convert';

List<ProductIdsList> productIdsListFromJson(String str) =>
    List<ProductIdsList>.from(
        json.decode(str).map((x) => ProductIdsList.fromJson(x)));

String productIdsListToJson(List<ProductIdsList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductIdsList {
  String productId;
  int quantity;

  ProductIdsList({
    required this.productId,
    required this.quantity,
  });

  factory ProductIdsList.fromJson(Map<String, dynamic> json) => ProductIdsList(
        productId: json["productId"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "productId": productId,
        "quantity": quantity,
      };
}
