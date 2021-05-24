import 'package:flutter/foundation.dart';
import 'package:firebase_database/firebase_database.dart';

import 'HealthLog.dart';

class HealthLogList with ChangeNotifier {
  final fb = FirebaseDatabase.instance;

  List _healthLogs = [];

  List get healthLogs {
    return [..._healthLogs];
  }

  void addHealthLog(HealthLog log) {
    final ref = fb.reference();
    print("Database reference is made");
    dynamic m = {
      "oxygenSat": log.oxygenSat,
      "temp": log.temp,
      "heartRate": log.heartRate,
      "Date": {
        "Year": log.date.year,
        "month": log.date.month,
        "day": log.date.day,
        "hour": log.date.hour,
        "minute": log.date.minute
      },
    };
    ref
        .child("HealthLogs")
        .child(
            "${log.date.day}-${log.date.month}-${log.date.year}, ${log.date.hour}:${log.date.minute}")
        .set(m);

    _healthLogs.add(log);
    notifyListeners();
  }

  void fetch() {
    print("FETCHING");
    final ref = fb.reference();
    ref.child("HealthLogs").once().then((DataSnapshot data) {
      var dataList = data.value;

      if (dataList != null) {
        print(dataList);
        dataList.forEach((k, item) {
          if (item != null) {
            DateTime date = new DateTime(
                item["Date"]["Year"],
                item["Date"]["month"],
                item["Date"]["day"],
                item["Date"]["hour"],
                item["Date"]["minute"]);

            var med = HealthLog(
                date: date,
                heartRate: item["heartRate"],
                oxygenSat: item["oxygenSat"].toDouble(),
                temp: item["temp"].toDouble());

            _healthLogs.add(med);
          }
        });
      }
    });
  }

  int logLength() {
    return _healthLogs.length;
  }
}
