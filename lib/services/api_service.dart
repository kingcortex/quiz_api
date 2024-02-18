import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:quiz_api/model/question_model.dart';

class ApiService {
  // ignore: constant_identifier_names
  static const String API_KEY = "BSomiq1IbHViTEEC3AIx0JqXfKC3Y2ZSMEkBEtgh";

  static Future<List<Question>?> getQuestionByCaterory(String category) async {
    try {
      Uri url = Uri.parse(
          "https://quizapi.io/api/v1/questions?apiKey=$API_KEY&limit=10&category=$category");
      final response = await http.get(url);

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        List<Question> questions = [];
        for (var e in data) {
          Question question = Question.fromJson(e);
          questions.add(question);
        }
        print(response.body);
        return questions;
      } else {
        return null;
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }

      return null;
    }
  }


  static Future<List<Question>?> getRandomQuestion() async {
    try {
      Uri url = Uri.parse(
          "https://quizapi.io/api/v1/questions?apiKey=$API_KEY");
      final response = await http.get(url);

      if (response.statusCode == 200) {
        List<dynamic> data = jsonDecode(response.body);
        List<Question> questions = [];
        for (var e in data) {
          Question question = Question.fromJson(e);
          questions.add(question);
        }
        print(response.body);
        return questions;
      } else {
        return null;
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }

      return null;
    }
  }

  
}
