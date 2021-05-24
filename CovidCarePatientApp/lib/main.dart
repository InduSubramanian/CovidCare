import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'screens/Register_screen.dart';
import 'screens/Welcome_Screen.dart';
import 'screens/Home_screen.dart';
import 'screens/AddReminder_screen.dart';
import 'screens/AddHealthLog_Screen.dart';
import 'screens/MentalHealthQuiz_Screen.dart';

import 'screens/Guidelines_Screen.dart';
import 'screens/MapsCovidTestingScreen.dart';
import 'screens/Volunteers_Screen.dart';
import 'screens/Profile_Screen.dart';
import 'screens/BedAvailability_Screen.dart';

import './providers/MedicineList.dart';
import './providers/HealthLogList.dart';
import './providers/Profile.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      // helps provide multiples data
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => MedicineList(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => HealthLogList(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Profile(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "Roboto",
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: RegisterScreen(),
        routes: {
          // "/": (ctx) => LoginScreenNew(),
          "/WelcomeScreen": (ctx) => WelcomeScreen(),
          "/HomeScreen": (ctx) => HomeScreen(),
          '/AddReminderScreen': (ctx) => AddReminderScreen(),
          "/AddHealthLogScreen": (ctx) => AddHealthLogScreen(),
          "/MentalHealthQuizScreen": (ctx) => MentalHealthQuizScreen(),
          "/MapsCovidTestingScreen": (ctx) => MapsCovidTestingScreen(),
          "/GuidelinesScreen": (ctx) => GuidelinesScreen(),
          "/VolunteersScreen": (ctx) => VolunteersScreen(),
          "/ProfileScreen": (ctx) => ProfileScreen(),
          "/BedAvailabilityScreen": (ctx) => BedAvailabilityScreen(),
        },
      ),
    );
  }
}
