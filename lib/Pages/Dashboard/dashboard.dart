import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pragati_v1/Widgets/bargraph.dart';
import 'package:pragati_v1/Widgets/pieChart.dart';
import 'package:pragati_v1/main.dart';
import 'package:pragati_v1/Widgets/customText.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {



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
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.24,
                margin:
                    EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
                padding: EdgeInsets.only(top: 0, bottom: 0, left: 0, right: 0),
                width: MediaQuery.of(context).size.height * 0.8,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 2, 16, 33),
                  borderRadius: BorderRadius.circular(15.0),
                  // border: Border.all(
                  //   color: Colors.white, // Set the color of the border
                  //   width: 2.0, // Set the width of the border
                  //   style: BorderStyle
                  //       .solid, // Set the style of the border (solid, dashed, or none)
                  // ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: CircleAvatar(
                        backgroundColor: MyApp.secondary,
                        radius: 35,
                        child: Image.asset(
                          'assets/images/profilepic.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    customText(
                        'Samrath Acharya',
                        Colors.white,
                        22.0,
                        EdgeInsets.fromLTRB(20.0, 0, 20, 5.0),
                        FontWeight.w500,
                        FontStyle.normal),
                    customText(
                        'Grade 10',
                        Colors.white,
                        20.0,
                        EdgeInsets.fromLTRB(20.0, 05, 20, 0),
                        FontWeight.w400,
                        FontStyle.normal),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.20,
                    margin: EdgeInsets.only(
                        top: 20, bottom: 20, left: 10, right: 10),
                    padding:
                        EdgeInsets.only(top: 10, bottom: 0, left: 0, right: 0),
                    width: MediaQuery.of(context).size.width * 0.4,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 2, 16, 33),
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(
                        color: MyApp.secondary, // Set the color of the border
                        width: .60, // Set the width of the border
                        style: BorderStyle
                            .solid, // Set the style of the border (solid, dashed, or none)
                      ),
                    ),
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/studented.png',
                          fit: BoxFit.cover,
                          height: 45.0,
                          width: 45.0,
                        ),
                        customText(
                            'Total Tests',
                            Colors.white,
                            22.0,
                            EdgeInsets.fromLTRB(0.0, 20, 0, 5.0),
                            FontWeight.w500,
                            FontStyle.normal),
                        customText(
                            '10',
                            Colors.white,
                            26.0,
                            EdgeInsets.fromLTRB(20.0, 05, 20, 0),
                            FontWeight.w400,
                            FontStyle.normal),
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.20,
                    margin: EdgeInsets.only(
                        top: 20, bottom: 20, left: 10, right: 10),
                    padding:
                        EdgeInsets.only(top: 10, bottom: 0, left: 0, right: 0),
                    width: MediaQuery.of(context).size.width * 0.4,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 2, 16, 33),
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(
                        color: MyApp.secondary, // Set the color of the border
                        width: .60, // Set the width of the border
                        style: BorderStyle
                            .solid, // Set the style of the border (solid, dashed, or none)
                      ),
                    ),
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/studented.png',
                          fit: BoxFit.cover,
                          height: 45.0,
                          width: 45.0,
                        ),
                        customText(
                            'Time Taken',
                            Colors.white,
                            22.0,
                            EdgeInsets.fromLTRB(0.0, 20, 0, 5.0),
                            FontWeight.w500,
                            FontStyle.normal),
                        customText(
                            '5.5 hrs',
                            Colors.white,
                            26.0,
                            EdgeInsets.fromLTRB(20.0, 05, 20, 0),
                            FontWeight.w400,
                            FontStyle.normal),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.7,
                margin:
                    EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
                padding: EdgeInsets.only(top: 0, bottom: 0, left: 0, right: 0),
                width: MediaQuery.of(context).size.height * 0.8,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 2, 16, 33),
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(
                    color: MyApp.secondary, // Set the color of the border
                    width: 0.6, // Set the width of the border
                    style: BorderStyle
                        .solid, // Set the style of the border (solid, dashed, or none)
                  ),
                ),
                child: Column(
                  children: [
                    customText(
                          'Tests Distribution',
                          Colors.white,
                          24.0,
                          EdgeInsets.fromLTRB(0, 15, 0, 0),
                          FontWeight.w400,
                          FontStyle.normal),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.50,
                      padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                      child: PieChartSample(30, 40, 30),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(20.0, 05, 20, 0),
                          width: 20.0, // Set the width of the square
                          height: 20.0, // Set the height of the square
                          color: Colors.yellow,
                        ),
                        customText(
                            'General Aptitude',
                            Colors.white,
                            22.0,
                            EdgeInsets.fromLTRB(20.0, 05, 20, 0),
                            FontWeight.w400,
                            FontStyle.normal),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(20.0, 05, 20, 0),
                          width: 20.0, // Set the width of the square
                          height: 20.0, // Set the height of the square
                          color: MyApp.secondary,
                        ),
                        customText(
                            'Course Based',
                            Colors.white,
                            22.0,
                            EdgeInsets.fromLTRB(20.0, 05, 46, 0),
                            FontWeight.w400,
                            FontStyle.normal),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(20.0, 05, 20, 0),
                          width: 20.0, // Set the width of the square
                          height: 20.0, // Set the height of the square
                          color: Color.fromARGB(255, 223, 75, 105),
                        ),
                        customText(
                            'Career Based',
                            Colors.white,
                            22.0,
                            EdgeInsets.fromLTRB(20.0, 05, 50, 0),
                            FontWeight.w400,
                            FontStyle.normal),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.7,
                margin:
                    EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
                padding: EdgeInsets.only(top: 0, bottom: 5, left: 0, right: 0),
                width: MediaQuery.of(context).size.height * 0.8,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 2, 16, 33),
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(
                    color: MyApp.secondary, // Set the color of the border
                    width: 0.6, // Set the width of the border
                    style: BorderStyle
                        .solid, // Set the style of the border (solid, dashed, or none)
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0,10, 0, 5),
                          child: ElevatedButton(
                            style: 
                              ElevatedButton.styleFrom(
                                  side: BorderSide(
                                  width: 1,
                                  color: MyApp.secondary,
                                )),
                            onPressed: (() {
                              setState(() {});
                            }),
                            child: customText(
                                'General',
                                Colors.white,
                                22.0,
                                EdgeInsets.fromLTRB(1, 10, 1, 5),
                                FontWeight.w500,
                                FontStyle.normal),
                          ),
                        ),
                         Container(
                          margin: EdgeInsets.fromLTRB(0, 10, 0, 5),
                          child: ElevatedButton(
                            style: 
                              ElevatedButton.styleFrom(
                                  side: BorderSide(
                                  width: 1,
                                  color: MyApp.secondary,
                                )),
                            onPressed: (() {
                              setState(() {});
                            }),
                            child: customText(
                                'Course',
                                Colors.white,
                                22.0,
                                EdgeInsets.fromLTRB(1, 10, 1, 5),
                                FontWeight.w500,
                                FontStyle.normal),
                          ),
                        ),
                         Container(
                          margin: EdgeInsets.fromLTRB(0, 10, 0, 5),
                          child: ElevatedButton(
                            style: 
                              ElevatedButton.styleFrom(
                                  side: BorderSide(
                                  width: 1,
                                  color: MyApp.secondary,
                                )),
                            onPressed: (() {
                              setState(() {});
                            }),
                            child: customText(
                                'Careeer',
                                Colors.white,
                                22.0,
                                EdgeInsets.fromLTRB(1, 10, 1, 5),
                                FontWeight.w500,
                                FontStyle.normal),
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 1,
                      color: MyApp.secondary,
                    ),
                    BarGraphWidget(),
                     Divider(
                      thickness: 1,
                      color: MyApp.secondary,
                    ),
                  ],  
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
