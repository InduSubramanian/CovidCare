import "package:flutter/foundation.dart";

class HealthLog with ChangeNotifier {
  double oxygenSat;
  double temp;
  int heartRate;
  DateTime date;

  HealthLog(
      {@required this.heartRate,
      @required this.oxygenSat,
      @required this.temp,
      @required this.date});
}
