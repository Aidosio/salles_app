// To parse this JSON data, do
//
//     final users = usersFromJson(jsonString);

import 'dart:convert';

Users usersFromJson(String str) => Users.fromJson(json.decode(str));

String usersToJson(Users data) => json.encode(data.toJson());

class Users {
  String id;
  String firstName;
  String lastName;
  String phone;
  String password;
  bool enabled;
  String role;
  List<Authority> authorities;
  String username;
  bool accountNonExpired;
  bool accountNonLocked;
  bool credentialsNonExpired;

  Users({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.password,
    required this.enabled,
    required this.role,
    required this.authorities,
    required this.username,
    required this.accountNonExpired,
    required this.accountNonLocked,
    required this.credentialsNonExpired,
  });

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        phone: json["phone"],
        password: json["password"],
        enabled: json["enabled"],
        role: json["role"],
        authorities: List<Authority>.from(
            json["authorities"].map((x) => Authority.fromJson(x))),
        username: json["username"],
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
        "authorities": List<dynamic>.from(authorities.map((x) => x.toJson())),
        "username": username,
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
