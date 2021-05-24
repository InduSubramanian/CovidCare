import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../providers/Profile.dart';

class DateSelection extends StatefulWidget {
  DateSelection({Key key}) : super(key: key);

  @override
  _DateSelectionState createState() => _DateSelectionState();
}

class _DateSelectionState extends State<DateSelection> {
  final fb = FirebaseDatabase.instance;

  @override
  Widget build(BuildContext context) {
    Profile profile = Provider.of<Profile>(context);
    Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          "Quarantine Start Date: ",
          style: TextStyle(
              fontSize: 18,
              color: const Color(0xff1d617a),
              fontWeight: FontWeight.w500),
        ),
        Container(
          //width: size.width * 0.1,
          width: size.width * 0.25,
          child: TextField(
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              // focusColor: const Color(0xfff05945),
              hintText: profile.quarantineStartDate == null
                  ? "dd-mm-yyyy"
                  : DateFormat('dd-MM-yyyy')
                      .format(profile.quarantineStartDate),
            ),
          ),
        ),
        IconButton(
            icon: Icon(
              Icons.calendar_today_rounded,
              color: const Color(0xff1d617a),
            ),
            onPressed: () {
              showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2020),
                lastDate: DateTime(2026),
              ).then(
                (value) {
                  setState(() {
                    final ref = fb.reference();
                    var d = {
                      "year": value.year,
                      "month": value.month,
                      "day": value.day,
                    };
                    ref.child("QuarantineStartDate").set(d);
                    profile.quarantineStartDate = value;
                    profile.notifyListeners();
                  });
                },
              );
            })
      ],
    );
  }
}
