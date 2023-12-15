import 'package:flutter/material.dart';
import 'package:pragati_v1/Widgets/customText.dart';
import 'package:pragati_v1/main.dart';

class BarGraphWidget extends StatelessWidget {
  // Example data for the bar graph
  final List<double> data = [100, 80, 40, 90, 50, 100, 80, 90];
  final List<double> marksIntervals = [
    100,
    80,
    40,
    90,
    50,
    100,
    80,
    30,
    90,
    100
  ];

  final List<String> generalCategory = ["GK", "LR", "AR", "VR", "NVR", "VA"];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: EdgeInsets.fromLTRB(25, 40, 20, 10),
        width: data.length *
            75.0, // Width of the container based on the number of bars
        height: 400.0, // Height of the container
        child: Column(
          children: [
             customText(
                    'Perfomance Analysis',
                    Colors.white,
                    24.0,
                    EdgeInsets.fromLTRB(25, 10, 28, 02),
                    FontWeight.w400,
                    FontStyle.normal),
            Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 2, 10),
                      child: customText(
                          '100',
                          Colors.white,
                          24.0,
                          EdgeInsets.fromLTRB(0, 10, 2, 0),
                          FontWeight.w400,
                          FontStyle.normal),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 2, 8),
                      child: customText(
                          '75',
                          Colors.white,
                          24.0,
                          EdgeInsets.fromLTRB(0, 10, 2, 0),
                          FontWeight.w400,
                          FontStyle.normal),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 2, 2),
                      child: customText(
                          '50',
                          Colors.white,
                          24.0,
                          EdgeInsets.fromLTRB(0, 10, 2, 0),
                          FontWeight.w400,
                          FontStyle.normal),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 2, 80),
                      child: customText(
                          '35',
                          Colors.white,
                          24.0,
                          EdgeInsets.fromLTRB(0, 10, 2, 0),
                          FontWeight.w400,
                          FontStyle.normal),
                    ),
                  ],
                ),
                Container(
                    margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                    height: 270,
                    color: Colors.white,
                    width: 2),
                Stack(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: List.generate(
                        data.length,
                        (index) => BarWidget(value: data[index]),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 145, 20, 0),
                      height: 2,
                      width: data.length *
                          65, // Set the width of the vertical line
                      color:
                          const Color.fromARGB(255, 252, 0, 0).withOpacity(0.4),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 10, 20, 10),
                      height: 2,
                      width: data.length *
                          65, // Set the width of the vertical line
                      color: Colors.white.withOpacity(0.4),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 60, 20, 10),
                      height: 2,
                      width: data.length *
                          65, // Set the width of the vertical line
                      color: Colors.white.withOpacity(0.4),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 110, 20, 10),
                      height: 2,
                      width: data.length *
                          65, // Set the width of the vertical line
                      color: Colors.white.withOpacity(0.4),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 210, 20, 10),
                      height: 2,
                      width: data.length *
                          65, // Set the width of the vertical line
                      color: Colors.white,
                    ),
                  ],
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.fromLTRB(70, 0, 10, 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: List.generate(
                  generalCategory.length,
                  (index) => customText(
                      generalCategory[index],
                      Colors.white,
                      24.0,
                      EdgeInsets.fromLTRB(0, 0,30, 0),
                      FontWeight.w400,
                      FontStyle.normal),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BarWidget extends StatelessWidget {
  final double value;

  const BarWidget({required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: MyApp.secondary.withOpacity(0.8),
        border: Border.all(
          color: MyApp.secondary, // Set the color of the border
          width: 0.6, // Set the width of the border
          style: BorderStyle
              .solid, // Set the style of the border (solid, dashed, or none)
        ),
      ),
      margin: EdgeInsets.fromLTRB(15, 10, 15, 0),
      width: 35.0, // Width of each bar
      height: value * 2, // Height of each bar based on the data
    );
  }
}
