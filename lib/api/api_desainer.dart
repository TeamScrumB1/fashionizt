import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Models/desainer_model.dart';

class ApiServiceDes {

  Future<DesainerElement> topHeadlines() async { //Desainer
    final response = await http.get(
        Uri.parse('https://api.yufagency.com/public/api/desainer'));
    if (response.statusCode == 200) {
      return DesainerElement.fromJson(json.decode(response.body)); //Desainer
    } else {
      throw Exception('Failed to load top headlines');
    }
  }
}
