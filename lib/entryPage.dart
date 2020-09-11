import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'networking.dart';

import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grouped_checkbox/grouped_checkbox.dart';

class EntryPage extends StatefulWidget {
  @override
  State createState() => new EntryPageState();
}

class EntryPageState extends State<EntryPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTime();
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: initScreen(context),
  //   );
  // }

  startTime() async {
    var duration = new Duration(seconds: 3);
    return new Timer(duration, null);
  }

  int count = 0;
  int count2 = 0;

  TextEditingController _ageTextController = TextEditingController();
  TextEditingController _glucoseTextController = TextEditingController();
  TextEditingController _bmiTextController = TextEditingController();
  TextEditingController _insulinTextController = TextEditingController();
  TextEditingController _bpTextController = TextEditingController();
  TextEditingController _skinTextController = TextEditingController();
  TextEditingController _dpTextController = TextEditingController();
  TextEditingController _pregnancyTextController = TextEditingController();
  TextEditingController _resultTextController = TextEditingController();
  TextEditingController _urlEntryController = TextEditingController();

  _onClear() {
    setState(() {
      _ageTextController.text = "";
      _glucoseTextController.text = "";
      _bmiTextController.text = "";
      _insulinTextController.text = "";
      _bpTextController.text = "";
      _skinTextController.text = "";
      _dpTextController.text = "";
      _pregnancyTextController.text = "";
      _resultTextController.text = "";
      // _urlEntryController.text = "";
      count = 0;
      count2 = 0;
    });
  }

  String url = "http://192.168.137.1:5000";
  // String url = "";
  var parseddata;
  String content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.shortestSide * 0.02),
                child: Container(
                  child: Text(
                    'Diabetes classifier',
                    style: GoogleFonts.lato(
                      textStyle: TextStyle(
                        color: Colors.black,
                        letterSpacing: .4,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            Padding(
              //abcd
              padding: const EdgeInsets.only(
                  left: 60.0, top: 15.0, right: 65.0, bottom: 5.0),
              child: TextFormField(
                  controller: _pregnancyTextController,
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                      color: Colors.black,
                      letterSpacing: .4,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  decoration: new InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.indigoAccent, width: 1.0),
                      // borderRadius: const BorderRadius.all(
                      //   const Radius.circular(25.0),
                      // ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.indigoAccent, width: 1.0),
                    ),
                    hintText: 'Pregnancy',
                    hintStyle: GoogleFonts.lato(
                      textStyle: TextStyle(
                        color: Colors.grey,
                        letterSpacing: .4,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    contentPadding: const EdgeInsets.only(
                        top: 8.0, bottom: 8.0, right: 8.0, left: 15.0),
                  )),
            ),

            Padding(
              padding: const EdgeInsets.only(
                  left: 60.0, top: 5.0, right: 65.0, bottom: 5.0),
              child: TextFormField(
                  controller: _glucoseTextController,
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                      color: Colors.black,
                      letterSpacing: .4,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  decoration: new InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.indigoAccent, width: 1.0),
                      // borderRadius: const BorderRadius.all(
                      //   const Radius.circular(25.0),
                      // ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.indigoAccent, width: 1.0),
                    ),
                    hintText: 'Glucose value',
                    hintStyle: GoogleFonts.lato(
                      textStyle: TextStyle(
                        color: Colors.grey,
                        letterSpacing: .4,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    contentPadding: const EdgeInsets.only(
                        top: 8.0, bottom: 8.0, right: 8.0, left: 15.0),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 60.0, top: 5.0, right: 65.0, bottom: 5.0),
              child: TextFormField(
                  controller: _bpTextController,
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                      color: Colors.black,
                      letterSpacing: .4,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  decoration: new InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.indigoAccent, width: 1.0),
                      // borderRadius: const BorderRadius.all(
                      //   const Radius.circular(25.0),
                      // ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.indigoAccent, width: 1.0),
                    ),
                    hintText: 'Blood pressure',
                    hintStyle: GoogleFonts.lato(
                      textStyle: TextStyle(
                        color: Colors.grey,
                        letterSpacing: .4,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    contentPadding: const EdgeInsets.only(
                        top: 8.0, bottom: 8.0, right: 8.0, left: 15.0),
                  )),
            ),

            Padding(
              padding: const EdgeInsets.only(
                  left: 60.0, top: 5.0, right: 65.0, bottom: 5.0),
              child: TextFormField(
                  controller: _skinTextController,
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                      color: Colors.black,
                      letterSpacing: .4,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  decoration: new InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.indigoAccent, width: 1.0),
                      // borderRadius: const BorderRadius.all(
                      //   const Radius.circular(25.0),
                      // ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.indigoAccent, width: 1.0),
                    ),
                    hintText: 'Skin Thickness',
                    hintStyle: GoogleFonts.lato(
                      textStyle: TextStyle(
                        color: Colors.grey,
                        letterSpacing: .4,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    contentPadding: const EdgeInsets.only(
                        top: 8.0, bottom: 8.0, right: 8.0, left: 15.0),
                  )),
            ),

            Padding(
              padding: const EdgeInsets.only(
                  left: 60.0, top: 5.0, right: 65.0, bottom: 5.0),
              child: TextFormField(
                  controller: _insulinTextController,
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                      color: Colors.black,
                      letterSpacing: .4,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  decoration: new InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.indigoAccent, width: 1.0),
                      // borderRadius: const BorderRadius.all(
                      //   const Radius.circular(25.0),
                      // ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.indigoAccent, width: 1.0),
                    ),
                    hintText: 'Insulin level',
                    hintStyle: GoogleFonts.lato(
                      textStyle: TextStyle(
                        color: Colors.grey,
                        letterSpacing: .4,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    contentPadding: const EdgeInsets.only(
                        top: 8.0, bottom: 8.0, right: 8.0, left: 15.0),
                  )),
            ),

            Padding(
              padding: const EdgeInsets.only(
                  left: 60.0, top: 5.0, right: 65.0, bottom: 5.0),
              child: TextFormField(
                  controller: _bmiTextController,
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                      color: Colors.black,
                      letterSpacing: .4,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  decoration: new InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.indigoAccent, width: 1.0),
                      // borderRadius: const BorderRadius.all(
                      //   const Radius.circular(25.0),
                      // ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.indigoAccent, width: 1.0),
                    ),
                    hintText: 'BMI value',
                    hintStyle: GoogleFonts.lato(
                      textStyle: TextStyle(
                        color: Colors.grey,
                        letterSpacing: .4,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    contentPadding: const EdgeInsets.only(
                        top: 8.0, bottom: 8.0, right: 8.0, left: 15.0),
                  )),
            ),

            Padding(
              padding: const EdgeInsets.only(
                  left: 60.0, top: 5.0, right: 65.0, bottom: 5.0),
              child: TextFormField(
                  controller: _dpTextController,
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                      color: Colors.black,
                      letterSpacing: .4,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  decoration: new InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.indigoAccent, width: 1.0),
                      // borderRadius: const BorderRadius.all(
                      //   const Radius.circular(25.0),
                      // ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.indigoAccent, width: 1.0),
                    ),
                    hintText: 'Diabetes Pedigree',
                    hintStyle: GoogleFonts.lato(
                      textStyle: TextStyle(
                        color: Colors.grey,
                        letterSpacing: .4,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    contentPadding: const EdgeInsets.only(
                        top: 8.0, bottom: 8.0, right: 8.0, left: 15.0),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 60.0, top: 5.0, right: 65.0, bottom: 5.0),
              child: TextFormField(
                  controller: _ageTextController,
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                      color: Colors.black,
                      letterSpacing: .4,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  decoration: new InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.indigoAccent, width: 1.0),
                      // borderRadius: const BorderRadius.all(
                      //   const Radius.circular(25.0),
                      // ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.indigoAccent, width: 1.0),
                    ),
                    hintText: 'Age',
                    hintStyle: GoogleFonts.lato(
                      textStyle: TextStyle(
                        color: Colors.grey,
                        letterSpacing: .4,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    contentPadding: const EdgeInsets.only(
                        top: 8.0, bottom: 8.0, right: 8.0, left: 15.0),
                  )),
            ),

            // Padding(
            //   //abcd
            //   padding: const EdgeInsets.only(
            //       left: 60.0, top: 5.0, right: 65.0, bottom: 15.0),
            //   child: TextFormField(
            //       controller: _resultTextController,
            //       style: GoogleFonts.lato(
            //         textStyle: TextStyle(
            //           color: Colors.black,
            //           letterSpacing: .4,
            //           fontSize: 15.0,
            //           fontWeight: FontWeight.w400,
            //         ),
            //       ),
            //       decoration: new InputDecoration(
            //         focusedBorder: OutlineInputBorder(
            //           borderSide:
            //               BorderSide(color: Colors.indigoAccent, width: 1.0),
            //           // borderRadius: const BorderRadius.all(
            //           //   const Radius.circular(25.0),
            //           // ),
            //         ),
            //         enabledBorder: OutlineInputBorder(
            //           borderSide:
            //               BorderSide(color: Colors.indigoAccent, width: 1.0),
            //         ),
            //         hintText: 'Result',
            //         hintStyle: GoogleFonts.lato(
            //           textStyle: TextStyle(
            //             color: Colors.grey,
            //             letterSpacing: .4,
            //             fontSize: 15.0,
            //             fontWeight: FontWeight.w400,
            //           ),
            //         ),
            //         contentPadding: const EdgeInsets.only(
            //             top: 8.0, bottom: 8.0, right: 8.0, left: 15.0),
            //       )),
            // ),

            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 60.0),
                  child: FlatButton(
                      color: Colors.indigoAccent,
                      onPressed: () {
                        // print(int.parse(_ageTextController.text).runtimeType);

                        // print(double.parse(_ageTextController.text));
                        // print(double.parse(_glucoseTextController.text));
                        // print(double.parse(_bmiTextController.text));
                        // print(double.parse(_insulinTextController.text));
                        // print(double.parse(_bpTextController.text));
                        // print(double.parse(_skinTextController.text));
                        // print(double.parse(_dpTextController.text));
                        // print(double.parse(_pregnancyTextController.text));

                        // print(_ageTextController.text);
                        // print(_glucoseTextController.text);
                        // print(_bmiTextController.text);
                        // print(_insulinTextController.text);
                        // print(_bpTextController.text);
                        // print(_skinTextController.text);
                        // print(_dpTextController.text);
                        // print(_pregnancyTextController.text);

                        // print(_urlEntryController.text);

                        // if(double.parse(_ageTextController.text)==36.0)
                        // {
                        //   print('Hello Its working');
                        // }
                        // else
                        // {
                        //   print('Try again its not working');
                        // }

                        if (double.parse(_glucoseTextController.text) > 140.0) {
                          count++;
                        }
                        if (double.parse(_bmiTextController.text) >= 30.0) {
                          count++;
                        }
                        if (count == 2) {
                          /* This is a diabetic case*/

                          // _resultTextController.text =
                          //     "The patient is affected by Type 2 Diabetes";
                          // print("Type 2");

                          //new logic from here
                          if (double.parse(_insulinTextController.text) ==
                              0.0) {
                            _resultTextController.text =
                                "The patient is affected by Type 1 Diabetes";
                            print("Type 1");
                          } else {
                            _resultTextController.text =
                                "The patient is affected by Type 2 Diabetes";
                            print("Type 2");
                          }
                          //new logic addition till here

                          count = 0;
                          count2 = 0;
                        } else if (count == 0) {
                          //print("Not Type 2");
                          if (double.parse(_pregnancyTextController.text) >
                              7.0) {
                            count2++;
                          }
                          if (double.parse(_ageTextController.text) > 30.0) {
                            count2++;
                          }
                          if (count2 == 2) {
                            /* This is a diabetic case*/

                            // _resultTextController.text =
                            //     "The patient is affected by Type 2 Diabetes";
                            // print("Type 2");

                            //new logic from here
                            if (double.parse(_insulinTextController.text) ==
                                0.0) {
                              _resultTextController.text =
                                  "The patient is affected by Type 1 Diabetes";
                              print("Type 1");
                            } else {
                              _resultTextController.text =
                                  "The patient is affected by Type 2 Diabetes";
                              print("Type 2");
                            }
                            //new logic addition till here

                            count = 0;
                            count2 = 0;
                          } else {
                            /* This is not a diabetic case*/

                            // _resultTextController.text =
                            //     "This is not Type 2 Diabetes";
                            // print("Not Type 2");

                            //new text for outcome '0'
                            _resultTextController.text =
                                "The patient is not diabetic";
                            print("Not diabetic");
                            count = 0;
                            count2 = 0;
                          }
                        } else if (count == 1) {
                          if (double.parse(_pregnancyTextController.text) >
                              7.0) {
                            count2++;
                          }
                          // else
                          // {
                          //   print("Not Type 2");
                          // }
                          if (double.parse(_ageTextController.text) > 30.0) {
                            count2++;
                          }
                          if (count2 >= 1) {
                            /* This is a diabetic case*/

                            // _resultTextController.text =
                            //     "The patient is affected by Type 2 Diabetes";
                            // print("Type 2");

                            //new logic from here
                            if (double.parse(_insulinTextController.text) ==
                                0.0) {
                              _resultTextController.text =
                                  "The patient is affected by Type 1 Diabetes";
                              print("Type 1");
                            } else {
                              _resultTextController.text =
                                  "The patient is affected by Type 2 Diabetes";
                              print("Type 2");
                            }
                            //new logic addition till here

                            count = 0;
                            count2 = 0;
                          } else {
                            /* This is not a diabetic case*/

                            // _resultTextController.text = "Not Type 2";
                            // print("Not Type 2");

                            //new text for outcome '0'
                            _resultTextController.text =
                                "The patient is not diabetic";
                            print("Not diabetic");

                            count = 0;
                            count2 = 0;
                          }
                        }
                        // CircularProgressIndicator(
                        //   backgroundColor: Colors.blueAccent,
                        //   strokeWidth: 1,
                        // );
                        return showDialog(
                          context: context,
                          builder: (context) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  left: 8.0,
                                  right: 8.0,
                                  top: 8.0,
                                  bottom: 330.0),
                              child: Center(
                                child: AlertDialog(
                                  // Retrieve the text the that user has entered by using the
                                  // TextEditingController.
                                  elevation: 10.0,
                                  backgroundColor: Colors.indigoAccent[300],
                                  // content: Column(
                                  //     children: <Widget>[

                                  //     ],
                                  //   )
                                  content: Column(
                                    children: <Widget>[
                                      // CircleAvatar(
                                      //   radius: 50.0,
                                      //   backgroundImage: AssetImage(
                                      //       "assets/images/medicalshield.jpg"),
                                      // ),
                                      Text(
                                        'RESULT',
                                        style: GoogleFonts.raleway(
                                          textStyle: TextStyle(
                                            color: Colors.indigoAccent,
                                            letterSpacing: .4,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Divider(
                                          color: Colors.indigoAccent,
                                          thickness: 2,
                                        ),
                                      ),
                                      Text(
                                        _resultTextController.text,
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.lato(
                                          textStyle: TextStyle(
                                            color: Colors.indigoAccent,
                                            letterSpacing: .4,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        // padding: const EdgeInsets.only(
                                        //     top: 70.0, left: 00.0),
                                        padding: EdgeInsets.only(
                                            top: MediaQuery.of(context)
                                                    .size
                                                    .shortestSide *
                                                0.16,
                                            left: 00.0),
                                        child: SizedBox(
                                          width: 320.0,
                                          child: FlatButton(
                                              color: Colors.indigoAccent,
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              shape: RoundedRectangleBorder(
                                                  // borderRadius:
                                                  //     BorderRadius.circular(
                                                  //         0.0),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          bottomLeft: Radius
                                                              .circular(15.0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  15.0),
                                                          topLeft:
                                                              Radius.circular(
                                                                  15.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  15.0)),
                                                  side: BorderSide(
                                                      color:
                                                          Colors.indigoAccent)),
                                              child: Text(
                                                'CLOSE',
                                                style: GoogleFonts.lato(
                                                  textStyle: TextStyle(
                                                    color: Colors.white,
                                                    letterSpacing: .4,
                                                    fontSize: 12.0,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              )),
                                        ),
                                      ),
                                    ],
                                  ),
                                  // Divider(
                                  //   color: Colors.white,
                                  // ),

                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: Text(
                        'PROCESS',
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                            color: Colors.white,
                            letterSpacing: .4,
                            fontSize: 12.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50.0),
                  child: FlatButton(
                      color: Colors.white,
                      onPressed: () {
                        _onClear();
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0.0),
                          side: BorderSide(color: Colors.indigoAccent)),
                      child: Text(
                        'RESET',
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                            color: Colors.indigoAccent,
                            letterSpacing: .4,
                            fontSize: 12.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )),
                ),
              ],
            ),
            // Padding(
            //   padding: const EdgeInsets.all(10.0),
            //   child: Align(
            //     alignment: Alignment.bottomLeft,
            //     child: Text(
            //       'Your Recommendations...',
            //       style: GoogleFonts.lato(
            //         textStyle: TextStyle(
            //           color: Colors.black,
            //           letterSpacing: .4,
            //           fontSize: 15.0,
            //           fontWeight: FontWeight.w400,
            //         ),
            //       ),
            //     ),
            //   ),
            // ),

//            FlatButton(
//              onPressed: () async {
//                var patientData = {
//                  'age': _ageTextController.text,
//                  'glucose': _glucoseTextController.text,
//                  'bmi': _bmiTextController.text,
//                  'insulin': _insulinTextController.text,
//                  'bp': _bpTextController.text,
//                  'skin': _skinTextController.text,
//                  'dp': _dpTextController.text,
//                  'pregnancy': _pregnancyTextController.text,
//                };
//                content =
//                await NetworkHelper(url + '/upload').postData(patientData);
//                print(content);
//                setState() {
//                  if (content == '1') {
//                    _resultTextController.text = "The patient is diabetic";
//                  }
//                  if (content == '0') {
//                    _resultTextController.text = "The patient is not diabetic";
//                  }
//                }
//              },
//              child: Text("Process using ml backend"),
//            ),

            Padding(
              padding: const EdgeInsets.only(
                  left: 60.0, top: 5.0, right: 65.0, bottom: 5.0),
              child: TextFormField(
                  controller: _urlEntryController,
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                      color: Colors.black,
                      letterSpacing: .4,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  decoration: new InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.indigoAccent, width: 1.0),
                      // borderRadius: const BorderRadius.all(
                      //   const Radius.circular(25.0),
                      // ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.indigoAccent, width: 1.0),
                    ),
                    hintText: 'IPv4 address',
                    hintStyle: GoogleFonts.lato(
                      textStyle: TextStyle(
                        color: Colors.grey,
                        letterSpacing: .4,
                        fontSize: 12.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    contentPadding: const EdgeInsets.only(
                        top: 8.0, bottom: 8.0, right: 8.0, left: 15.0),
                  )),
            ),

            FlatButton(
              color: Colors.indigoAccent,
              child: Text(
                'Process using ml backend',
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    color: Colors.white,
                    letterSpacing: .4,
                    fontSize: 12.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              onPressed: () async {
                // NetworkHelper(url).url = _urlEntryController.text;

                url = _urlEntryController.text;

                // url = "http://192.168.137.1:5000";

                // NetworkHelper networkHelper = new NetworkHelper(url);
                // networkHelper.url = _urlEntryController.text;

                var patientData = {
                  'age': _ageTextController.text,
                  'glucose': _glucoseTextController.text,
                  'bmi': _bmiTextController.text,
                  'insulin': _insulinTextController.text,
                  'bp': _bpTextController.text,
                  'skin': _skinTextController.text,
                  'dp': _dpTextController.text,
                  'pregnancy': _pregnancyTextController.text,
                };
                content =
                    await NetworkHelper(url + '/upload').postData(patientData);
                print(content);
//                      setState() {
                if (content == '1') {
//                  _resultTextController.text = "The patient is diabetic";
                  if (double.parse(_insulinTextController.text) == 0.0) {
                    _resultTextController.text =
                        "The patient is affected by Type 1 Diabetes";
                  } else {
                    _resultTextController.text =
                        "The patient is affected by Type 2 Diabetes";
                  }
                  count = 0;
                  count2 = 0;
                }
                if (content == '0') {
                  _resultTextController.text = "The patient is not diabetic";
                }

                return showDialog(
                  context: context,
                  builder: (context) {
                    return Padding(
                      padding: EdgeInsets.only(
                          left: 8.0, right: 8.0, top: 8.0, 
                          bottom: 330.0),
                          // bottom: MediaQuery.of(context).size.shortestSide * 0.1),
                      child: Center(
                        child: AlertDialog(
                          // Retrieve the text the that user has entered by using the
                          // TextEditingController.
                          elevation: 10.0,
                          backgroundColor: Colors.indigoAccent[300],
                          // content: Column(
                          //     children: <Widget>[

                          //     ],
                          //   )
                          content: Column(
                            children: <Widget>[
                              // CircleAvatar(
                              //   radius: 50.0,
                              //   backgroundImage: AssetImage(
                              //       "assets/images/medicalshield.jpg"),
                              // ),
                              Text(
                                'RESULT',
                                style: GoogleFonts.raleway(
                                  textStyle: TextStyle(
                                    color: Colors.indigoAccent,
                                    letterSpacing: .4,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Divider(
                                  color: Colors.indigoAccent,
                                  thickness: 2,
                                ),
                              ),
                              Text(
                                _resultTextController.text,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                    color: Colors.indigoAccent,
                                    letterSpacing: .4,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 70.0, left: 00.0),
                                child: SizedBox(
                                  width: 320.0,
                                  child: FlatButton(
                                      color: Colors.indigoAccent,
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      shape: RoundedRectangleBorder(
                                          // borderRadius:
                                          //     BorderRadius.circular(
                                          //         0.0),
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(15.0),
                                              bottomRight:
                                                  Radius.circular(15.0),
                                              topLeft: Radius.circular(15.0),
                                              topRight: Radius.circular(15.0)),
                                          side: BorderSide(
                                              color: Colors.indigoAccent)),
                                      child: Text(
                                        'CLOSE',
                                        style: GoogleFonts.lato(
                                          textStyle: TextStyle(
                                            color: Colors.white,
                                            letterSpacing: .4,
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      )),
                                ),
                              ),
                            ],
                          ),
                          // Divider(
                          //   color: Colors.white,
                          // ),

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
