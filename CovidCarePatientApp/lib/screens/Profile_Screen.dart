import 'package:CovidCare/providers/ScreenArguments.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/Profile.dart';

import '../widgets/Profile_item.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Profile _p = Profile();
  bool _edit = false;
  @override
  Widget build(BuildContext context) {
    Profile _profile = Provider.of<Profile>(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: size.height,
        child: Column(
          children: [
            SizedBox(height: size.height * 0.03),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "COVID CARE",
                  style: TextStyle(
                      color: const Color(0xff1D617A),
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.01),
            Container(
              width: size.width,
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              color: const Color(0xffcce0d2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Profile",
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
                    child: _profile.name == null || _edit == true
                        ? FlatButton(
                            child: Text("Done",
                                style: TextStyle(color: Colors.white)),
                            onPressed: () {
                              _profile.addProfile(_p);

                              Navigator.pushNamed(context, '/HomeScreen',
                                  arguments: ScreenArguments(0, null));
                            })
                        : FlatButton(
                            child: Text("Edit",
                                style: TextStyle(color: Colors.white)),
                            onPressed: () {
                              setState(() {
                                _edit = true;
                              });
                            }),
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
              child: _profile.name == null || _edit == true
                  ? Column(
                      children: [
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        TextField(
                          decoration: InputDecoration(hintText: 'Name'),
                          textInputAction: TextInputAction.next,
                          onChanged: (value) {
                            setState(() {
                              _p.name = value;
                            });
                          },
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        TextField(
                          decoration: InputDecoration(hintText: 'Address'),
                          textInputAction: TextInputAction.next,
                          onChanged: (value) {
                            setState(() {
                              _p.address = value;
                            });
                          },
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        TextField(
                          decoration: InputDecoration(hintText: 'State'),
                          textInputAction: TextInputAction.next,
                          onChanged: (value) {
                            setState(() {
                              _p.state = value;
                            });
                          },
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        TextField(
                          decoration: InputDecoration(hintText: 'City'),
                          textInputAction: TextInputAction.next,
                          onChanged: (value) {
                            setState(() {
                              _p.city = value;
                            });
                          },
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        TextField(
                          decoration: InputDecoration(hintText: 'Phone number'),
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            setState(() {
                              _p.number = value;
                            });
                          },
                        )
                      ],
                    )
                  : Column(
                      children: [
                        ProfileItem(title: "Name: ", value: _profile.name),
                        ProfileItem(
                            title: "Address: ", value: _profile.address),
                        ProfileItem(title: "State: ", value: _profile.state),
                        ProfileItem(title: "City: ", value: _profile.city),
                        ProfileItem(
                            title: "Phone number: ", value: _profile.number),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
