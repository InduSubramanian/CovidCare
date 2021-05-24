import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/HealthLogList.dart';
import '../widgets/LogGraph.dart';

class HealthLogMain extends StatelessWidget {
  const HealthLogMain({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HealthLogList healthLogList = Provider.of<HealthLogList>(context);

    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        healthLogList.logLength() == 0
            ? Container(
                height: size.height * 0.5,
                child: Center(
                    child: Text(
                  "Start Logging your health records today!!",
                )))
            : Align(
                alignment: Alignment.centerLeft,
                child: Container(
                    // alignment: Alignment.topLeft,
                    height: size.height * 0.6,
                    width: size.width * 0.79,
                    child: LogGraph()),
              ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Add a health log",
              style: TextStyle(
                color: const Color(0xff1D617A),
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(width: size.width * 0.03),
            Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey[500],
                      offset: Offset(0, 2),
                      blurRadius: 1.2,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(50),
                  color: const Color(0xfff05945),
                ),
                child: IconButton(
                    icon: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, "/AddHealthLogScreen");
                    }))
          ],
        ),
      ],
    );
  }
}
