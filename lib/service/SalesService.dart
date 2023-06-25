import 'package:salles_app/models/SalesList.dart';
import 'package:http/http.dart' as http;

import '../models/ProductIdsList.dart';
import '../models/Sales.dart';
import 'Auth.dart';

class SalesService {
  Future<List<SalesList>?> getAllSales(String companyId) async {
    var client = http.Client();
    String? token = await Auth.getToken();

    var uri =
        Uri.parse('https://salles-app.onrender.com/api/v1/sales/$companyId');
    var response = await client.get(
      uri,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      var json = response.body;
      return salesListFromJson(json);
    }
    return null;
  }

  Future<Sales?> getSales(String id) async {
    var client = http.Client();
    String? token = await Auth.getToken();

    var uri = Uri.parse('https://salles-app.onrender.com/api/v1/sales/get/$id');
    var response = await client.get(
      uri,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      var json = response.body;
      return salesFromJson(json);
    }

    return null;
  }

  Future<List<ProductIdsList>?> getSalesList(String id) async {
    var client = http.Client();
    String? token = await Auth.getToken();

    var uri = Uri.parse('https://salles-app.onrender.com/api/v1/sales/get/$id');
    var response = await client.get(
      uri,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      var json = response.body;
      return productIdsListFromJson(json);
    }

    return null;
  }

  // Future<Sales?> getSales(String id) async {
  //   var client = http.Client();
  //   String? token = await Auth.getToken();

  //   var uri = Uri.parse('https://salles-app.onrender.com/api/v1/sales/get/$id');
  //   var response = await client.get(
  //     uri,
  //     headers: {
  //       'Authorization': 'Bearer $token',
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //   );
  //   if (response.statusCode == 200) {
  //     var json = response.body;
  //     return salesFromJson(json);
  //   }
  //   return null;
  // }

  Future<Sales?> createSales(String id) async {
    var client = http.Client();
    String? token = await Auth.getToken();

    var uri = Uri.parse(
        'https://salles-app.onrender.com/api/v1/sales/create?companyId=$id');
    var body = {'companyId': id};

    var response = await client.post(
      uri,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      var json = response.body;
      return salesFromJson(json);
    }
    return null;
  }

  Future<String?> calculateTotalPrice(String id) async {
    var client = http.Client();
    String? token = await Auth.getToken();

    var uri = Uri.parse(
        'https://salles-app.onrender.com/api/v1/sales/total-price/$id');

    var response = await client.post(
      uri,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      var json = response.body;
      return json;
    }
    return null;
  }

  Future<Sales?> returnProdutsSales(String salesId, String productId) async {
    var client = http.Client();
    String? token = await Auth.getToken();

    var uri = Uri.parse(
        'https://salles-app.onrender.com/api/v1/sales/return-product/$salesId?productId=$productId&quantity=1');
    var response = await client.put(
      uri,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      var json = response.body;
      return salesFromJson(json);
    }
    return null;
  }

  Future<int?> deleteSales(String id) async {
    var client = http.Client();
    String? token = await Auth.getToken();

    var uri =
        Uri.parse('https://salles-app.onrender.com/api/v1/sales/delete/$id');

    var response = await client.delete(
      uri,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      return response.statusCode;
    }
    return null;
  }
}
