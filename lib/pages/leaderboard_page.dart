import 'package:flutter/material.dart';

class Leaderboard_page extends StatefulWidget {
  const Leaderboard_page({Key? key}) : super(key: key);

  @override
  State<Leaderboard_page> createState() => _Leaderboard_pageState();
}

class _Leaderboard_pageState extends State<Leaderboard_page> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.red[400],
              title:
                  Text("Rank          Team         Pts         P     W     L"),
            ),
            body: ListView.builder(
                itemCount: 50,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) => ListTile(
                    tileColor: Colors.white70,
                    leading: Icon(Icons.group),
                    title: Text("Team"),
                    trailing: Text(
                      "$index             ${index + 1}           ${index + 2}",
                    )))));
  }
}
