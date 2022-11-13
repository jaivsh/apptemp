import 'package:flutter/material.dart';
import 'package:ids_backend/cards/schedule_card.dart';

class Schedule_page extends StatefulWidget {
  const Schedule_page({Key? key}) : super(key: key);

  @override
  State<Schedule_page> createState() => _Schedule_pageState();
}

class _Schedule_pageState extends State<Schedule_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [Schedule_card(), Schedule_card(), Schedule_card()],
      ),
    );
  }
}
