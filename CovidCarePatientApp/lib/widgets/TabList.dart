import 'package:flutter/material.dart';

class TabList extends StatelessWidget {
  final String text;
  final IconData icon;
  final dynamic size;

  const TabList({Key key, @required this.text, @required this.icon, this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        children: [
          Text(text),
          Icon(
            icon,
            size: size,
          )
        ],
      ),
    );
  }
}
