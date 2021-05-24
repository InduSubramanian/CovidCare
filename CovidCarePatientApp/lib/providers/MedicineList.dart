import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

import '../providers/Medicine.dart';

class MedicineList with ChangeNotifier {
  final fb = FirebaseDatabase.instance;

  List<Medicine> _reminders = [];
  int _idCount = 1;

  List<Medicine> get reminder {
    return [..._reminders];
  }

  int get idCount {
    return _idCount;
  }

  void addReminder(Medicine med) {
    final ref = fb.reference();
    print("Database reference is made");
    dynamic m = {
      "name": med.name,
      "dose": med.doses,
      "BeforeFood": med.beforeFood,
      "Time": {"hour": med.time.hour, "minutes": med.time.minute},
    };
    ref.child("Reminders").child("${med.id}").set(m);
    _reminders.add(med);
    _idCount += 1;

    notifyListeners();
  }

  void fetch() {
    print("FETCHING");
    final ref = fb.reference();
    ref.child("Reminders").once().then((DataSnapshot data) {
      print(data.key);
      var dataList = data.value;
      _idCount = 0;
      if (dataList != null) {
        dataList.forEach((item) {
          _idCount += 1;
          if (item != null) {
            TimeOfDay time = new TimeOfDay(
                hour: item["Time"]["hour"], minute: item["Time"]["minutes"]);
            var med = Medicine(
                beforeFood: item["beforeFood"],
                doses: item["dose"],
                name: item["name"],
                id: _idCount,
                time: time);
            _reminders.add(med);
          }
        });
      }
    });
    // notifyListeners();
  }

  void deleteReminder(Medicine med) {
    final ref = fb.reference();

    ref.child("Reminders").child("${med.id}").remove();
    _reminders.remove(med);
    notifyListeners();

    print("Hello");
  }

  int medLength() {
    return _reminders.length;
  }
}
