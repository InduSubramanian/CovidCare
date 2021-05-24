import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/WelcomeBackground.dart';
import '../widgets/Header.dart';

import '../providers/Profile.dart';
import '../providers/ScreenArguments.dart';

class VolunteersScreen extends StatefulWidget {
  VolunteersScreen({Key key}) : super(key: key);

  @override
  _VolunteersScreenState createState() => _VolunteersScreenState();
}

class _VolunteersScreenState extends State<VolunteersScreen> {
  String _name;
  String _number;

  @override
  Widget build(BuildContext context) {
    Profile profileDet = Provider.of<Profile>(context, listen: false);

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Container(
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
                        "Volunteer Details",
                        style: TextStyle(
                            fontSize: 18,
                            color: const Color(0xff1d617a),
                            fontWeight: FontWeight.bold),
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
                  )),
                  child: Column(
                    children: [
                      SizedBox(height: size.height * 0.02),
                      Text(
                        "Volunteer Details",
                        style: TextStyle(
                            fontSize: 18,
                            color: const Color(0xff1d617a),
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: size.height * 0.02),
                      Container(
                        width: size.width * 0.65,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: const Color(0xffe9e9e9),
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                            "Based on your area and location of stay, you will be assigned a volunteer who will check on you during your Home Quarantine. Fill in the details of the volunteer assigned to you. This app will connect you with your volunteer"),
                      ),
                      SizedBox(height: size.height * 0.04),
                      Container(
                        width: size.width * 0.65,
                        child: TextField(
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            hintText: "Volunteer's name",
                          ),
                          onChanged: (val) {
                            setState(() {
                              _name = val;
                            });
                          },
                        ),
                      ),
                      SizedBox(height: size.height * 0.02),
                      Container(
                        width: size.width * 0.65,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: "Volunteer's number",
                          ),
                          onChanged: (val) {
                            setState(() {
                              _number = val;
                            });
                          },
                        ),
                      ),
                      SizedBox(height: size.height * 0.04),
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
                            if (profileDet.name != null) {
                              profileDet.connectVolunteer(_number);
                              showDialog(
                                context: context,
                                child: AlertDialog(
                                  title: Text(
                                      "Your volunteer, $_name will contact you shortly!"),
                                  actions: [
                                    FlatButton(
                                      onPressed: () {
                                        Navigator.pushReplacementNamed(
                                          context,
                                          "/HomeScreen",
                                          arguments: ScreenArguments(1, null),
                                        );
                                      },
                                      child: Text("Home"),
                                    )
                                  ],
                                ),
                              );
                            } else {
                              showDialog(
                                context: context,
                                child: AlertDialog(
                                  title: Text(
                                      "Fill in your Profile Details first!"),
                                  actions: [
                                    FlatButton(
                                      onPressed: () {
                                        Navigator.pushReplacementNamed(
                                          context,
                                          "/ProfileScreen",
                                        );
                                      },
                                      child: Text("Go to profile"),
                                    )
                                  ],
                                ),
                              );
                            }
                          },
                          child: Text(
                            "Connect with your Volunteer",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
