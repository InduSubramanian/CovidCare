import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../widgets/WelcomeBackground.dart';
import '../widgets/Header.dart';
import '../widgets/RadioInput.dart';

import '../providers/HealthLog.dart';
import '../providers/HealthLogList.dart';
import '../providers/ScreenArguments.dart';

class AddHealthLogScreen extends StatefulWidget {
  const AddHealthLogScreen({Key key}) : super(key: key);

  @override
  _AddHealthLogScreenState createState() => _AddHealthLogScreenState();
}

class _AddHealthLogScreenState extends State<AddHealthLogScreen> {
  HealthLog _hL;

  @override
  void initState() {
    super.initState();
    _hL = HealthLog(heartRate: 0, oxygenSat: 0, temp: 0, date: null);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    HealthLogList healthLogList = Provider.of<HealthLogList>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
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
                      "Enter Health Log",
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
                          _hL = HealthLog(
                              date: DateTime.now(),
                              heartRate: _hL.heartRate,
                              oxygenSat: _hL.oxygenSat,
                              temp: _hL.temp);

                          healthLogList.addHealthLog(_hL);
                          if (_hL.oxygenSat < 95) {
                            showDialog(
                                context: context,
                                builder: (builder) {
                                  return AlertDialog(
                                    content: Text(
                                        "Your oxygen saturation is below normal! Please check in with your doctor"),
                                    actions: [
                                      FlatButton(
                                          onPressed: () =>
                                              Navigator.pushReplacementNamed(
                                                context,
                                                "/HomeScreen",
                                                arguments:
                                                    ScreenArguments(1, null),
                                              ),
                                          child:
                                              Text("Check out the HelpLines"))
                                    ],
                                  );
                                });
                          } else {
                            Navigator.pushReplacementNamed(
                              context,
                              "/HomeScreen",
                              //This is to specify what tab to move to!
                              arguments: ScreenArguments(2, null),
                            );
                          }
                        },
                        child: Text(
                          "Done",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
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
                  ),
                ),
                child: Column(
                  children: [
                    TextField(
                      // textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(
                          hintText: "Oxygen Saturation (In %):"),
                      onChanged: (value) {
                        _hL = HealthLog(
                            date: _hL.date,
                            heartRate: _hL.heartRate,
                            oxygenSat: double.parse(value),
                            temp: _hL.temp);
                        print("SatValue you inputted ${double.parse(value)}");
                      },
                    ),
                    SizedBox(height: size.height * 0.02),
                    TextField(
                      // textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration:
                          InputDecoration(hintText: "Temperature (Farenheit):"),
                      onChanged: (value) {
                        _hL = HealthLog(
                            date: _hL.date,
                            heartRate: _hL.heartRate,
                            oxygenSat: _hL.oxygenSat,
                            temp: double.parse(value));
                      },
                    ),
                    SizedBox(height: size.height * 0.02),
                    TextField(
                      // textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration:
                          InputDecoration(hintText: "Heart Rate (pulse/min):"),
                      onChanged: (value) {
                        setState(() {
                          _hL = HealthLog(
                              date: _hL.date,
                              heartRate: int.parse(value),
                              oxygenSat: _hL.oxygenSat,
                              temp: _hL.temp);
                        });
                      },
                    ),
                    SizedBox(height: size.height * 0.05),
                    Text("How do you feel?"),
                    Container(
                      height: size.height * 0.1,
                      width: size.width,
                      child: RadioInput(
                        length: 3,
                        label: ["Better", "Same", "Worse"],
                        onRadioValChanged: (val) {
                          print(val);
                        },
                      ),
                    ),
                    SizedBox(height: size.height * 0.05),
                    Text("How is your breathing?"),
                    Container(
                      height: size.height * 0.1,
                      width: size.width,
                      child: RadioInput(
                        length: 3,
                        label: ["Better", "Same", "Worse"],
                        onRadioValChanged: (val) {
                          print(val);
                        },
                      ),
                    ),
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
