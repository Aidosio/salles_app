import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:http/http.dart' as http;

class RegService {
  static String? token;

  static Future<void> reg(String firstname, String lastname, String phone,
      String role, String password) async {
    final url =
        Uri.parse('https://salles-app.onrender.com/api/v1/auth/register');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "firstname": firstname,
        "lastname": lastname,
        "phone": phone,
        "role": role,
        "enabled": false,
        "password": password
      }),
    );

    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);
      token = responseBody['token'];

      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token!);

      print('Успешная авторизация $token');
    } else {
      print('Ошибка авторизации: ${response.statusCode}');
    }
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

  static Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    return token;
  }

  // static Future<bool> isLoggedIn() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? token = prefs.getString('token');

  //   if (token == null) {
  //     return false;
  //   }

  //   bool isTokenExpired = JwtDecoder.isExpired(token);
  //   return !isTokenExpired;
  // }
}
