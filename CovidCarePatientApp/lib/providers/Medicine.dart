import 'package:flutter/material.dart';

class Medicine with ChangeNotifier {
  final int id;
  final String name;
  final TimeOfDay time;
  final bool beforeFood;
  final int doses;

  Medicine({
    @required this.id,
    @required this.name,
    @required this.time,
    @required this.beforeFood,
    @required this.doses,
  });
}
