import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'DateSelection.dart';
import 'Reminder_item.dart';

import '../providers/MedicineList.dart';
// import '../providers/Medicine.dart';

class Reminder extends StatefulWidget {
  final FlutterLocalNotificationsPlugin fltrNotifPlugin;
  Reminder({Key key, this.fltrNotifPlugin}) : super(key: key);

  @override
  _ReminderState createState() => _ReminderState();
}

class _ReminderState extends State<Reminder> {
  @override
  Widget build(BuildContext context) {
    final medList = Provider.of<MedicineList>(context);

    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        DateSelection(),
        medList.medLength() == 0
            ? Container(
                height: size.height * 0.5,
                child: Center(
                  child: Text("Add your first reminder!"),
                ),
              )
            : Flexible(
                child: ListView.builder(
                  padding: const EdgeInsets.only(bottom: 10),
                  shrinkWrap: true,
                  itemCount: medList.reminder.length,
                  itemBuilder: (context, index) {
                    return ReminderItem(
                      reminder: medList.reminder[index],
                      fltrNotifPlugin: widget.fltrNotifPlugin,
                    );
                  },
                ),
              ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Add a reminder",
              style: TextStyle(
                color: const Color(0xff1D617A),
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(width: size.width * 0.03),
            Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[500],
                      offset: Offset(0, 2),
                      blurRadius: 1.2,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(50),
                  color: const Color(0xfff05945),
                ),
                child: IconButton(
                    icon: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, "/AddReminderScreen");
                    }))
          ],
        ),
      ],
    );
  }
}
