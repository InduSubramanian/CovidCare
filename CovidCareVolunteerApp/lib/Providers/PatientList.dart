import 'package:flutter/foundation.dart';
import 'package:firebase_database/firebase_database.dart';

import "dart:async";

class PatientList with ChangeNotifier {
  List<Patient> _patientList = [];

  final volunteerDetails =
      FirebaseDatabase.instance.reference().child("VolunteerDetails");

  List<Patient> get patientList {
    return [..._patientList];
  }

  Future getpatientList(String number) async {
    volunteerDetails.child(number).once().then((DataSnapshot data) {
      print("DataKey ${data.key}");
      var dict = data.value;
      print("DataValue ${data.value}");
      dict.forEach((key, patientData) {
        print(patientData["name"]);
        Patient p;
        p = Patient(
            address: patientData["address"],
            city: patientData["city"],
            name: patientData["name"],
            number: patientData["number"],
            state: patientData["state"]);
        print("Name of new patient ${p.name}");
        _patientList.add(p);
        print(_patientList[0].name);
      });
    });
    notifyListeners();
  }

  void removePatient(Patient p) {
    _patientList.remove(p);
  }
}

class Patient with ChangeNotifier {
  final String name;
  final String city;
  final String state;
  final String number;
  final String address;
  final int id;

  Patient({
    @required this.name,
    @required this.city,
    @required this.state,
    @required this.number,
    @required this.address,
    this.id,
  });
}
