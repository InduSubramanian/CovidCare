import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../providers/Medicine.dart';
import '../providers/MedicineList.dart';

class ReminderItem extends StatefulWidget {
  final Medicine reminder;
  final FlutterLocalNotificationsPlugin fltrNotifPlugin;
  const ReminderItem({
    Key key,
    @required this.reminder,
    @required this.fltrNotifPlugin,
  }) : super(key: key);

  @override
  _ReminderItemState createState() => _ReminderItemState();
}

class _ReminderItemState extends State<ReminderItem> {
  Future _delNotif(int id) async {
    if (widget.fltrNotifPlugin != null) {
      await widget.fltrNotifPlugin.cancel(id);
      print("Cancelled");
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final medList = Provider.of<MedicineList>(context);

    String formatTimeOfDay(TimeOfDay tod) {
      final now = new DateTime.now();
      final dt = DateTime(now.year, now.month, now.day, tod.hour, tod.minute);
      final format = DateFormat.jm(); //"6:00 AM"
      return format.format(dt);
    }

    return Dismissible(
      key: ValueKey("HEllo"),
      background: Container(
          // alignment: Alignment.centerRight,
          width: size.width * 0.9,
          decoration: BoxDecoration(
            color: const Color(0x1aC4C4C4),
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.delete,
                color: Colors.red,
              ),
              Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ],
          )),
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        // color: const Color(0xffC4C4C4),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    "${formatTimeOfDay(widget.reminder.time).split(" ")[0]}",
                    style:
                        TextStyle(fontSize: 32, color: const Color(0xff1D617A)),
                  ),
                  Wrap(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "AM  ",
                        style: TextStyle(
                          fontSize: 18,
                          color: formatTimeOfDay(widget.reminder.time)
                                      .split(" ")[1] ==
                                  "AM"
                              ? const Color(0xffF05945)
                              : const Color(0xffC4C4C4),
                        ),
                      ),
                      Text(
                        "PM",
                        style: TextStyle(
                          fontSize: 18,
                          color: formatTimeOfDay(widget.reminder.time)
                                      .split(" ")[1] ==
                                  "PM"
                              ? const Color(0xffF05945)
                              : const Color(0xffC4C4C4),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    width: size.width * 0.4,
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Text(
                      "${widget.reminder.name}",
                      style: TextStyle(
                          fontSize: 20, color: const Color(0xff1D617A)),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        margin: const EdgeInsets.only(right: 2),
                        child:
                            Text("Take ${widget.reminder.doses} tablet each"),
                        decoration: BoxDecoration(
                            color: const Color(0x595EAAA8),
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Text(
                            "${widget.reminder.beforeFood == true ? "Before food" : " After Food"}"),
                        decoration: BoxDecoration(
                            color: widget.reminder.beforeFood == true
                                ? const Color(0x4DF56060)
                                : const Color(0x99F5EC9C),
                            borderRadius: BorderRadius.circular(8)),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      onDismissed: (direction) {
        setState(() {
          medList.deleteReminder(widget.reminder);
        });
      },
      confirmDismiss: (direction) {
        return showDialog(
            //ShowDialogue ALways returns a FUture Value
            context: context,
            builder: (ctx) => AlertDialog(
                  content:
                      Text('Are you sure you want to remove this Reminder?'),
                  actions: [
                    FlatButton(
                      onPressed: () {
                        Navigator.of(ctx).pop(true);
                        if (widget.fltrNotifPlugin != null) {
                          _delNotif(widget.reminder.id);
                        }
                      }, //Navigator.pop() will return whatever is popped in the future
                      child: Text('Yes'),
                    ),
                    FlatButton(
                      onPressed: () => Navigator.of(ctx).pop(false),
                      child: Text('No'),
                    )
                  ],
                ));
      },
    );
  }
}
