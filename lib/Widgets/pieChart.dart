import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:pragati_v1/main.dart';

class PieChartSample extends StatefulWidget {
  final double one;
  final double two;
  final double three;

  PieChartSample(this.one, this.two, this.three);
  @override
  State<PieChartSample> createState() => _PieChartSampleState();
}

class _PieChartSampleState extends State<PieChartSample> {
  // List<double> radius = [40, 30, 30];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: PieChart(
        PieChartData(
          sections: [
            PieChartSectionData(
              color: Color.fromARGB(255, 223, 75, 105),
              value: widget.one, // Percentage value (e.g., 30%)
              title: '${widget.one}%', // Text to display
              radius: 70,
              titleStyle: TextStyle(
                fontFamily: 'Aeonik',
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ), // Adjust the radius as needed
            ),
            PieChartSectionData(
              color: Color.fromARGB(255, 238, 245, 44),
              value: widget.two, // Percentage value (e.g., 40%)
              title: '${widget.two}%',
              titleStyle: TextStyle(
                fontFamily: 'Aeonik',
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ), // Text to display
              radius: 80, // Adjust the radius as needed
            ),
            PieChartSectionData(
              color: MyApp.secondary,
              value: widget.three, // Percentage value (e.g., 30%)
              title: '${widget.three} %',
              titleStyle: TextStyle(
                fontFamily: 'Aeonik',
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ), // Text to display
              radius: 90, // Adjust the radius as needed
            ),
          ],
        ),
      ),
    );
  }
}
