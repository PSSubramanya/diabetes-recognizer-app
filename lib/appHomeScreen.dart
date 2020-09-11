import 'package:animated_card/animated_card.dart';
import 'package:diabetes_recognizer/entryPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import 'package:grouped_checkbox/grouped_checkbox.dart';

class HomeDisplay extends StatefulWidget {
  @override
  State createState() => new HomeDisplayState();
  // State<StatefulWidget> createState() {
  //   return HomeDisplayState();
}

class HomeDisplayState extends State<HomeDisplay> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: initScreen(context),
    );
  }

  startTime() async {
    var duration = new Duration(seconds: 3);
    return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => EntryPage()));
  }

  initScreen(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.shortestSide * 0.1),
              child: CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage("assets/images/diabetesicon.png"),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.shortestSide * 0.06),
                child: Container(
                  child: Text(
                    'Diabetes classifier',
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                        color: Colors.black,
                        letterSpacing: .4,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            CircularProgressIndicator(
              backgroundColor: Colors.white,
              strokeWidth: 1,
            ),
          ],
        ),
      ),
    );
  }
}

// class HomeDisplayState extends State<HomeDisplay> {

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: <Widget>[
//           Padding(
//             padding: EdgeInsets.only(
//                 top: MediaQuery.of(context).size.shortestSide * 0.1),
//             child: CircleAvatar(
//               radius: 50.0,
//               backgroundImage: AssetImage("assets/images/diabetesicon.png"),
//             ),
//           ),
//           Align(
//             alignment: Alignment.center,
//             child: Padding(
//               padding: EdgeInsets.only(
//                   top: MediaQuery.of(context).size.shortestSide * 0.06),
//               child: Container(
//                 child: Text(
//                   'Diabetes classifier',
//                   style: GoogleFonts.lato(
//                     textStyle: TextStyle(
//                       color: Colors.black,
//                       letterSpacing: .4,
//                       fontSize: 16.0,
//                       fontWeight: FontWeight.w400,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
