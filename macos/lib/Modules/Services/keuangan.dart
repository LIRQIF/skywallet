import 'dart:convert';

import 'package:http/http.dart' show Client;
import 'package:skywallet/Modules/Models/Auth/Commands/commands.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skywallet/Modules/Models/Keuangan.dart';

class KeuanganService {
  final String baseUrl = "http://10.0.2.2:8000";
  Client client = Client();

  Future<List<Map<String, dynamic>>> addKeuangan(KeuanganModel data) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token_key');
    final header = {
      'Accept': 'application/json',
      'Authorization': "Bearer $token",
      'content-type': 'application/json',
    };
    final response = await client.post(
      Uri.parse("$baseUrl/api/v1/keuangan/add"),
      headers: header,
      body: KeuanganModelToJson(data),
    );

    var responseData = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return [
        {
          "message": "success",
          "body": responseData['message'],
        }
      ];
    } else if (response.statusCode == 422 || response.statusCode == 401) {
      // Validation failed
      return [
        {"message": "failed", "body": responseData['message']}
      ];
    } else {
      return [
        {"message": "failed", "body": "Unknown error"}
      ];
    }
  }

  Future<List<Counttotalmodels>> gettotal() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token_key');
    final header = {
      'Accept': 'application/json',
      'Authorization': "Bearer $token",
      'content-type': 'application/json',
    };
    final response = await client.get(
      Uri.parse("$baseUrl/api/v1/keuangan/count_total"),
      headers: header,
    );

    if (response.statusCode == 200) {
      return CounttotalmodelsFromJson(response.body);
    } else {
      return null;
    }
  }
}
