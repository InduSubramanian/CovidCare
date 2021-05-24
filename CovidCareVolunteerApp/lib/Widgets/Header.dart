import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/Volunteer.dart';

class Header extends StatelessWidget {
  const Header({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Volunteer volunteer = Provider.of<Volunteer>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                "COVID CARE",
                style: TextStyle(
                    color: const Color(0xff1D617A),
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              FlatButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, "/GuidelinesScreen"),
                  child: Text(
                    "| Guidlines",
                    style:
                        TextStyle(color: const Color(0xfff05945), fontSize: 18),
                  ))
            ],
          ),
          FlatButton(
            onPressed: () {
              Navigator.pushNamed(context, "/ProfileScreen");
            },
            child: Text(
              volunteer.name != null ? volunteer.name : "Username",
              style: TextStyle(color: const Color(0xff1D617A), fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
