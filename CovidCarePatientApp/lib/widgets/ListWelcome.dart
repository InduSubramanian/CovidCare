import 'package:flutter/material.dart';

class ListWelcome extends StatelessWidget {
  final String text;
  final String icon;
  const ListWelcome({
    Key key,
    this.text,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Image.asset(
            icon,
          ),
          Container(
            width: 250,
            alignment: Alignment.center,
            child: Text(
              text,
              style: TextStyle(fontSize: 19),
            ),
          )
        ],
      ),
    );
  }
}
