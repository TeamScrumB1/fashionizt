import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Models/produk_model.dart';

class ApiServiceProd {
  Future<Produk> topHeadlines() async {
    final response = await http.get(
        Uri.parse('https://fashionizt.yufagency.com/koneksi_produk.php'));
    if (response.statusCode == 200) {
      return Produk.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load top headlines');
    }
  }
}