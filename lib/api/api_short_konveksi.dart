import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/konveksi_model.dart';

class ApiService {
  Future<Konveksi> topHeadlines() async {
    final response = await http.get(
        Uri.parse('https://fashionizt.yufagency.com/shorting_konveksi.php'));
    if (response.statusCode == 200) {
      return Konveksi.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load top headlines');
    }
  }
}
