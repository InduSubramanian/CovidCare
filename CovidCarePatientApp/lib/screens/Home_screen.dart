import 'package:flutter/material.dart';
import '../widgets/WelcomeBackground.dart';
import '../widgets/Header.dart';
import '../widgets/TabList.dart';
import '../widgets/Reminder.dart';
import '../widgets/HealthLogMain.dart';
import '../widgets/HelpLines.dart';
import '../widgets/Pranayamam.dart';
import '../providers/custom_icons_icons.dart';

import '../providers/ScreenArguments.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenArguments arg = ModalRoute.of(context).settings.arguments;

    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      initialIndex: arg == null ? 0 : arg.index,
      length: 4,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: size.width,
          height: size.height,
          child: WelcomeBackground(
            bottomMargin: -150,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                  Header(),
                  SingleChildScrollView(
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      color: const Color(0xffcce0d2),
                      child: TabBar(
                          isScrollable: true,
                          tabs: [
                            TabList(
                              text: "Reminder ",
                              icon: CustomIcons.pills,
                              size: 22.0,
                            ),
                            TabList(
                                text: "Helplines ",
                                icon: CustomIcons.heartbeat,
                                size: 20.0),
                            TabList(
                                text: "Health Logs ",
                                icon: CustomIcons.clipboard_list,
                                size: 20.0),
                            TabList(
                                text: "Pranayamam",
                                icon: CustomIcons.yoga,
                                size: 25.0)
                          ],
                          unselectedLabelColor: const Color(0xff5EAAA8),
                          labelColor: const Color(0xff1D617A),
                          indicatorColor: const Color(0xff80a6b4),
                          indicatorSize: TabBarIndicatorSize.label),
                    ),
                  ),
                  Container(
                    // height: size.height * 0.5,
                    height: size.height * 0.7,
                    margin: const EdgeInsets.all(20),
                    padding: const EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                        border: Border(
                      // top: BorderSide(width: 2, color: const Color(0xfff05945)),
                      left:
                          BorderSide(width: 3, color: const Color(0xfff05945)),
                      // right: BorderSide(width: 2, color: const Color(0xfff05945)),
                    )),
                    child: TabBarView(children: <Widget>[
                      Reminder(
                          fltrNotifPlugin:
                              arg == null ? null : arg.notifPlugin),
                      HelpLines(),
                      HealthLogMain(),
                      Pranayamam(),
                    ]),
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
