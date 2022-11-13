import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ids_backend/cards/live_match_card.dart';
import 'package:ids_backend/cards/played_match_card.dart';
import 'package:ids_backend/cards/upcoming_match_card.dart';

class Live_match_page extends StatefulWidget {
  const Live_match_page({Key? key}) : super(key: key);

  @override
  State<Live_match_page> createState() => _Live_match_pageState();
}

class _Live_match_pageState extends State<Live_match_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(5),
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Live_match_card(),
            const SizedBox(height: 17),
            const Text(
              "Upcoming Matches",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Container(
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  Upcoming_match_card(),
                ],
              ),
            ),
            const SizedBox(height: 17),
            const Text(
              "Last Match Played",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Played_match_card(),
          ],
        ),
      ),
    );
  }
}
