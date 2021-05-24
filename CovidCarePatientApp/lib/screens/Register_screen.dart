import 'package:flutter/material.dart';
import '../widgets/RegisterBackground.dart';
import 'package:provider/provider.dart';

import '../providers/MedicineList.dart';
import '../providers/HealthLogList.dart';
import '../providers/Profile.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final myUsername = TextEditingController();
  String _username;
  String _password;

  // @override
  // void dispose() {
  //   // Clean up the controller when the widget is disposed.
  //   myController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    MedicineList medList = Provider.of<MedicineList>(context, listen: false);
    HealthLogList healthLogList =
        Provider.of<HealthLogList>(context, listen: false);
    Profile profile = Provider.of<Profile>(context, listen: false);

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        width: size.width,
        child: RegisterBackground(
          child: Center(
            child: Container(
              width: size.width * 0.7,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      "Sign In / Sign Up",
                      style: TextStyle(
                        fontSize: 24,
                        color: const Color(0xff1D617A),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextField(
                      textInputAction: TextInputAction.next,
                      onSubmitted: (value) {
                        setState(() {
                          _username = value;
                          print("SetUsername is $_password");
                        });
                      },
                      decoration: InputDecoration(
                        hintText: "Username",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextField(
                      onSubmitted: (value) {
                        setState(() {
                          _password = value;
                          print("SetPassword is $_password");
                        });
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Password",
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 20.0),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[500],
                            offset: Offset(0, 2),
                            blurRadius: 1.2,
                          ),
                        ],
                        color: const Color(0xffF05945),
                        borderRadius: BorderRadius.circular(10)),
                    child: FlatButton(
                      onPressed: () {
                        medList.fetch();
                        healthLogList.fetch();
                        profile.fetch();

                        Navigator.pushNamed(context, "/WelcomeScreen");
                      },
                      child: Text(
                        "Let's Go",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
