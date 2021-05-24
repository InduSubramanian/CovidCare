import 'package:flutter/material.dart';

class WelcomeBackground extends StatelessWidget {
  final Widget child;
  final double bottomMargin;

  const WelcomeBackground(
      {Key key, @required this.child, @required this.bottomMargin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Positioned(
          bottom: bottomMargin,
          right: 0,
          child: Image.asset("./images/BgBottom.png"),
          width: size.width,
        ),
        child,
      ],
    );
  }
}
