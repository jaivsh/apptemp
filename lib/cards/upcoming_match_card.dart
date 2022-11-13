import 'package:flutter/material.dart';

class Upcoming_match_card extends StatefulWidget {
  const Upcoming_match_card({Key? key}) : super(key: key);

  @override
  State<Upcoming_match_card> createState() => _Upcoming_match_cardState();
}

class _Upcoming_match_cardState extends State<Upcoming_match_card> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 370,
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.amber, borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: EdgeInsets.all(8),
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
          Row(
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
                  fontSize: 45,
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
        ]),
      ),
    );
  }
}
