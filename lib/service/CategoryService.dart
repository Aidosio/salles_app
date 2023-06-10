import 'package:http/http.dart' as http;
import 'package:salles_app/models/CategoryList.dart';
import 'package:salles_app/service/Auth.dart';

class CategoryService {
  Future<List<CategoryList>?> getAllCategory() async {
    var client = http.Client();
    String? token = await Auth.getToken();

    var uri = Uri.parse('https://salles-app.onrender.com/api/v1/category');
    // var header = {"Accept": "application/json"};
    var response = await client.get(
      uri,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      var json = response.body;
      return categoryListFromJson(json);
    }
    return null;
  }
}
