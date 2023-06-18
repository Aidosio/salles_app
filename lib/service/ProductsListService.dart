import 'package:salles_app/models/ProductsList.dart';
import 'package:http/http.dart' as http;
import 'package:salles_app/service/Auth.dart';

class ProductsListService {
  Future<List<ProductsList>?> getAllProductsByCategoryId(
      String companyId, String categoryName) async {
    var client = http.Client();
    String? token = await Auth.getToken();

    var uri = Uri.parse(
        'https://salles-app.onrender.com/api/v1/product/company/$companyId/category/$categoryName');
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
      return productsListFromJson(json);
    }
    return null;
  }
}
