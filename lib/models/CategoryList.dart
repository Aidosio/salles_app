// To parse this JSON data, do
//
//     final categoryList = categoryListFromJson(jsonString);

import 'dart:convert';

List<CategoryList> categoryListFromJson(String str) =>
    List<CategoryList>.from(json
        .decode(utf8.decode(str.codeUnits))
        .map((x) => CategoryList.fromJson(x)));

String categoryListToJson(List<CategoryList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoryList {
  String id;
  String name;

  CategoryList({
    required this.id,
    required this.name,
  });

  factory CategoryList.fromJson(Map<String, dynamic> json) => CategoryList(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
