import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gsheets/gsheets.dart';
import 'package:ids_backend/sheetfields.dart';
import 'package:http/http.dart' as http;
import 'controller.dart';

class UserSheetsApi {
  static const credentials = r'''
{
  "type": "service_account",
  "project_id": "idsapp-367514",
  "private_key_id": "3f6cd1909851fb1ef97ce904efdbb1e94c077f68",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCysFYRHItDHWoy\nwXKY6VqR9L7wV3nLkHZZyiC3PMEnuM1Zz1oHwdv1El8a5spwr7LJwhfzg8hTwcNa\nZLx0dEp4vuHZJxZ1WudgtS0h471EYicApjozae+8bfVl1YLXBusnvnWPqw3PFPvI\n1FB5at9hRj+Q7jIcNdSNGMpvfemT2y7lCbAerH18bjKNzMdjeQAM13Bd7kEF2yfY\n68bPwAaj4XQ5Y0YgKqJl1hponPlwPVAP/BliQG1LhAFmiI4kfSpfmMTTFeHH7dzQ\nmhoT1V00mS87T6w44uE89PgxFqWSm9365KMpS5wiOyO0QCQ9ELU/Kn3e93VXhZe9\nydupVJ1nAgMBAAECggEAOEm06vH/anZnIDLw6vtDRQwAY8xieP36UiGKeb5BKEae\nJWbceOoX5FTTsbE23xVxr/2ctuBx5/R3Gc/2z4ZceTnEAjg+alxm239nBrBrTBHR\nMHKsjcqWstg+f8Qo0ZyD0gK8nLOpB20YPXSoHv9L+6P53SkzjtBkMsg26LUUsbbH\nt3PprmJhcTtv9Fk3B+C+YQcOViWqGH5oVzfh+V9oV8X+v4rcoZMOsu7xyb1Nf0D2\nlahZB9OD1NOVPDwFijlJ0EFoPyXta4bgo9QzgVrPTJ7icnPaYXgHk3SM9EyzZ1Tb\nn1Rwt2/Qh/D7AnnX3LkxAu2Sp7IjTVEcK7Y3ux7FaQKBgQDux/rxg/Yf05FdYcTJ\nTUSayJJu24awJ/3h/gaAGuU+/LF2Q6lsIOLS5aZv+SXXiKPD4LgaKEmm861MXPMQ\nvRFZSJ8B5lHEFV6jdbu7VJ7Qk238UMkgbYHIUiaSPv75D1OShqbPCBpTgiqlbtX3\nuF1mm7zzfUFdaDs3u6ZWfIuAPwKBgQC/kwVeQXp0mut81yX9lu4GvcT6zFq0Izts\nyNgUbQbavCvDYtkd88CDO3FcPg+hLOsjVOIQAIMp9rOFMVlNFsiT1MxVIY1qwQ7b\n+KDigbQFVf0y4xs9xfri8dXwVGtkhAXvQTm6z0AT6HIF4edD0WCrA3+5hlBK3rMr\nwvEGyTEY2QKBgHmqegnvlEw5L/tl4rAzZ756bmp//svpRKqPFd7WVXLXrNC2vy/y\nPcD59OlfCNIetFsNOKFTX9vqk6WyQsOHorxcjXCZW5ZO0S72wVY9UsKyLDuBKkoU\noilg+nhQEvjyv0GMzJf25/se+v3aULntPeIXfpqOeuzOPEY0nhe5VBdfAoGAdlB7\ngUHZOgivpTNO8DX1nU44SFhLMHON8Np9sOfA0vhh4tK6mqf+3k2o7joZ9wXB1tlG\noHFgkFsfdgQLTfPjPoGvDGijaSoAXlRIMHvATYdUz8e4/Ea4cs6+vSW2CacL7z6O\nQ9RZk7H8MavZ42V9WUDY8iCEmCi/6SgFKZa57skCgYB+MZz58Vcpvnu5zgJ93q59\n5/CVEekXTGY0T3E15xwSIylJhSlJY3goKsPuQ9sd6kq4XJZJ2R5odM2qVZImAeFw\nksXBI/5ZxxGTIVPbKDTLSQB6Bvob9jUzEU8PdCr0OQksuxd8Z13yT+z7ZCfBaTC1\nhqRGcTbjWSxSvHKprB/Lhg==\n-----END PRIVATE KEY-----\n",
  "client_email": "idsappbackend@idsapp-367514.iam.gserviceaccount.com",
  "client_id": "101193501222030579447",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/idsappbackend%40idsapp-367514.iam.gserviceaccount.com"
}

''';

