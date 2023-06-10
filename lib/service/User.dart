import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:salles_app/models/Users.dart';
import 'package:salles_app/service/Auth.dart';

class User {
  Future<Users?> userById(id) async {
    var client = http.Client();
    String? token = await Auth.getToken();

    var uri = Uri.parse('https://salles-app.onrender.com/api/v1/user/$id');
    // var header = {"Accept": "application/json"};
    var response = await client.get(
      uri,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      var json = response.body;
      return usersFromJson(json);
    }
    return null;
  }
  // static Future<Users?> userById(id) async {
  //   String? token = await Auth.getToken();
  //   if (token != null) {
  //     final response = await http.get(
  //       Uri.parse('https://salles-app.onrender.com/api/v1/user/$id'),
  //       headers: {
  //         'Authorization': 'Bearer $token',
  //         'Content-Type': 'application/json',
  //       },
  //     );

  //     if (response.statusCode == 200) {
  //       final responseBody = jsonDecode(response.body);
  //       // Обработка полученных данных
  //       return usersFromJson(responseBody);
  //     } else {
  //       print(id);
  //       print(token);
  //       return null;
  //       // throw Exception('Ошибка при выполнении запроса: ${response.statusCode}');
  //     }
  //   } else {
  //     print('Токен отсутствует, пользователь не авторизован');
  //     // Возвращайте или обрабатывайте ошибку, если требуется
  //     return null;
  //   }
  // }
}
