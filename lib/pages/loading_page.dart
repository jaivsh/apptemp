import 'package:flutter/material.dart';

class Loading_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Figma Flutter Generator Pg1Widget - FRAME
    return Container(
        //width: 360,
        //height: 800,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              // begin: Alignment(6.123234262925839e-17,1),
              // end: Alignment(-1,6.123234262925839e-17),
              colors: [
                Color.fromRGBO(39, 12, 222, 1),
                Color.fromRGBO(0, 0, 4, 1)
              ]),
        ),
        child: Stack(children: <Widget>[
          Positioned(
              top: -102,
              left: -65,
              child: Container(
                  width: 498,
                  height: 972,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/batsman.png'),
                        fit: BoxFit.fitWidth),
                  ))),
          const Positioned(
              top: 664,
              left: 130,
              child: Text(
                'CRICKET',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.redAccent,
                    //fontFamily: 'Montserrat',
                    fontSize: 40,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1),
              )),
          Positioned(
              top: 696,
              left: 70,
              child: Text(
                'TOURNAMENT',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.redAccent,
                    //fontFamily: 'Montserrat',
                    fontSize: 40,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.bold,
                    height: 1),
              )),
        ]));
  }
}
