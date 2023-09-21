// import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pragati_v1/Widgets/customText.dart';


import '../../Widgets/pieChart.dart';
import '../../main.dart';

class AptitudeHome extends StatefulWidget {
  const AptitudeHome({super.key});

  @override
  State<AptitudeHome> createState() => _AptitudeHomeState();
}

class _AptitudeHomeState extends State<AptitudeHome> {

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.go('/home');
        return false;
      },
      child: Scaffold(
        backgroundColor: MyApp.primaryColor,
        appBar: AppBar(
          title: const Text(MyApp.title),
          actions: [
            IconButton(
              padding: EdgeInsets.fromLTRB(0, 0, 30, 10),
              iconSize: 35.0,
              color: Colors.white,
              onPressed: () {},
              icon: const Icon(Icons.menu),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                customText(
                  'Tests for You',
                  Colors.white,
                  40.0,
                  EdgeInsets.fromLTRB(20, 40, 20, 20),
                  FontWeight.w400,
                  FontStyle.normal,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20.0, 40.0, 10.0, 0.0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.12,
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            MyApp.primaryColor.withOpacity(0.3)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                              color: MyApp.secondary,
                            ), // Use CircleBorder to make the button circular
                          ),
                        ),
                      ),
                      onPressed: () => context.go('/generalAptitude'),
                      child: const Text(
                        'General Aptitude',
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontSize: 28,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20.0, 40.0, 10.0, 0.0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.12,
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            MyApp.primaryColor.withOpacity(0.3)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                              color: MyApp.secondary,
                            ), // Use CircleBorder to make the button circular
                          ),
                        ),
                      ),
                      onPressed: () => context.go('/welcome'),
                      child: const Text(
                        'Course Based',
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontSize: 28,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20.0, 40.0, 10.0, 0.0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.12,
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            MyApp.primaryColor.withOpacity(0.3)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                              color: MyApp.secondary,
                            ), // Use CircleBorder to make the button circular
                          ),
                        ),
                      ),
                      onPressed: () => context.go('/welcome'),
                      child: const Text(
                        'Subject Based',
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontSize: 28,
                        ),
                      ),
                    ),
                  ),
                ),
                customText(
                  'Analytics',
                  Colors.white,
                  40.0,
                  EdgeInsets.fromLTRB(20, 80, 20, 0),
                  FontWeight.w400,
                  FontStyle.normal,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20.0, 40.0, 10.0, 0.0),
                  height: 300,
                  child: PieChartSample(),
                ),
                customText(
                  'Performance',
                  Colors.white,
                  30.0,
                  EdgeInsets.fromLTRB(20, 40, 20, 20),
                  FontWeight.w400,
                  FontStyle.normal,
                ),
                Container(
                    child: Column(
                  children: [
                    customText(
                  'You : 60 (BarGraph)',
                  Colors.white,
                  20.0,
                  EdgeInsets.fromLTRB(20, 40, 20, 20),
                  FontWeight.w400,
                  FontStyle.normal,
                ),
                customText(
                  'Average : 80 (Bar Graph)',
                  Colors.white,
                  20.0,
                  EdgeInsets.fromLTRB(20, 40, 20, 20),
                  FontWeight.w400,
                  FontStyle.normal,
                ),
                  ],
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
