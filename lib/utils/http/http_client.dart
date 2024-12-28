import 'dart:convert';
import 'package:Privado_Vpn/common/widgets/loaders.dart';
import 'package:http/http.dart' as http;

class SolitaryhttpClient {
  // Helper method to make a GET request
  static Future<Map<String, dynamic>> get(String endpoint) async {
    final response = await http.get(Uri.parse('$endpoint'));
    return _handleResponse(response);
  }

  // Handle the HTTP response
  static Map<String, dynamic> _handleResponse(http.Response response) {
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  }
}
