import 'package:flutter/material.dart';

class RegisterBackground extends StatelessWidget {
  final Widget child;

  const RegisterBackground({Key key, @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          child: Image.asset("./images/BgTop.png"),
          width: size.width,
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Image.asset("./images/BgBottom.png"),
          width: size.width,
        ),
        child,
      ],
    );
  }
}
