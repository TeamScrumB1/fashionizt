import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/desainer_model.dart';

class ApiService {

  Future<Desainer> topHeadlines() async {
    final response = await http.get(
        Uri.parse('https://fashionizt.yufagency.com/koneksi_desainer.php'));
    if (response.statusCode == 200) {
      return Desainer.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load top headlines');
    }
  }
}
