import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

import './Screens/Register_Screen.dart';
import './Screens/Patient_Screen.dart';
import './Screens/GuideLines_Screen.dart';

import './Providers/PatientList.dart';
import './Providers/Volunteer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      // helps provide multiples data
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Volunteer(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => PatientList(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: RegisterScreen(),
        routes: {
          "/PatientScreen": (ctx) => PatientScreen(),
          "/GuidelinesScreen": (ctx) => GuidelinesScreen(),
        },
      ),
    );
  }
}
