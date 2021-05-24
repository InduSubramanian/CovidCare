import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MapsCovidTestingScreen extends StatefulWidget {
  MapsCovidTestingScreen({Key key}) : super(key: key);

  @override
  _MapsCovidTestingScreenState createState() => _MapsCovidTestingScreenState();
}

class _MapsCovidTestingScreenState extends State<MapsCovidTestingScreen> {
  String _currentPos = "12.97,80.53";
  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl:
          'https://www.google.co.in/maps/search/covid+testing+centres+near+me/@$_currentPos,14z/data=!3m1!4b1?hl=en&authuser=1',
      javascriptMode: JavascriptMode.unrestricted,
    );
  }
}
