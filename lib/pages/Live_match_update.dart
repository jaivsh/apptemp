import 'package:flutter/material.dart';
import 'package:ids_backend/api.dart';

class Live_match_update extends StatefulWidget {
  const Live_match_update({Key? key}) : super(key: key);

  @override
  State<Live_match_update> createState() => _Live_match_updateState();
}

class _Live_match_updateState extends State<Live_match_update> {
  String Team1 = UserSheetsApi.TeamA;
  String Team2 = UserSheetsApi.TeamB;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${Team1} Vs ${Team2}"),
        backgroundColor: Colors.blue,
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: Container(
                height: 100,
                width: 110,
                padding: EdgeInsets.fromLTRB(15, 30, 0, 0),
                color: Colors.white,
                child: Text(
                  "${Team1}",
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Container(
                height: 50,
                width: 65,
                color: Colors.white,
                padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: Text(
                  "123/3",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Container(
                height: 50,
                width: 65,
                color: Colors.white,
                padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: Text(
                  "132/5",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Container(
                height: 100,
                width: 110,
                color: Colors.white,
                padding: const EdgeInsets.fromLTRB(15, 30, 0, 0),
                child: Text(
                  "${Team2}",
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 30),
        Text(
          "Over 19",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.left,
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                height: 40,
                width: 40,
                // color: Colors.red,
                decoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                height: 40,
                width: 40,
                // color: Colors.red,
                decoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                height: 40,
                width: 40,
                // color: Colors.red,
                decoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                height: 40,
                width: 40,
                // color: Colors.red,
                decoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                height: 40,
                width: 40,
                // color: Colors.red,
                decoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                height: 40,
                width: 40,
                // color: Colors.red,
                decoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            padding: EdgeInsets.all(12),
            height: 200,
            width: 380,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(20)),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(children: [
                Text(
                  "Batter",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 200,
                ),
                Text(
                  "Runs",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ]),
              Divider(
                height: 12,
                thickness: 2,
                color: Colors.black,
              ),
              Row(children: [
                Container(
                  width: 250,
                  //  color: Colors.red,
                  child: Text(
                    "Name",
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  width: 50,
                  //  color: Colors.red,
                  child: Text(
                    "34",
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                ),
              ]),
              Divider(
                height: 12,
                thickness: 1,
                color: Colors.black,
              ),
              Row(children: [
                Container(
                  width: 250,
                  //    color: Colors.red,
                  child: Text(
                    "Name",
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  width: 50,
                  //  color: Colors.red,
                  child: Text(
                    "34",
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                ),
              ]),
            ]),
          ),
        ),
      ]),
    );
  }
}
