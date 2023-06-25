// To parse this JSON data, do
//
//     final salesList = salesListFromJson(jsonString);

import 'dart:convert';

List<SalesList> salesListFromJson(String str) =>
    List<SalesList>.from(json.decode(str).map((x) => SalesList.fromJson(x)));

String salesListToJson(List<SalesList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SalesList {
  String id;
  List<int> createDate;
  dynamic price;
  bool status;
  List<dynamic> productIds;
  List<dynamic> returnProducts;

  SalesList({
    required this.id,
    required this.createDate,
    this.price,
    required this.status,
    required this.productIds,
    required this.returnProducts,
  });

  factory SalesList.fromJson(Map<String, dynamic> json) => SalesList(
        id: json["id"],
        createDate: List<int>.from(json["createDate"].map((x) => x)),
        price: json["price"],
        status: json["status"],
        productIds: List<dynamic>.from(json["productIds"].map((x) => x)),
        returnProducts:
            List<dynamic>.from(json["returnProducts"].map((x) => x)),
      );

  get length => null;

  Map<String, dynamic> toJson() => {
        "id": id,
        "createDate": List<dynamic>.from(createDate.map((x) => x)),
        "price": price,
        "status": status,
        "productIds": List<dynamic>.from(productIds.map((x) => x)),
        "returnProducts": List<dynamic>.from(returnProducts.map((x) => x)),
      };
}
