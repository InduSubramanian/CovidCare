import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fl_chart/fl_chart.dart';

import '../providers/HealthLogList.dart';

class LogGraph extends StatefulWidget {
  LogGraph({Key key}) : super(key: key);

  @override
  _LogGraphState createState() => _LogGraphState();
}

class _LogGraphState extends State<LogGraph> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var healthLogList = Provider.of<HealthLogList>(context);
    var length = healthLogList.logLength();

    List<FlSpot> flSpotsOxygen = [];
    List<FlSpot> flSpotsTemp = [];
    List<FlSpot> flSpotsPulse = [];

    // List<double> dates = [];

    for (var i = 0; i < length; i++) {
      flSpotsOxygen
          .add(FlSpot(i.toDouble(), healthLogList.healthLogs[i].oxygenSat));
      flSpotsTemp.add(FlSpot(i.toDouble(), healthLogList.healthLogs[i].temp));
      flSpotsPulse.add(FlSpot(
          i.toDouble(), healthLogList.healthLogs[i].heartRate.toDouble()));
      // healthLogList.healthLogs[i].date.day.toDouble(),

    }

    return ListView(
      children: [
        Text("Oxygen Saturation Data"),
        SizedBox(height: size.height * 0.04),
        Container(
          height: size.height * 0.2,
          width: size.width * 0.2,
          child: LineChart(
            LineChartData(
              gridData: FlGridData(drawHorizontalLine: false),
              borderData: FlBorderData(
                  border: Border(
                      left: BorderSide(width: 1),
                      bottom: BorderSide(width: 1))),
              minY: 90,
              lineBarsData: [
                LineChartBarData(
                    spots: flSpotsOxygen, colors: [Colors.pink], isCurved: true)
              ],
            ),
          ),
        ),
        Text("Temperature Data"),
        SizedBox(height: size.height * 0.04),
        SizedBox(
          height: size.height * 0.2,
          width: size.width * 0.2,
          child: LineChart(
            LineChartData(
              gridData: FlGridData(drawHorizontalLine: false),
              borderData: FlBorderData(
                  border: Border(
                      left: BorderSide(width: 1),
                      bottom: BorderSide(width: 1))),
              minY: 96,
              lineBarsData: [
                LineChartBarData(
                    spots: flSpotsTemp, colors: [Colors.pink], isCurved: true)
              ],
            ),
            swapAnimationDuration: Duration(milliseconds: 150), // Optional
          ),
        ),
        Text("Heart Rate Data"),
        SizedBox(height: size.height * 0.04),
        SizedBox(
          height: size.height * 0.2,
          width: size.width * 0.2,
          child: LineChart(
            LineChartData(
              gridData: FlGridData(drawHorizontalLine: false),
              borderData: FlBorderData(
                  border: Border(
                      left: BorderSide(width: 1),
                      bottom: BorderSide(width: 1))),
              minY: 60,
              lineBarsData: [
                LineChartBarData(
                    spots: flSpotsPulse, colors: [Colors.pink], isCurved: true)
              ],
            ),
          ),
        ),
      ],
    );
  }
}
