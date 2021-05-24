import 'package:flutter/material.dart';

class ProfileItem extends StatelessWidget {
  final String title;
  final String value;
  const ProfileItem({Key key, @required this.title, @required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          height: size.height * 0.02,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: RichText(
            text: TextSpan(
              text: title,
              style: TextStyle(
                  color: const Color(0xff1d617a),
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
              children: [
                TextSpan(
                  text: value,
                  style: TextStyle(
                      color: const Color(0xff000000),
                      fontSize: 18,
                      fontWeight: FontWeight.normal),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
