import 'package:flutter/material.dart';

class GuidelinesScreen extends StatelessWidget {
  const GuidelinesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print(size.width);
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        height: size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "COVID CARE",
                      style: TextStyle(
                          color: const Color(0xff1D617A),
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    Text(
                      "Indu",
                      style: TextStyle(
                          color: const Color(0xff1D617A), fontSize: 18),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Guidelines for the patient",
                  style:
                      TextStyle(color: const Color(0xfff05945), fontSize: 24),
                ),
              ),
              SizedBox(height: size.height * 0.02),
              Row(
                children: [
                  Container(
                    height: size.height * 0.45,
                    width: size.width * 0.44,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: const Color(0xffe9e9e9),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              "Patient should at all times use triple layer medical mask. Discard mask after 8 hours of use. In the event of care giver entering the room, both care giver and patient may consider using N 95 mask."),
                          Image.asset("./images/Wear Mask 1.png")
                        ]),
                  ),
                  SizedBox(width: size.width * 0.02),
                  Container(
                    height: size.height * 0.45,
                    width: size.width * 0.44,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: const Color(0xffe9e9e9),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              "Frequent hand washing with soap and water for at least 40 seconds or clean with alcohol-based sanitizer.Don’t share personal items with other people."),
                          Image.asset("./images/Wash hands 1.png")
                        ]),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.02),
              Container(
                width: size.width,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: const Color(0xffe9e9e9),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: size.width * 0.5,
                        child: Text(
                            "The patient should be kept in a well-ventilated room with cross ventilation and windows should be kept open to allow fresh air to come in"),
                      ),
                      Image.asset("./images/ventilation 1.png")
                    ]),
              ),
              SizedBox(height: size.height * 0.02),
              Container(
                width: size.width,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: const Color(0xffe9e9e9),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: size.width * 0.36,
                        child: Text(
                            "Patient must isolate himself from other household members, stay in the identified room and away from other people in home."),
                      ),
                      Image.asset("./images/distancing_1.png")
                    ]),
              ),
              SizedBox(height: size.height * 0.04),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Guidelines for the patient",
                  style:
                      TextStyle(color: const Color(0xfff05945), fontSize: 24),
                ),
              ),
              SizedBox(height: size.height * 0.02),
              Container(
                width: size.width,
                // height: size.height,
                child: Column(
                  children: [
                    Container(
                      width: size.width,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: const Color(0xffe9e9e9),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "MASK",
                              style: TextStyle(
                                  color: const Color(0xff1d617a), fontSize: 18),
                            ),
                          ),
                          SizedBox(height: size.height * 0.01),
                          RichText(
                            text: TextSpan(
                              style: TextStyle(color: Colors.black),
                              text: '• ',
                              children: [
                                TextSpan(
                                    text:
                                        "Consider using triple layer masks whenever you step out of home or if you are a care-giver. ")
                              ],
                            ),
                          ),
                          SizedBox(height: size.height * 0.01),
                          RichText(
                            text: TextSpan(
                              style: TextStyle(color: Colors.black),
                              text: '• ',
                              children: [
                                TextSpan(
                                    text:
                                        "If the mask gets wet or dirty with secretions,it must be changed.")
                              ],
                            ),
                          ),
                          SizedBox(height: size.height * 0.01),
                          RichText(
                            text: TextSpan(
                              style: TextStyle(color: Colors.black),
                              text: '• ',
                              children: [
                                TextSpan(
                                    text:
                                        "Discard the mask after use and perform hand hygiene after disposal of the mask.")
                              ],
                            ),
                          ),
                          SizedBox(height: size.height * 0.01),
                          RichText(
                            text: TextSpan(
                              style: TextStyle(color: Colors.black),
                              text: '• ',
                              children: [
                                TextSpan(
                                    text:
                                        "Front portion of the mask should not be touched during use")
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                    Container(
                      width: size.width,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: const Color(0xffe9e9e9),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "HAND HYGIENE",
                              style: TextStyle(
                                  color: const Color(0xff1d617a), fontSize: 18),
                            ),
                          ),
                          SizedBox(height: size.height * 0.01),
                          RichText(
                            text: TextSpan(
                              style: TextStyle(color: Colors.black),
                              text: '• ',
                              children: [
                                TextSpan(
                                    text:
                                        "Hand hygiene must be ensured following contact with ill person or his immediate environment.")
                              ],
                            ),
                          ),
                          SizedBox(height: size.height * 0.01),
                          RichText(
                            text: TextSpan(
                              style: TextStyle(color: Colors.black),
                              text: '• ',
                              children: [
                                TextSpan(
                                    text:
                                        "Hand hygiene should also be practiced before and after preparing food, before eating, after using the toilet, and whenever hands look dirty")
                              ],
                            ),
                          ),
                          SizedBox(height: size.height * 0.01),
                          RichText(
                            text: TextSpan(
                              style: TextStyle(color: Colors.black),
                              text: '• ',
                              children: [
                                TextSpan(
                                    text:
                                        "Use soap and water for hand washing at least for 40 seconds. Alcohol-based hand rub can be used, if hands are not visibly soiled.")
                              ],
                            ),
                          ),
                          SizedBox(height: size.height * 0.01),
                          RichText(
                            text: TextSpan(
                              style: TextStyle(color: Colors.black),
                              text: '• ',
                              children: [
                                TextSpan(
                                    text:
                                        "Perform hand hygiene before and after removing gloves")
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                    Container(
                      width: size.width,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: const Color(0xffe9e9e9),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "EXPOSURE TO PATIENT",
                              style: TextStyle(
                                  color: const Color(0xff1d617a), fontSize: 18),
                            ),
                          ),
                          SizedBox(height: size.height * 0.01),
                          RichText(
                            text: TextSpan(
                              style: TextStyle(color: Colors.black),
                              text: '• ',
                              children: [
                                TextSpan(
                                    text:
                                        "Avoid direct contact with body fluids of the patient, particularly oral or respiratory secretions. ")
                              ],
                            ),
                          ),
                          SizedBox(height: size.height * 0.01),
                          RichText(
                            text: TextSpan(
                              style: TextStyle(color: Colors.black),
                              text: '• ',
                              children: [
                                TextSpan(
                                    text:
                                        "Food must be provided to the patient in his room. Utensils and dishes used by the patient should be cleaned with soap/detergent and water wearing gloves. The utensils and dishes may be re-used.")
                              ],
                            ),
                          ),
                          SizedBox(height: size.height * 0.01),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: RichText(
                              text: TextSpan(
                                style: TextStyle(color: Colors.black),
                                text: '• ',
                                children: [
                                  TextSpan(
                                      text:
                                          "Use disposable gloves while handling the patient.")
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: size.height * 0.01),
                          RichText(
                            text: TextSpan(
                              style: TextStyle(color: Colors.black),
                              text: '• ',
                              children: [
                                TextSpan(
                                    text:
                                        "Avoid exposure to potentially contaminated items in his immediate environment (e.g. avoid sharing cigarettes, eating utensils, dishes, drinks, used towels or bed linen).")
                              ],
                            ),
                          ),
                          SizedBox(height: size.height * 0.01),
                          RichText(
                            text: TextSpan(
                              style: TextStyle(color: Colors.black),
                              text: '• ',
                              children: [
                                TextSpan(
                                    text:
                                        "Clean hands after taking off gloves or handling used items. Use triple layer medical mask and disposable gloves while cleaning or handling surfaces, clothing or linen used by the patient")
                              ],
                            ),
                          ),
                        ],
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
