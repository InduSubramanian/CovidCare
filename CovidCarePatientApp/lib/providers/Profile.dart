import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class Profile with ChangeNotifier {
  final fb = FirebaseDatabase.instance;

  String name;
  String address;
  String number;
  String city;
  String state;
  DateTime quarantineStartDate;

  @override
  void notifyListeners() {
    super.notifyListeners();
  }

  void addProfile(Profile p) {
    this.city = p.city;
    this.address = p.address;
    this.number = p.number;
    this.name = p.name;
    this.state = p.state;

    final ref = fb.reference();

    dynamic m = {
      "name": p.name,
      "address": p.address,
      "number": p.number,
      "city": p.city,
      "state": p.state,
    };

    ref.child("Profile").set(m);

    notifyListeners();
  }

  void connectVolunteer(String number) {
    final ref = fb.reference();
    dynamic m = {
      "name": this.name,
      "address": this.address,
      "number": this.number,
      "city": this.city,
      "state": this.state,
    };

    ref.child("VolunteerDetails").child(number).child(this.number).set(m);
  }

  void fetch() {
    print("FETCHING Profile");
    final ref = fb.reference();
    ref.child("Profile").once().then((DataSnapshot data) {
      print(data.key);
      var dataList = data.value;
      if (dataList != null) {
        this.name = dataList["name"];
        this.address = dataList["address"];
        this.number = dataList["number"];
        this.city = dataList["city"];
        this.state = dataList["state"];

        if (dataList["QuarantineStartDate"] != null) {
          this.quarantineStartDate = DateTime(
              dataList["QuarantineStartDate"]["year"],
              dataList["QuarantineStartDate"]["month"],
              dataList["QuarantineStartDate"]["day"]);
        }
      }
    });

    FirebaseDatabase.instance
        .reference()
        .child("QuarantineStartDate")
        .once()
        .then((DataSnapshot data) {
      print(data.value);
      var dataList = data.value;
      if (dataList != null) {
        this.quarantineStartDate =
            DateTime(dataList["year"], dataList["month"], dataList["day"]);
      }
    });
  }
}
