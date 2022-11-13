import 'package:flutter/material.dart';
import 'package:ids_backend/api.dart';

class Live_match_card extends StatefulWidget {
  const Live_match_card({Key? key}) : super(key: key);

  @override
  State<Live_match_card> createState() => _Live_match_cardState();
}

class _Live_match_cardState extends State<Live_match_card> {
  String Livematchteam1 = UserSheetsApi.TeamA;
  String Livematchteam2 = UserSheetsApi.TeamB;
  String tst1 = UserSheetsApi.TotalScoreteam1;
  String tsst2 = UserSheetsApi.TotalWicketsteam1;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed("/live_match_update");
      },
      child: Container(
        padding: EdgeInsets.all(5),
        height: 140,
        width: 400,
        child: Card(
          color: Colors.amber,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                Container(
                  height: 30,
                  width: 70,
                  child: Card(
                    color: Colors.red,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(children: [
                      SizedBox(
                        width: 4,
                      ),
                      Icon(
                        Icons.circle,
                        color: Colors.white,
                        size: 10,
                      ),
                      Text(
                        " LIVE",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ]),
                  ),
                ),
              ]),
              Padding(
                padding: EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "${Livematchteam1}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      width: 110,
                    ),
                    Text(
                      "${tst1}/${tsst2}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: Row(
                  children: [
                    Text(
                      "${Livematchteam2}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      width: 110,
                    ),
                    Text(
                      "111/4",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                  padding: EdgeInsets.all(5), child: Text("Comments on match"))
            ],
          ),
        ),
      ),
    );
  }
}
