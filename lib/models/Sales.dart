// To parse this JSON data, do
//
//     final sales = salesFromJson(jsonString);

import 'dart:convert';

Sales salesFromJson(String str) => Sales.fromJson(json.decode(str));

String salesToJson(Sales data) => json.encode(data.toJson());

class Sales {
  String id;
  List<int> createDate;
  dynamic price;
  bool status;
  dynamic productIds;
  dynamic returnProducts;

  Sales({
    required this.id,
    required this.createDate,
    this.price,
    required this.status,
    this.productIds,
    this.returnProducts,
  });

  factory Sales.fromJson(Map<String, dynamic> json) => Sales(
        id: json["id"],
        createDate: List<int>.from(json["createDate"].map((x) => x)),
        price: json["price"],
        status: json["status"],
        productIds: json["productIds"],
        returnProducts: json["returnProducts"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "createDate": List<dynamic>.from(createDate.map((x) => x)),
        "price": price,
        "status": status,
        "productIds": productIds,
        "returnProducts": returnProducts,
      };
}
