import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/WelcomeBackground.dart';
import '../widgets/Header.dart';
import '../widgets/Patient_item.dart';

import '../Providers/PatientList.dart';

class PatientScreen extends StatefulWidget {
  const PatientScreen({Key key}) : super(key: key);

  @override
  _PatientScreenState createState() => _PatientScreenState();
}

class _PatientScreenState extends State<PatientScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    PatientList _patientListClass = Provider.of<PatientList>(context);
    List<Patient> listOfPatients = _patientListClass.patientList;
    print(listOfPatients.length);

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Container(
        height: size.height,
        width: size.width,
        child: WelcomeBackground(
          bottomMargin: -100,
          child: SingleChildScrollView(
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
                        "Patient Details",
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
                            setState(() {});
                          },
                          child: Text(
                            "Refresh",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
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
                    ),
                  ),
                  child: listOfPatients == null
                      ? Center(
                          child: Text("You do not have any patients yet!!"))
                      : Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Flexible(
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: listOfPatients.length,
                                  itemBuilder: (builder, index) {
                                    return PatientItem(
                                      address:
                                          "${listOfPatients[index].address}, ${listOfPatients[index].city}, ${listOfPatients[index].state}",
                                      index: index,
                                      name: listOfPatients[index].name,
                                      number: listOfPatients[index].number,
                                    );
                                  }),
                            )
                          ],
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
