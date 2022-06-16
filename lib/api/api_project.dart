import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Models/project_model.dart';


class ApiServiceProject {
  Future<Project> topHeadlines() async {
    final response = await http.get(
        Uri.parse('https://fashionizt.yufagency.com/project.php'));
    if (response.statusCode == 200) {
      return Project.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load top headlines');
    }
  }
}