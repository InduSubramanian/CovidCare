import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PatientItem extends StatelessWidget {
  final String name;
  final String address;
  final String number;
  final int index;

  const PatientItem(
      {Key key,
      @required this.name,
      @required this.address,
      @required this.index,
      @required this.number})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _launchUrl(String number) async {
      String url = 'tel:$number';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    Size size = MediaQuery.of(context).size;
    return Card(
      color: const Color(0xffE9E9E9),
      child: Row(
        children: [
          Container(
            alignment: Alignment.center,
            width: size.width * 0.1,
            child: Text("${index + 1}"),
          ),
          Container(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            decoration: BoxDecoration(
                border:
                    Border(left: BorderSide(color: const Color(0xffC4C4C4)))),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                name,
                style: TextStyle(fontSize: 18),
              ),
              Container(
                width: size.width * 0.5,
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  address,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Row(
                children: [
                  Icon(
                    Icons.call,
                    size: 16,
                  ),
                  FlatButton(
                      onPressed: () => _launchUrl(number), child: Text(number)),
                ],
              )
            ]),
          )
        ],
      ),
    );
  }
}
