// To parse this JSON data, do
//
//     final products = productsFromJson(jsonString);

import 'dart:convert';

Products productsFromJson(String str) =>
    Products.fromJson(json.decode(utf8.decode(str.codeUnits)));

String productsToJson(Products data) => json.encode(data.toJson());

class Products {
  String id;
  String name;
  dynamic price;
  String barcode;
  int count;
  Category category;
  List<int> createdDate;
  List<int> updatedDate;

  Products({
    required this.id,
    required this.name,
    required this.price,
    required this.barcode,
    required this.count,
    required this.category,
    required this.createdDate,
    required this.updatedDate,
  });

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        id: json["id"],
        name: json["name"],
        price: json["price"],
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
        "createdDate": List<dynamic>.from(createdDate.map((x) => x)),
        "updatedDate": List<dynamic>.from(updatedDate.map((x) => x)),
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
