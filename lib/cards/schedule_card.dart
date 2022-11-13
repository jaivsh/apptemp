import 'package:flutter/material.dart';
import 'package:ids_backend/api.dart';

class Schedule_card extends StatefulWidget {
  const Schedule_card({Key? key}) : super(key: key);

  @override
  State<Schedule_card> createState() => _Schedule_cardState();
}

class _Schedule_cardState extends State<Schedule_card> {
  List schedulevalues = [];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 370,
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.amber, borderRadius: BorderRadius.circular(15)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: EdgeInsets.fromLTRB(20, 5, 0, 0),
          child: Text(
            "Date and Time",
            style: TextStyle(fontSize: 16),
          ),
        ),
        Divider(
          height: 3,
          thickness: 1.3,
          color: Colors.black,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
          child: Row(
            children: [
              Text(
                "Team name_1",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                width: 12,
              ),
              Text(
                "Vs",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 12,
              ),
              Text(
                "Team name_2",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
