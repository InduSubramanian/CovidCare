import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Widgets/RegisterBackground.dart';

import '../Providers/Volunteer.dart';
import '../Providers/PatientList.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final myUsername = TextEditingController();
  String _username;
  String _password;
  String _number;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myUsername.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Volunteer volunteer = Provider.of<Volunteer>(context, listen: false);
    PatientList _patientListClass = Provider.of<PatientList>(context);
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
                          _number = value;
                        });
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "Number",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextField(
                      onSubmitted: (value) {
                        setState(() {
                          _password = value;
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
                        if (_username == null ||
                            _password == null ||
                            _number == null) {
                          showDialog(
                              context: context,
                              child: AlertDialog(
                                content: Text("Fill in all the details!!"),
                              ));
                        } else {
                          volunteer.name = _username;
                          volunteer.number = _number;
                          volunteer.notifyListeners();
                          _patientListClass.getpatientList(volunteer.number);
                          Navigator.pushNamed(context, "/PatientScreen");
                        }
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
