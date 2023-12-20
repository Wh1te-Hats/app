// import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pragati_v1/Widgets/customText.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                customText(
                  'Tests for You',
                  Colors.white,
                  30.0,
                  EdgeInsets.fromLTRB(20, 20, 20, 20),
                  FontWeight.w400,
                  FontStyle.normal,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20.0, 20.0, 10.0, 0.0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.15,
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
                      onPressed: () async {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        prefs.setString('type', 'general');
                        context.go('/generalAptitude');
                      },
                      child: Column(
                        children: [
                          customText(
                            'General Aptitude',
                            Colors.white,
                            28.0,
                            EdgeInsets.fromLTRB(20, 10, 20, 0),
                            FontWeight.w400,
                            FontStyle.normal,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              customText(
                                'Start Preparation',
                                MyApp.secondary,
                                20.0,
                                EdgeInsets.fromLTRB(20, 30, 0, 10),
                                FontWeight.w400,
                                FontStyle.normal,
                              ),
                              IconButton(
                                padding: EdgeInsets.fromLTRB(0, 30, 20, 5),
                                iconSize: 30.0,
                                color: MyApp.secondary,
                                onPressed: () async {
                                  SharedPreferences prefs =
                                      await SharedPreferences.getInstance();
                                  prefs.setString('type', 'general');
                                  context.go(
                                    '/generalAptitude',
                                  );
                                },
                                icon: const Icon(Icons.arrow_forward_ios_sharp),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20.0, 20.0, 10.0, 0.0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.15,
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
                      onPressed: () async {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        prefs.setString('type', 'course');
                        context.go('/courseBased');
                      },
                      child: Column(
                        children: [
                          customText(
                            'Course Based',
                            Colors.white,
                            28.0,
                            EdgeInsets.fromLTRB(20, 10, 20, 0),
                            FontWeight.w400,
                            FontStyle.normal,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              customText(
                                'Start Preparation',
                                MyApp.secondary,
                                20.0,
                                EdgeInsets.fromLTRB(20, 30, 0, 10),
                                FontWeight.w400,
                                FontStyle.normal,
                              ),
                              IconButton(
                                padding: EdgeInsets.fromLTRB(0, 30, 20, 5),
                                iconSize: 30.0,
                                color: MyApp.secondary,
                                onPressed: () async {
                                  SharedPreferences prefs =
                                      await SharedPreferences.getInstance();
                                  prefs.setString('type', 'course');
                                  context.go('/courseBased');
                                },
                                icon: const Icon(Icons.arrow_forward_ios_sharp),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20.0, 20.0, 10.0, 0.0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.15,
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
                      onPressed: () async {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        prefs.setString('type', 'course');
                        context.go('/courseBased');
                      },
                      child: Column(
                        children: [
                          customText(
                            'Career Based',
                            Colors.white,
                            28.0,
                            EdgeInsets.fromLTRB(20, 10, 20, 0),
                            FontWeight.w400,
                            FontStyle.normal,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              customText(
                                'Start Preparation',
                                MyApp.secondary,
                                20.0,
                                EdgeInsets.fromLTRB(20, 30, 0, 10),
                                FontWeight.w400,
                                FontStyle.normal,
                              ),
                              IconButton(
                                padding: EdgeInsets.fromLTRB(0, 30, 20, 5),
                                iconSize: 30.0,
                                color: MyApp.secondary,
                                onPressed: () async {
                                  SharedPreferences prefs =
                                      await SharedPreferences.getInstance();
                                  prefs.setString('type', 'course');
                                  context.go('/courseBased');
                                },
                                icon: const Icon(Icons.arrow_forward_ios_sharp),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
