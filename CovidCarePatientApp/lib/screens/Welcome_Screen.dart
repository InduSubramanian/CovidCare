import 'package:flutter/material.dart';

import '../widgets/WelcomeBackground.dart';
import '../widgets/ListWelcome.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: WelcomeBackground(
          bottomMargin: 0,
          child: Container(
            height: size.height * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 5),
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: const Color(0xfff05945),
                        width: 2.0, // Underline thickness
                      ),
                    ),
                  ),
                  child: Text(
                    "COVID CARE",
                    style: TextStyle(
                        color: const Color(0xff1D617A),
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                ListWelcome(
                  icon: "./images/microscope.png",
                  text: "Find nearest Covid testing facilities",
                ),
                ListWelcome(
                  icon: "./images/writingpad.png",
                  text: "Keep track of your medical health logs",
                ),
                ListWelcome(
                  icon: "./images/heartecg.png",
                  text: "Reminders to take your medicines",
                ),
                ListWelcome(
                  icon: "./images/quarantineDate.png",
                  text: "Keep a count of your quarantine days!",
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                  margin: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: const Color(0xfff05945),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[500],
                        offset: Offset(0, 2),
                        blurRadius: 1.2,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, "/HomeScreen");
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
