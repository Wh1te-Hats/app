import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:pragati_v1/main.dart';

class PieChartSample extends StatefulWidget {
  @override
  State<PieChartSample> createState() => _PieChartSampleState();
}

class _PieChartSampleState extends State<PieChartSample> {
  List<double> radius = [50, 30, 20];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: PieChart(
        PieChartData(
          sections: [
            PieChartSectionData(
              color: Color.fromARGB(255, 37, 78, 155),
              value: 30, // Percentage value (e.g., 30%)
              title: 'General Aptitude \n ${radius[0]}%', // Text to display
              radius: 80, // Adjust the radius as needed
            ),
            PieChartSectionData(
              color: Colors.white,
              value: 40, // Percentage value (e.g., 40%)
              title: 'Subject Based \n  ${radius[1]}%', // Text to display
              radius: 80, // Adjust the radius as needed
            ),
            PieChartSectionData(
              color: MyApp.secondary,
              value: 30, // Percentage value (e.g., 30%)
              title: 'Course Based \n  ${radius[2]}%',
              titleStyle: TextStyle(), // Text to display
              radius: 80, // Adjust the radius as needed
            ),
          ],
        ),
      ),
    );
  }
}
