import 'dart:convert';
import 'dart:ffi';

import 'package:salles_app/models/ProductsList.dart';
import 'package:http/http.dart' as http;
import 'package:salles_app/service/Auth.dart';

class ProductsListService {
  Future<String?> createProduct(String companyId, String categoryName,
      String name, double price, String barcode, int count) async {
    var client = http.Client();
    String? token = await Auth.getToken();
    var uri = Uri.parse(
        'https://salles-app.onrender.com/api/v1/product/company/$companyId/category/$categoryName');

    var body = {
      "name": name,
      "price": price.toString(),
      "barcode": barcode,
      "count": count.toString()
    };

    var response = await client.post(
      uri,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(body),
    );

    if (response.statusCode == 200) {
      return 'Успешно создано';
    } else {
      return 'Ошибка при создании';
    }
  }

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

  Future<int?> deletePoduct(String id) async {
    String? token = await Auth.getToken();
    var client = http.Client();
    var uri = Uri.parse('https://salles-app.onrender.com/api/v1/product/$id');
    var response = await client.delete(
      uri,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      print('Товар успешно удален');
      return response.statusCode;
    }
    return null;
  }

  Future<void> updateProduct(String companyId, String categoryName) async {
    final url = Uri.parse(
        'https://salles-app.onrender.com/api/v1/product/company/$companyId/category/$categoryName');

    final Map<String, dynamic> requestBody = {
      "name": "Milk correct",
      "price": 99999,
      "count": 9999,
      "category": "Milk"
    };

    final headers = {
      'Content-Type': 'application/json; charset=UTF-8',
    };

    try {
      final response = await http.put(
        url,
        headers: headers,
        body: json.encode(requestBody),
      );

      if (response.statusCode == 200) {
        // Успешно выполнено обновление товара
        print('Product updated successfully');
      } else {
        // Обработка ошибки при выполнении запроса
        print('Failed to update product. Error: ${response.statusCode}');
      }
    } catch (error) {
      // Обработка ошибок сети или других исключений
      print('Error updating product: $error');
    }
  }
}
