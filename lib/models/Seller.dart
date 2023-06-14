// To parse this JSON data, do
//
//     final seller = sellerFromJson(jsonString);

import 'dart:convert';

Seller sellerFromJson(String str) => Seller.fromJson(json.decode(str));

String sellerToJson(Seller data) => json.encode(data.toJson());

class Seller {
  String id;
  String firstName;
  String lastName;
  String phone;
  String password;
  bool enabled;
  String role;
  String username;
  List<Authority> authorities;
  bool accountNonExpired;
  bool accountNonLocked;
  bool credentialsNonExpired;

  Seller({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.password,
    required this.enabled,
    required this.role,
    required this.username,
    required this.authorities,
    required this.accountNonExpired,
    required this.accountNonLocked,
    required this.credentialsNonExpired,
  });

  factory Seller.fromJson(Map<String, dynamic> json) => Seller(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        phone: json["phone"],
        password: json["password"],
        enabled: json["enabled"],
        role: json["role"],
        username: json["username"],
        authorities: List<Authority>.from(
            json["authorities"].map((x) => Authority.fromJson(x))),
        accountNonExpired: json["accountNonExpired"],
        accountNonLocked: json["accountNonLocked"],
        credentialsNonExpired: json["credentialsNonExpired"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "phone": phone,
        "password": password,
        "enabled": enabled,
        "role": role,
        "username": username,
        "authorities": List<dynamic>.from(authorities.map((x) => x.toJson())),
        "accountNonExpired": accountNonExpired,
        "accountNonLocked": accountNonLocked,
        "credentialsNonExpired": credentialsNonExpired,
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
