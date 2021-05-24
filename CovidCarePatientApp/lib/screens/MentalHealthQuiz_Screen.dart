import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/WelcomeBackground.dart';
import '../widgets/Header.dart';
import '../widgets/QuizQn.dart';

import '../providers/ScreenArguments.dart';

class MentalHealthQuizScreen extends StatefulWidget {
  MentalHealthQuizScreen({Key key}) : super(key: key);

  @override
  _MentalHealthQuizScreenState createState() => _MentalHealthQuizScreenState();
}

class _MentalHealthQuizScreenState extends State<MentalHealthQuizScreen> {
  List<int> _q = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

  Widget _resContainer;
  _calcScore() async {
    print("Calculating score $_q");
    var res;
    var numberOfLow = _q.where((c) => (c == 4) || (c == 3)).toList().length;

    if ((_q[8] == 3 || _q[8] == 4) && (_q[5] == 3 || _q[5] == 4) ||
        numberOfLow > 5) {
      print("Going inside if");
      res = Container(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          Text(
              "Hang in there it will get better soon!! You can contact the following helpline incase you want to talk"),
          Row(
            children: [
              Text("Helpline number:"),
              FlatButton(
                  onPressed: () {
                    _makingPhoneCall();
                  },
                  child: Text("1800-599-0019")),
            ],
          ),
          FlatButton(
              onPressed: () {
                Navigator.pushReplacementNamed(
                  context,
                  "/HomeScreen",
                  //This is to specify what tab to move to!
                  arguments: ScreenArguments(1, null),
                );
              },
              child: Text("Home", style: TextStyle(color: Colors.white)))
        ]),
      );
    } else {
      res = Container(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          Text(
              "Stay positive and stay safe! You can contact the following helpline incase you want to talk"),
          Row(
            children: [
              Text("Helpline number:"),
              FlatButton(
                  onPressed: () {
                    _makingPhoneCall();
                  },
                  child: Text("1800-599-0019"))
            ],
          ),
          Container(
            height: 40,
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
                  Navigator.pushReplacementNamed(
                    context,
                    "/HomeScreen",
                    //This is to specify what tab to move to!
                    arguments: ScreenArguments(1, null),
                  );
                },
                child: Text("Home", style: TextStyle(color: Colors.white))),
          ),
        ]),
      );
    }

    setState(() {
      _resContainer = res;
    });
  }

  _makingPhoneCall() async {
    print("Making call");
    const url = 'tel:1800-599-0019';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        child: WelcomeBackground(
          bottomMargin: -100,
          child: Column(children: [
            SizedBox(
              height: size.height * 0.04,
            ),
            Header(),
            Container(
              width: size.width,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              color: const Color(0xffcce0d2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Take the QUIZ",
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
                        _calcScore();
                        showDialog(
                          context: context,
                          child: AlertDialog(
                            actions: [_resContainer],
                          ),
                        );
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
              height: size.height * 0.7,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              width: size.width * 0.9,
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(
                    width: 3,
                    color: const Color(0xfff05945),
                  ),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(children: [
                  QuizQn(
                    opt1: "Not at all",
                    opt2: "Several days",
                    opt3: "More than half of the days",
                    opt4: "Nearly every day",
                    question: "Little interest or pleasure in doing things",
                    onOptionChanged: (val) {
                      setState(() {
                        _q[0] = val;
                      });
                    },
                  ),
                  QuizQn(
                    opt1: "Not at all",
                    opt2: "Several days",
                    opt3: "More than half of the days",
                    opt4: "Nearly every day",
                    question: "Feeling down, depressed, or hopeless",
                    onOptionChanged: (val) {
                      setState(() {
                        _q[1] = val;
                      });
                    },
                  ),
                  QuizQn(
                    opt1: "Not at all",
                    opt2: "Several days",
                    opt3: "More than half of the days",
                    opt4: "Nearly every day",
                    question:
                        "Trouble falling or staying asleep, or sleeping too much",
                    onOptionChanged: (val) {
                      setState(() {
                        _q[2] = val;
                      });
                    },
                  ),
                  QuizQn(
                    opt1: "Not at all",
                    opt2: "Several days",
                    opt3: "More than half of the days",
                    opt4: "Nearly every day",
                    question: "Feeling tired or having little energy",
                    onOptionChanged: (val) {
                      setState(() {
                        _q[3] = val;
                      });
                    },
                  ),
                  QuizQn(
                    opt1: "Not at all",
                    opt2: "Several days",
                    opt3: "More than half of the days",
                    opt4: "Nearly every day",
                    question: "Poor appetite or overeating",
                    onOptionChanged: (val) {
                      setState(() {
                        _q[4] = val;
                      });
                    },
                  ),
                  QuizQn(
                    opt1: "Not at all",
                    opt2: "Several days",
                    opt3: "More than half of the days",
                    opt4: "Nearly every day",
                    question:
                        "Feeling bad about yourself - or that you are a failure or have let yourself or your family down",
                    onOptionChanged: (val) {
                      setState(() {
                        _q[5] = val;
                      });
                    },
                  ),
                  QuizQn(
                    opt1: "Not at all",
                    opt2: "Several days",
                    opt3: "More than half of the days",
                    opt4: "Nearly every day",
                    question:
                        "Trouble concentrating on things, such as reading the newspaper or watching television",
                    onOptionChanged: (val) {
                      setState(() {
                        _q[6] = val;
                      });
                    },
                  ),
                  QuizQn(
                    opt1: "Not at all",
                    opt2: "Several days",
                    opt3: "More than half of the days",
                    opt4: "Nearly every day",
                    question:
                        "Moving or speaking so slowly that other people could have noticed",
                    onOptionChanged: (val) {
                      setState(() {
                        _q[7] = val;
                      });
                    },
                  ),
                  QuizQn(
                    opt1: "Not at all",
                    opt2: "Several days",
                    opt3: "More than half of the days",
                    opt4: "Nearly every day",
                    question:
                        "Thoughts that you would be better off dead, or of hurting yourself",
                    onOptionChanged: (val) {
                      setState(() {
                        _q[8] = val;
                      });
                    },
                  ),
                  QuizQn(
                    opt1: "Not at all",
                    opt2: "Several days",
                    opt3: "More than half of the days",
                    opt4: "Nearly every day",
                    question:
                        "If you've had any days with issues above, how difficult have these problems made it for you at work, home, school, or with other people?",
                    onOptionChanged: (val) {
                      setState(() {
                        _q[9] = val;
                      });
                    },
                  ),
                ]),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
