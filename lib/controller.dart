import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:ids_backend/sheetfields.dart';

class FormController {
  // Google App Script Web URL.
  static const String URL =
      "https://script.google.com/macros/s/AKfycbwgIeOLZXiFb7k5gR7dfPORTi_-mA_30--ItIY7blGpoFAB-RMRoHvzWJRk46k6rjEHag/exec";

  // Success Status Message
  static const STATUS_SUCCESS = "SUCCESS";

  void submitForm(
      FeedbackForm feedbackForm, void Function(String) callback) async {
    try {
      await http
          .post(Uri.parse(URL), body: feedbackForm.toJson())
          .then((response) async {
        if (response.statusCode == 302) {
          var url = response.headers['location'];
          await http.get(Uri.parse(url!)).then((response) {
            callback(convert.jsonDecode(response.body)['status']);
          });
        } else {
          callback(convert.jsonDecode(response.body)['status']);
        }
      });
    } catch (e) {
      print(e);
    }
  }

  /// Async function which loads feedback from endpoint URL and returns List.
  Future<List<FeedbackForm>> getFeedbackList() async {
    return await http.get(Uri.parse(URL)).then((response) {
      var jsonFeedback = convert.jsonDecode(response.body) as List;
      return jsonFeedback.map((json) => FeedbackForm.fromJson(json)).toList();
    });
  }
}
