import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:http/http.dart' as http;

class Auth {
  static String? token;

  static Future<void> authenticate(String phoneNumber, String password) async {
    final response = await http.post(
      Uri.parse('https://salles-app.onrender.com/api/v1/auth/authenticate'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({"phone": phoneNumber, "password": password}),
    );

    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      token = responseBody['token'];

      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token!);

      print('Успешная авторизация');
    } else {
      print('Ошибка авторизации: ${response.statusCode}');
    }
  }

  static Future<bool> isLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token == null) {
      return false;
    }

    bool isTokenExpired = JwtDecoder.isExpired(token);
    return !isTokenExpired;
  }

  static Future<bool> checkRole(String expectedRole) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token == null) {
      return false;
    }

    Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
    String userRole = decodedToken['role'];
    return userRole == expectedRole;
  }

  static Future<String?> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token == null) {
      return null;
    }

    Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
    String userId = decodedToken['id'];
    return userId;
  }

  static Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    token = null;
    print('Выход выполнен');
  }

  static Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    return token;
  }
}
