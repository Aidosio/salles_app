import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:salles_app/models/Company.dart';
import 'package:salles_app/models/CompanyList.dart';
import 'package:salles_app/service/RegService.dart';

class CompanyService {
  final client = http.Client();

  Future<dynamic> createCompany(String name, String ownerId) async {
    try {
      final uri = Uri.parse('https://salles-app.onrender.com/api/v1/companies');
      final payload = jsonEncode({
        'name': name,
        'owner': {'id': ownerId},
      });
      final headers = {
        'Content-Type': 'application/json',
      };

      final response = await client.post(uri, body: payload, headers: headers);

      if (response.statusCode == 201) {
        print('Company created successfully');
      } else {
        print('Failed to create company. Status code: ${response.statusCode}');
        print('Error response: ${response.body}');
      }
    } catch (e) {
      print('Error creating company: $e');
    }
  }

  Future<List<CompanyList>?> getAllCompany() async {
    try {
      final uri = Uri.parse('https://salles-app.onrender.com/api/v1/companies');
      final headers = {
        'Content-Type': 'application/json; charset=UTF-8',
      };

      final response = await client.get(uri, headers: headers);

      if (response.statusCode == 200) {
        final json = response.body;
        print('egrsdfsd');
        return companyListFromJson(json);
      } else {
        print('Failed to get companies. Status code: ${response.statusCode}');
        print('Error response: ${response.body}');
      }
    } catch (e) {
      print('Error getting companies: $e');
    }

    return null;
  }

  Future<Company?> getCompanyByName(String name) async {
    try {
      final uri = Uri.parse(
          'https://salles-app.onrender.com/api/v1/companies/name/$name');
      final headers = {
        'Content-Type': 'application/json; charset=UTF-8',
      };

      final response = await client.get(uri, headers: headers);

      if (response.statusCode == 200) {
        final json = response.body;
        return companyFromJson(json);
      } else {
        print(
            'Failed to get company by name. Status code: ${response.statusCode}');
        print('Error response: ${response.body}');
      }
    } catch (e) {
      print('Error getting company by name: $e');
    }

    return null;
  }

  Future<void> updateCompanySellers(String companyId, String sellerId) async {
    try {
      final uri = Uri.parse(
          'https://salles-app.onrender.com/api/v1/companies/$companyId/sellers');

      final List<Map<String, String>> sellers = [
        {"id": sellerId}
      ];

      final headers = {
        'Content-Type': 'application/json; charset=UTF-8',
      };
      final body = jsonEncode(sellers);

      final response = await http.put(uri, headers: headers, body: body);

      if (response.statusCode == 200) {
        print('PUT request successful');
      } else {
        print('PUT request failed');
        print('Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      print('Error updating company sellers: $e');
    }
  }

  Future<Company?> getCompanyByOwnerId(String id) async {
    try {
      final token = await RegService.getToken();
      final uri = Uri.parse(
          'https://salles-app.onrender.com/api/v1/companies/owner/$id');
      final headers = {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      };

      final response = await client.get(uri, headers: headers);

      if (response.statusCode == 200) {
        final json = response.body;
        return companyFromJson(json);
      } else {
        print(
            'Failed to get company by name. Status code: ${response.statusCode}');
        print('Error response: ${response.body}');
      }
    } catch (e) {
      print('Error getting company by name: $e');
    }

    return null;
  }

  Future<Company?> getCompanyBySallerId(String id) async {
    try {
      final token = await RegService.getToken();
      final uri = Uri.parse(
          'https://salles-app.onrender.com/api/v1/companies/sellers/$id');
      final headers = {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      };

      final response = await client.get(uri, headers: headers);

      if (response.statusCode == 200) {
        final json = response.body;
        return companyFromJson(json);
      } else {
        print(
            'Failed to get company by name. Status code: ${response.statusCode}');
        print('Error response: ${response.body}');
      }
    } catch (e) {
      print('Error getting company by name: $e');
    }

    return null;
  }

  Future<int?> deleteByCompanySaller(String companyId, String userId) async {
    try {
      final token = await RegService.getToken();
      final uri = Uri.parse(
          'https://salles-app.onrender.com/api/v1/companies/$companyId/users/$userId');
      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };

      final response = await client.delete(uri, headers: headers);
      print(companyId);
      print(userId);
      if (response.statusCode == 204) {
        print('user in company delete successfully');
        return response.statusCode;
      }
      {
        print('Failed to delete company. Status code: ${response.statusCode}');
        print('Error response: ${response.body}');
      }
    } catch (e) {
      print('Error creating company: $e');
    }
  }
}
