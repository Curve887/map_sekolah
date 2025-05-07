import 'dart:convert';
import 'package:app_map_sekolah/app/data/model/school_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "http://192.168.1.18/api_realprj";

  static Future<Map<String, dynamic>> login(
    String username,
    String password,
  ) async {
    final url = Uri.parse("$baseUrl/login.php");
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "username": username, // sebelumnya "nim"
        "password": password,
      }),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Gagal terhubung ke server");
    }
  }

  static Future<List<Datum>> fetchSchools() async {
    final url = Uri.parse("$baseUrl/get_schools.php");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      if (jsonResponse['isSuccess']) {
        List data = jsonResponse['data'];
        return data.map((item) => Datum.fromJson(item)).toList();
      } else {
        throw Exception("Gagal mengambil data sekolah");
      }
    } else {
      throw Exception("Terjadi kesalahan server");
    }
  }
}
