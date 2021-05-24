import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

typedef void DoseTimeCallback(TimeOfDay time, int dose);

class DoseTime extends StatefulWidget {
  final DoseTimeCallback onDoseTimeChanged;
  final String text;

  DoseTime({
    Key key,
    @required this.text,
    @required this.onDoseTimeChanged,
  }) : super(key: key);

  @override
  _DoseTimeState createState() => _DoseTimeState();
}

class _DoseTimeState extends State<DoseTime> {
  int doses = 0;

  TimeOfDay _time;
  @override
  void initState() {
    super.initState();
    _time = null;
  }

  String formatTimeOfDay(TimeOfDay tod) {
    final now = new DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, tod.hour, tod.minute);
    final format = DateFormat.jm(); //"6:00 AM"
    return format.format(dt);
  }

  Future<Null> _pickTime(BuildContext context) async {
    TimeOfDay time =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());

    if (time != null) {
      setState(() {
        _time = time;
      });

      widget.onDoseTimeChanged(_time, doses);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.text,
            style: TextStyle(fontSize: 16),
          ),
          Row(
            children: [
              IconButton(
                  icon: Icon(
                    Icons.remove_circle_rounded,
                    color: const Color(0xff1d617a),
                  ),
                  onPressed: () {
                    setState(() {
                      doses = doses - 1;
                    });
                    widget.onDoseTimeChanged(_time, doses);
                  }),
              RichText(
                text: TextSpan(
                  text: doses.toString(),
                  style:
                      TextStyle(color: const Color(0xff1d617a), fontSize: 16),
                ),
              ),
              IconButton(
                  icon: Icon(
                    Icons.add_circle_rounded,
                    color: const Color(0xff1d617a),
                  ),
                  onPressed: () {
                    setState(() {
                      doses = doses + 1;
                    });
                    widget.onDoseTimeChanged(_time, doses);
                  }),
            ],
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Time",
            style: TextStyle(fontSize: 16),
          ),
          Row(
            children: [
              RichText(
                text: TextSpan(
                  text: _time == null ? "Pick time" : formatTimeOfDay(_time),
                  style: TextStyle(
                    fontSize: 16,
                    color: const Color(0xff5eaaa8),
                  ),
                ),
              ),
              IconButton(
                  icon: Icon(
                    Icons.access_time_rounded,
                    color: const Color(0xff1d617a),
                  ),
                  onPressed: () {
                    _pickTime(context);
                  }),
            ],
          ),
        ],
      ),
    ]);
  }
}
