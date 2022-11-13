import 'package:flutter/material.dart';
import 'package:gsheets/gsheets.dart';
import 'package:ids_backend/api.dart';

class UserFields {
  static String serial = 'Serial No.';
  static String player = 'Player';
  static String runs = 'Runs';
  static String balls = 'Balls';

  static List<String> getFields() => [serial, player, runs, balls];
}

class FeedbackForm {
  String name;
  String email;
  String mobileNo;
  String feedback;
  String serial;

  FeedbackForm(
      this.name, this.email, this.mobileNo, this.feedback, this.serial);

  factory FeedbackForm.fromJson(dynamic json) {
    return FeedbackForm("${json['Team 1']}", "${json['Team 2']}",
        "${json['Date']}", "${json['Completed']}", "${json['Serial']}");
  }

  // Method to make GET parameters.
  Map toJson() => {
        'Team 1': name,
        'Team 2': email,
        'date': mobileNo,
        'Completed': feedback,
        'Serial': serial
      };
}

class leaderBoard {
  List leaderboardsheet = UserSheetsApi.leaderboardMaterial;
}
