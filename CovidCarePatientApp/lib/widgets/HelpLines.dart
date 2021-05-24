import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpLines extends StatelessWidget {
  const HelpLines({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(0),
      children: [
        HelpLineItem(
          desc: "Find your mental Health Score",
          img: "images/Mental_health.png",
          title: "Mental Health Inspector",
          desc2: "Tips to maintain a healthy and peaceful mind.",
          screenRoute: "/MentalHealthQuizScreen",
        ),
        HelpLineItem(
          desc: "Find nearby trusted and verified mess contacts.",
          img: "images/Food_Mess_Contacts.png",
          title: "Nearby Food/Mess Contacts",
          screenRoute: "/FoodAvailability",
        ),
        HelpLineItem(
          desc: "Find Bed Availability in your location. ",
          img: "images/BedAvailability.png",
          title: "Bed Availability",
          screenRoute: "/BedAvailabilityScreen",
        ),
        HelpLineItem(
          desc: "Find the covid testing centers available in your location.",
          img: "images/covid_testing.png",
          title: "Covid Testing Centers",
          screenRoute: "/MapsCovidTestingScreen",
        ),
        HelpLineItem(
          desc: "Communicate your needs to your assigned volunteer",
          img: "images/volunteer.png",
          title: "Contact your volunteer",
          screenRoute: "/VolunteersScreen",
        ),
      ],
    );
  }
}

class HelpLineItem extends StatefulWidget {
  final String img, title, desc, desc2, screenRoute;

  HelpLineItem(
      {Key key,
      @required this.img,
      @required this.title,
      @required this.desc,
      this.desc2,
      @required this.screenRoute})
      : super(key: key);

  @override
  _HelpLineItemState createState() => _HelpLineItemState();
}

class _HelpLineItemState extends State<HelpLineItem> {
  void _launchUrl() async {
    const String url = 'https://covidmealsforindia.com/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  // double _elevation = 2.5;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        if (widget.screenRoute == "/FoodAvailability") {
          _launchUrl();
        } else {
          Navigator.pushNamed(context, widget.screenRoute);
        }
      },
      child: Card(
        elevation: 2.5,
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                width: size.width * 0.25,
                child: Image.asset(widget.img)),
            Container(
              width: size.width * 0.5,
              child: Column(children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 5),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.title,
                    style:
                        TextStyle(color: const Color(0xff1D617A), fontSize: 16),
                    textAlign: TextAlign.left,
                  ),
                ),
                Container(
                  // padding: const EdgeInsets.only(left: 5),
                  alignment: Alignment.centerLeft,
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(color: const Color(0xff5EAAA8)),
                      text: '• ',
                      children: [TextSpan(text: widget.desc)],
                    ),
                  ),
                ),
                widget.desc2 != null
                    ? Container(
                        // padding: const EdgeInsets.only(left: 5),
                        alignment: Alignment.centerLeft,
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(color: const Color(0xff5EAAA8)),
                            text: '• ',
                            children: [TextSpan(text: widget.desc2)],
                          ),
                        ),
                      )
                    : SizedBox(),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
