import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:firebase_database/firebase_database.dart';
import 'dart:async';

import '../providers/Profile.dart';

class QuarantineDate extends StatefulWidget {
  QuarantineDate({Key key}) : super(key: key);

  @override
  _QuarantineDateState createState() => _QuarantineDateState();
}

class _QuarantineDateState extends State<QuarantineDate> {
  DateTime _currentDate;

  // DateTime _checkDate(int value) {
  //   print("Value given by .periodic funtion is: $value");

  //   return DateTime.now();
  // }

  @override
  void initState() {
    _currentDate = DateTime.now();
    Timer.periodic(Duration(days: 1), (Timer t) {
      setState(() {
        _currentDate = DateTime.now();
      });
    });
    super.initState();

    // _displayText();
  }

  // _displayText() async {
  //   print("Inside displayText");
  //   Duration interval = Duration(days: 1);
  //   Stream<DateTime> stream = Stream<DateTime>.periodic(interval, _checkDate);

  //   await for (DateTime i in stream) {
  //     print(i);
  //     setState(() {
  //       _currentDate = i;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    Profile profile = Provider.of<Profile>(context);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        color: const Color(0xffcce0d2),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xff1d617a), width: 2),
      ),
      child: profile.quarantineStartDate == null
          ? Text(
              "0",
              style: TextStyle(color: const Color(0xff1d617a)),
            )
          : Text(
              "${_currentDate.difference(profile.quarantineStartDate).inDays}",
              style: TextStyle(
                  color: const Color(0xff1d617a), fontWeight: FontWeight.bold),
            ),
    );
  }
}
