import 'dart:convert';

import 'package:http/http.dart' as http;

import '../HomeScreen/model.dart';

class ApiHelper {
  ApiHelper._();

  static ApiHelper apiHelper = ApiHelper._();

  Future<QuizModel?> getData() async {
    String apiLink =
        "https://opentdb.com/api.php?amount=10&category=27&difficulty=easy&type=multiple";
    var response = await http.get(Uri.parse(apiLink));
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return QuizModel.fromJson(json);
    }
    return null;
  }
}
