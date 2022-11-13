import 'package:flutter/material.dart';
import 'package:gsheets/gsheets.dart';
import 'package:ids_backend/api.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ids_backend/sheetfields.dart';

class leaderBoard extends StatefulWidget {
  const leaderBoard({super.key});

  @override
  State<leaderBoard> createState() => _leaderBoardState();
}

class _leaderBoardState extends State<leaderBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Leaderboard')),
    );
  }
}
