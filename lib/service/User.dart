import 'package:http/http.dart' as http;
import 'package:salles_app/models/Users.dart';
import 'package:salles_app/service/Auth.dart';

class User {
  final client = http.Client();

  Future<Users?> userById(id) async {
    String? token = await Auth.getToken();

    var uri = Uri.parse('https://salles-app.onrender.com/api/v1/user/$id');
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

  Future<int?> activateUser(id) async {
    String? token = await Auth.getToken();

    var uri =
        Uri.parse('https://salles-app.onrender.com/api/v1/user/$id/enable');
    var response = await client.post(
      uri,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      print('Пользователь успешно активирован');
      return response.statusCode;
    }
    return null;
  }

  Future<int?> disabledUser(id) async {
    String? token = await Auth.getToken();

    var uri =
        Uri.parse('https://salles-app.onrender.com/api/v1/user/$id/disable');
    var response = await client.post(
      uri,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      print('Пользователь успешно активирован');
      return response.statusCode;
    }
    return null;
  }

  Future<int?> deleteUser(id) async {
    String? token = await Auth.getToken();

    var uri = Uri.parse('https://salles-app.onrender.com/api/v1/user/$id');
    var response = await client.delete(
      uri,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      print('Пользователь успешно активирован');
      return response.statusCode;
    }
    return null;
  }
}