  static const sheetid = '1COH4LmB1F-6WMKKBCQJD7SXvzmcbozUSO_zkpNJM9jE';
  List<FeedbackForm> feedbackItems = <FeedbackForm>[];
  static final gsheets = GSheets(credentials);
  static Worksheet? spreadsheet, leaderboard, schedule, matchsheet;
  static String schedulelist = '';
  static String spreadsheetTitle = '';
  static List leaderboardMaterial = [];
  static List scheduleMaterial = [];
  static int curovers = 0;
  static int curballs = 0;
  static int runsinthisover = 0;
  static String TeamA = '';
  static String TeamB = '';
  static String TotalScoreteam1 = '';
  static String TotalWicketsteam1 = '';
  static String TotalScoreteam2 = '';
  static String TotalWicketsteam2 = '';

  static void selectSpreadsheet() {
    DateTime now = DateTime.now();
    int day = now.day;
    int months = now.month;
    if (day == 12 && months == 11) {
      spreadsheetTitle = "match1";
    } else if (day == 13 && months == 11) {
      spreadsheetTitle = "match1";
    } else if (day == 14 && months == 11) {
      spreadsheetTitle = "match2";
    } else if (day == 15 && months == 11) {
      spreadsheetTitle = "match2";
    } else if (day == 16 && months == 11) {
      spreadsheetTitle = "match3";
    } else if (day == 17 && months == 11) {
      spreadsheetTitle = "match4";
    } else if (day == 18 && months == 11) {
      spreadsheetTitle = "match5";
    } else if (day == 19 && months == 11) {
      spreadsheetTitle = "match6";
    } else if (day == 20 && months == 11) {
      spreadsheetTitle = "match7";
    } else if (day == 21 && months == 11) {
      spreadsheetTitle = "match8";
    } else if (day == 22 && months == 11) {
      spreadsheetTitle = "match8";
    } else if (day == 23 && months == 11) {
      spreadsheetTitle = "match8";
    } else {
      spreadsheetTitle = '';
    }
  }

  static Future init() async {
    selectSpreadsheet();
    try {
      final sheet = await gsheets.spreadsheet(sheetid);
      spreadsheet = await _getWorksheet(sheet, title: 'ids1');
      leaderboard = await _getWorksheet(sheet, title: 'leaderboard');
      schedule = await _getWorksheet(sheet, title: 'schedule');
      matchsheet = await _getWorksheet(sheet, title: 'match1');

      final firstrow = UserFields.getFields();
      spreadsheet!.values.insertRow(1, firstrow);
      getLeaderBoard();
      getSchedule();
      getMatchDetails();
    } catch (e) {
      print('Error occured: $e');
    }
  }

  static Future getLeaderBoard() async {
    if (leaderboard == null) return null;
    final jsonleaderboard = await leaderboard!.values.map.allRows();
    print(jsonleaderboard);
    var stiff = jsonleaderboard![9]["Position"];
    print(stiff);
    leaderboardMaterial = jsonleaderboard;
  }

  static Future getSchedule() async {
    if (schedule == null) return null;
    final jsonleaderboard = await schedule!.values.map.allRows();
    print(jsonleaderboard);
    var stiff = jsonleaderboard![2]["Team A"];
    print(stiff);
    scheduleMaterial = jsonleaderboard;
  }

  static Future getMatchDetails() async {
    if (schedule == null) return null;
    final jsonleaderboard = await matchsheet!.values.map.allRows();
    print(jsonleaderboard);
    String? stiff = jsonleaderboard![23]["Overs"];
    String? stiff1 = jsonleaderboard[23]["OvCom"];
    String? stiff2 = jsonleaderboard[24]["OvCom"];
    String? stiff3 = jsonleaderboard[24]["OvCom"];
    TeamA = stiff!;
    TeamB = stiff1!;
    TotalScoreteam1 = stiff2!;
    TotalWicketsteam1 = stiff3!;
    print(TotalScoreteam1);
    scheduleMaterial = jsonleaderboard;
  }

  static Future insert1(int serial, List<String> row) async {
    if (spreadsheet == null) return;
    spreadsheet!.values.insertRow(serial, row);
  }

  static Future insert(List<Map<String, dynamic>> rowlist) async {
    if (spreadsheet == null) return;
    //spreadsheet!.values.map.appendRows(rowlist);
    spreadsheet!.values.insertRow(2, [1, 'cocaine', 78, 39]);
  }

  static Future _getWorksheet(Spreadsheet sheet,
      {required String title}) async {
    try {
      return await sheet.addWorksheet(title);
    } catch (e) {
      return sheet.worksheetByTitle(title)!;
    }
  }
}
