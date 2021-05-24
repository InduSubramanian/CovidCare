import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import '../widgets/Header.dart';
import '../widgets/DoseTime.dart';
import '../widgets/WelcomeBackground.dart';

import '../providers/MedicineList.dart';
import '../providers/Medicine.dart';
import '../providers/ScreenArguments.dart';

class AddReminderScreen extends StatefulWidget {
  const AddReminderScreen({
    Key key,
  }) : super(key: key);

  @override
  _AddReminderScreenState createState() => _AddReminderScreenState();
}

class _AddReminderScreenState extends State<AddReminderScreen> {
  var _newMed, _newMed2, _newMed3;
  FlutterLocalNotificationsPlugin flutterNotifPlugin;

  @override
  void initState() {
    super.initState();
    _newMed = Medicine(id: 0, beforeFood: true, doses: 0, name: "", time: null);
    _newMed2 =
        Medicine(id: 0, beforeFood: true, doses: 0, name: "", time: null);
    _newMed3 =
        Medicine(id: 0, beforeFood: true, doses: 0, name: "", time: null);
    // Initialising Android settings
    const AndroidInitializationSettings androidInitSettings =
        AndroidInitializationSettings('pogo');
    //Icon will be inside - Android - src - main -  res - drawable ( put inside there)

    final IOSInitializationSettings iosInitSettings =
        IOSInitializationSettings();

    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: androidInitSettings, iOS: iosInitSettings);
    flutterNotifPlugin = FlutterLocalNotificationsPlugin();
    flutterNotifPlugin.initialize(initializationSettings,
        onSelectNotification: onNotifSelected);
  }

  //This executes when you click on the notification
  Future onNotifSelected(String payload) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text("Don't forget to take your medicine!"),
      ),
    );
  }

  int _radioValue = 0;

  void _handleRadio(int value) {
    setState(() {
      _radioValue = value;
    });

    _newMed = Medicine(
        id: 0,
        beforeFood: value == 0 ? true : false,
        time: _newMed.time,
        name: _newMed.name,
        doses: _newMed.doses);
  }

  Future _showNotif(int id, TimeOfDay time, String name) async {
    // We can set priority and importance
    var androidDetails = new AndroidNotificationDetails(
      "Channel ID",
      "Covid Care",
      "This is to notify you!",
    );
    var iosDetails = new IOSNotificationDetails();
    var generalDetails =
        new NotificationDetails(android: androidDetails, iOS: iosDetails);
    tz.initializeTimeZones();

    // Show parameters - id, title,  body, notifDetails

    var d = new DateTime.now();
    var date = DateTime(d.year, d.month, d.day, time.hour, time.minute);
    if (date.isBefore(d)) {
      date = DateTime(d.year, d.month, d.day + 1, time.hour, time.minute);
    }
    print("Scheduling time at $date with id no: $id");

    await flutterNotifPlugin.zonedSchedule(
        id,
        "Reminder to take $name",
        "Take 1 dose of each",
        tz.TZDateTime.from(date, tz.local),
        generalDetails,
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);

    // await flutterNotifPlugin.periodicallyShow(
    //   id,
    //   "Reminder to take $name",
    //   "Take 1 dose of each",
    //   RepeatInterval
    //   tz.TZDateTime.from(date, tz.local),
    //   generalDetails,
    //   androidAllowWhileIdle: true,
    //   uiLocalNotificationDateInterpretation:
    //       UILocalNotificationDateInterpretation.absoluteTime
    // );
  }

  @override
  Widget build(BuildContext context) {
    final medicineList = Provider.of<MedicineList>(context, listen: false);

    //What to do when notif is tapped

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: size.height,
        child: WelcomeBackground(
          bottomMargin: -100,
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.04,
              ),
              Header(),
              Container(
                width: size.width,
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                color: const Color(0xffcce0d2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Enter Medicine Details",
                      style: TextStyle(
                          fontSize: 18,
                          color: const Color(0xff1d617a),
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      height: size.height * 0.05,
                      decoration: BoxDecoration(
                        color: const Color(0xfff05945),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[500],
                            offset: Offset(0, 2),
                            blurRadius: 1.2,
                          ),
                        ],
                      ),
                      child: FlatButton(
                        onPressed: () {
                          if (_newMed.doses != 0) {
                            _newMed = new Medicine(
                                id: medicineList.idCount,
                                name: _newMed.name,
                                time: _newMed.time,
                                beforeFood: _newMed.beforeFood,
                                doses: _newMed.doses);

                            _showNotif(_newMed.id, _newMed.time, _newMed.name);
                            medicineList.addReminder(_newMed);
                            print("Adding1");
                          }
                          if (_newMed2.doses != 0) {
                            _newMed2 = new Medicine(
                                id: medicineList.idCount,
                                name: _newMed2.name,
                                time: _newMed2.time,
                                beforeFood: _newMed2.beforeFood,
                                doses: _newMed2.doses);
                            _showNotif(
                                _newMed2.id, _newMed2.time, _newMed2.name);
                            medicineList.addReminder(_newMed2);
                            print("Adding2");
                          }
                          if (_newMed3.doses != 0) {
                            _newMed3 = new Medicine(
                                id: medicineList.idCount,
                                name: _newMed3.name,
                                time: _newMed3.time,
                                beforeFood: _newMed3.beforeFood,
                                doses: _newMed3.doses);
                            _showNotif(
                                _newMed3.id, _newMed3.time, _newMed3.name);
                            medicineList.addReminder(_newMed3);
                            print("Adding3");
                          }

                          Navigator.pushReplacementNamed(
                            context,
                            "/HomeScreen",
                            arguments: ScreenArguments(0, flutterNotifPlugin),
                          );
                        },
                        child: Text(
                          "Done",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.02),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                width: size.width * 0.9,
                decoration: BoxDecoration(
                    border: Border(
                  left: BorderSide(
                    width: 3,
                    color: const Color(0xfff05945),
                  ),
                )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: size.width * 0.5,
                      child: TextField(
                        textAlign: TextAlign.center,
                        decoration:
                            InputDecoration(hintText: "Medicines to take:"),
                        onSubmitted: (value) {
                          _newMed = Medicine(
                              id: _newMed.id,
                              name: value,
                              time: _newMed.time,
                              beforeFood: _newMed.beforeFood,
                              doses: _newMed.doses);
                        },
                      ),
                    ),
                    // SizedBox(height: size.height * 0.02)
                    SizedBox(height: size.height * 0.02),
                    Text(
                      "Dosage",
                      style: TextStyle(
                          fontSize: 18,
                          color: const Color(0xff1d617a),
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Radio(
                            value: 0,
                            groupValue: _radioValue,
                            onChanged: _handleRadio),
                        Text(
                          "Before Food",
                          style: TextStyle(
                            // fontSize: 6,
                            fontSize: 16,
                            color: const Color(0xff1d617a),
                          ),
                        ),
                        Radio(
                            value: 1,
                            groupValue: _radioValue,
                            onChanged: _handleRadio),
                        Text(
                          "After Food",
                          style: TextStyle(
                            // fontSize: 6,
                            fontSize: 16,
                            color: const Color(0xff1d617a),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 40),
                      child: DoseTime(
                        text: "Morning",
                        onDoseTimeChanged: (t, d) {
                          _newMed = Medicine(
                              id: _newMed.id,
                              name: _newMed.name,
                              time: t,
                              beforeFood: _newMed.beforeFood,
                              doses: d);
                        },
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                    Container(
                      padding: const EdgeInsets.only(left: 40),
                      child: DoseTime(
                        text: "Afternoon",
                        onDoseTimeChanged: (t, d) {
                          _newMed2 = Medicine(
                              id: _newMed.id,
                              name: _newMed.name,
                              time: t,
                              beforeFood: _newMed.beforeFood,
                              doses: d);
                        },
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                    Container(
                      padding: const EdgeInsets.only(left: 40),
                      child: DoseTime(
                        text: "Night",
                        onDoseTimeChanged: (t, d) {
                          _newMed3 = Medicine(
                              id: _newMed.id,
                              name: _newMed.name,
                              time: t,
                              beforeFood: _newMed.beforeFood,
                              doses: d);
                        },
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
