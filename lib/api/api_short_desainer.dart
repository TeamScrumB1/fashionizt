import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Models/desainer_model.dart';

class ApiServiceDes {
  Future<DesainerElement> topHeadlines() async {
    final response = await http.get(
        Uri.parse('https://fashionizt.yufagency.com/shorting_desainer.php'));
    if (response.statusCode == 200) {
      return DesainerElement.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load top headlines');
    }
  }
}
