import 'package:flutter/material.dart';

class Breather extends StatefulWidget {
  Breather({Key key}) : super(key: key);

  @override
  _BreatherState createState() => _BreatherState();
}

class _BreatherState extends State<Breather> {
  double opacity = 1.0;

  @override
  void initState() {
    super.initState();
    changeOpacity();
  }

  changeOpacity() {
    Future.delayed(Duration(seconds: 8), () {
      setState(() {
        opacity = opacity == 0.0 ? 1.0 : 0.0;
        changeOpacity();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      AnimatedOpacity(
        opacity: opacity,
        duration: Duration(milliseconds: 500),
        child: Text(
          "BREATHE IN",
          style: TextStyle(
              color: const Color(0xff1d617a),
              fontWeight: FontWeight.bold,
              fontSize: 18),
        ),
      ),
      AnimatedOpacity(
        opacity: opacity == 1 ? 0 : 1,
        duration: Duration(milliseconds: 500),
        child: Text(
          'BREATHE OUT',
          style: TextStyle(
              color: const Color(0xff1d617a),
              fontWeight: FontWeight.bold,
              fontSize: 18),
        ),
      ),
    ]);
  }
}
