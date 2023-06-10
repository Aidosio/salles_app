// To parse this JSON data, do
//
//     final companyList = companyListFromJson(jsonString);

import 'dart:convert';

List<CompanyList> companyListFromJson(String str) => List<CompanyList>.from(
    json.decode(str).map((x) => CompanyList.fromJson(x)));

String companyListToJson(List<CompanyList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CompanyList {
  String id;
  String name;
  Owner owner;
  List<dynamic> sellers;
  List<dynamic> purchases;
  List<dynamic> products;

  CompanyList({
    required this.id,
    required this.name,
    required this.owner,
    required this.sellers,
    required this.purchases,
    required this.products,
  });

  factory CompanyList.fromJson(Map<String, dynamic> json) => CompanyList(
        id: json["id"],
        name: json["name"],
        owner: Owner.fromJson(json["owner"]),
        sellers: List<dynamic>.from(json["sellers"].map((x) => x)),
        purchases: List<dynamic>.from(json["purchases"].map((x) => x)),
        products: List<dynamic>.from(json["products"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "owner": owner.toJson(),
        "sellers": List<dynamic>.from(sellers.map((x) => x)),
        "purchases": List<dynamic>.from(purchases.map((x) => x)),
        "products": List<dynamic>.from(products.map((x) => x)),
      };
}

class Owner {
  String id;
  String firstName;
  String lastName;
  String phone;
  String password;
  bool enabled;
  String role;
  bool accountNonExpired;
  bool accountNonLocked;
  bool credentialsNonExpired;
  List<Authority> authorities;
  String username;

  Owner({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.password,
    required this.enabled,
    required this.role,
    required this.accountNonExpired,
    required this.accountNonLocked,
    required this.credentialsNonExpired,
    required this.authorities,
    required this.username,
  });

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        phone: json["phone"],
        password: json["password"],
        enabled: json["enabled"],
        role: json["role"],
        accountNonExpired: json["accountNonExpired"],
        accountNonLocked: json["accountNonLocked"],
        credentialsNonExpired: json["credentialsNonExpired"],
        authorities: List<Authority>.from(
            json["authorities"].map((x) => Authority.fromJson(x))),
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "phone": phone,
        "password": password,
        "enabled": enabled,
        "role": role,
        "accountNonExpired": accountNonExpired,
        "accountNonLocked": accountNonLocked,
        "credentialsNonExpired": credentialsNonExpired,
        "authorities": List<dynamic>.from(authorities.map((x) => x.toJson())),
        "username": username,
      };
}

class Authority {
  String authority;

  Authority({
    required this.authority,
  });

  factory Authority.fromJson(Map<String, dynamic> json) => Authority(
        authority: json["authority"],
      );

  Map<String, dynamic> toJson() => {
        "authority": authority,
      };
}
