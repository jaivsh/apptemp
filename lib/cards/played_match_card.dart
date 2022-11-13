import 'package:flutter/material.dart';

class Played_match_card extends StatelessWidget {
  const Played_match_card({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      width: 390,
      margin: EdgeInsets.all(2),
      child: Card(
        color: Colors.amber,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 8,
        // margin: EdgeInsets.all(14),
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Date and Time",
                style: TextStyle(fontSize: 17),
              ),
              Divider(
                height: 3,
                thickness: 1.3,
                color: Colors.black,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Team name_1",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "  111/4 ",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 13,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Team name ",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Text(
                    "111/4 ",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 7,
              ),
              Text(
                "VNIT won by 4 wkts",
                style: TextStyle(fontSize: 15),
              )
            ],
          ),
        ),
      ),
    );
  }
}
