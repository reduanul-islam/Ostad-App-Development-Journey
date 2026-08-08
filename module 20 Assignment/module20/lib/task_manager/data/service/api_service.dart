import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  Future<Map<String, dynamic>> postRequest(
    String url,
    Map<String, dynamic> body,
  ) async {
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(body),
      );

      return jsonDecode(response.body);
    } catch (e) {
      return {
        'status': 'fail',
        'data': 'Something went wrong',
      };
    }
  }

  Future<Map<String, dynamic>> postWithToken(
    String url,
    Map<String, dynamic> body,
    String token,
  ) async {
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'token': token,
        },
        body: jsonEncode(body),
      );

      return jsonDecode(response.body);
    } catch (e) {
      return {
        'status': 'fail',
        'data': 'Something went wrong',
      };
    }
  }

  Future<Map<String, dynamic>> getRequest(
    String url,
    String token,
  ) async {
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'token': token,
        },
      );

      return jsonDecode(response.body);
    } catch (e) {
      return {
        'status': 'fail',
        'data': 'Something went wrong',
      };
    }
  }
}