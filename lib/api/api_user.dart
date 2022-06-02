import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Models/user_model.dart';

class ApiServiceUs {

  Future<User> topHeadlines() async {
    final response = await http.get(
        Uri.parse('https://fashionizt.yufagency.com/koneksi_user.php'));
    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load top headlines');
    }
  }
}
