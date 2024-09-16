import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/country_code.dart';

class ApiService {
  final http.Client client;
  final String baseUrl = "https://test-api.kacs.my/api";
  final String baseToken = 'Bearer YOUR_TOKEN';

  ApiService(this.client);

  // A generic method to handle GET requests
  Future<Map<String, dynamic>> get(String endpoint) async {
    final response = await client.get(
      Uri.parse('$baseUrl/$endpoint'),
      headers: {
        'Authorization': baseToken,
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  }

  Future<Map<String, dynamic>> post(
      String endpoint, Map<String, dynamic> body) async {
    print('Sending POST request to $baseUrl/$endpoint');
    print('Request body: $body');

    final response = await client.post(
      Uri.parse('$baseUrl/$endpoint'),
      headers: {
        'Authorization': baseToken,
        'Content-Type': 'application/json',
      },
      body: json.encode(body),
    );

    print('Response status code: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(
          'Failed to register: ${response.statusCode}\nResponse: ${response.body}');
    }
  }

  Future<Map<String, dynamic>> validateOtp(
      String identifier, String code) async {
    print('Validating OTP for identifier: $identifier with code: $code');

    final response = await client.post(
      Uri.parse('$baseUrl/validateOtp'),
      headers: {
        'Authorization': baseToken,
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {
        'identifier': identifier,
        'code': code,
      },
    );

    print('Response status code: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(
          'Failed to validate OTP: ${response.statusCode}\nResponse: ${response.body}');
    }
  }

  Future<List<Country>> getCountryCodes() async {
    final response = await client.get(
      Uri.parse('$baseUrl/countryCode'),
      headers: {
        'Authorization': baseToken,
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final countryCodeResponse =
          CountryCode.fromJson(json.decode(response.body));
      return countryCodeResponse.data;
    } else {
      throw Exception('Failed to load country codes: ${response.statusCode}');
    }
  }

  Future<Map<String, dynamic>> postLogin(String phone) async {
    print('Attempting to login with phone: $phone');

    final response = await client.post(
      Uri.parse('$baseUrl/login'),
      headers: {
        'Authorization': baseToken,
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {
        'identifier': phone,
      },
    );

    print('Response status code: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(
          'Failed to login: ${response.statusCode}\nResponse: ${response.body}');
    }
  }
}
