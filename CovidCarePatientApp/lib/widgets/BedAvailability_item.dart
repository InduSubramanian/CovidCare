import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BedAvailabilityState extends StatefulWidget {
  final String url;
  final String state;

  const BedAvailabilityState(
      {Key key, @required this.state, @required this.url})
      : super(key: key);

  @override
  _BedAvailabilityStateState createState() => _BedAvailabilityStateState();
}

class _BedAvailabilityStateState extends State<BedAvailabilityState> {
  void _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: const Color(0xffe0e0e0e0),
            borderRadius: BorderRadius.circular(10)),
        child: FlatButton(
          onPressed: () {
            _launchUrl(widget.url);
          },
          child: Text(widget.state,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xff1d617a),
                  fontWeight: FontWeight.bold,
                  fontSize: 20)),
        ));
  }
}
