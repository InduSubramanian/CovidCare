import 'package:flutter/foundation.dart';

class Volunteer with ChangeNotifier {
  String name;
  String number;

  @override
  void notifyListeners() {
    
    super.notifyListeners();
  }

  void addDetails(Volunteer v) {
    this.name = v.name;
    this.number = v.number;
  }
}
