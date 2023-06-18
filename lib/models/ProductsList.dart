// To parse this JSON data, do
//
//     final productsList = productsListFromJson(jsonString);

import 'dart:convert';

List<ProductsList> productsListFromJson(String str) =>
    List<ProductsList>.from(json
        .decode(utf8.decode(str.codeUnits))
        .map((x) => ProductsList.fromJson(x)));

String productsListToJson(List<ProductsList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductsList {
  String id;
  String name;
  double price;
  String barcode;
  int count;
  Category category;
  List<int> createdDate;
  List<int> updatedDate;

  ProductsList({
    required this.id,
    required this.name,
    required this.price,
    required this.barcode,
    required this.count,
    required this.category,
    required this.createdDate,
    required this.updatedDate,
  });

  factory ProductsList.fromJson(Map<String, dynamic> json) => ProductsList(
        id: json["id"],
        name: json["name"],
        price: json["price"].toDouble(),
        barcode: json["barcode"],
        count: json["count"],
        category: Category.fromJson(json["category"]),
        createdDate: List<int>.from(json["createdDate"].map((x) => x)),
        updatedDate: List<int>.from(json["updatedDate"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "barcode": barcode,
        "count": count,
        "category": category.toJson(),
        "createdDate": createdDate,
        "updatedDate": updatedDate,
      };
}

class Category {
  String id;
  String name;

  Category({
    required this.id,
    required this.name,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
