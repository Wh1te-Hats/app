import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pragati_v1/Models/analytics.dart';
import 'package:pragati_v1/Widgets/bargraph.dart';
import 'package:pragati_v1/Widgets/pieChart.dart';
import 'package:pragati_v1/apiService.dart';
import 'package:pragati_v1/main.dart';
import 'package:pragati_v1/Widgets/customText.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  late ScrollController _scrollController;
  late List<TestScore> list ;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  late String? storedUserId;
  late String? storedName;
  late String? storedGrade;

  Future<void> wait() async {
    // Simulate an asynchronous operation,
    // await Future.delayed(const Duration(seconds: 1));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    storedUserId = prefs.getString('user_id');
    storedName = prefs.getString('name');
    storedGrade = prefs.getString('grade');
    list = await apiCollege().getDashboard2(storedUserId!);

  }

  final List<double> data1 = [100, 84, 40, 90, 50, 100];
  final List<double> data2 = [100, 45, 96, 83, 95];
  final List<double> data3 = [100, 86, 56, 83];
  final List<String> category1 = ["GK", "LR", "AR", "VR", "NVR", "VA"];
  final List<String> category2 = ["Sc", "Ma", "Hi", "En", "St"];
  final List<String> category3 = ["GM", "LU", "HS", "CA"];

  int select = 1;

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
        body: FutureBuilder<void>(
            future: wait(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // Show a loading indicator while waiting for data
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 4,
                        color: Colors.white,
                      ),
                    ),
                    customText(
                        'DashBoard...',
                        Colors.white,
                        28.0,
                        EdgeInsets.fromLTRB(20.0, 20, 20.0, 5.0),
                        FontWeight.bold,
                        FontStyle.normal)
                  ],
                );
              } else if (snapshot.hasError) {
                // Handle errors
                return Text('Error: ${snapshot.error}');
              } else {
                // Display data once it's loaded
                return SingleChildScrollView(
                  key: PageStorageKey<String>('ListViewKey'),
                  controller: _scrollController,
                  child: Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.16,
                        margin: EdgeInsets.only(
                            top: 5.0, bottom: 5.0, left: 10.0, right: 10.0),
                        padding: EdgeInsets.only(
                            top: 6.0, bottom: 5.0, left: 5.0, right: 5.0),
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(10, 30, 46, 0.6),
                            borderRadius: BorderRadius.circular(15.0),
                            border: Border.all(color: MyApp.secondary)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // ),
                            Row(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                  child: CircleAvatar(
                                    radius: 25,
                                    child: Image.asset(
                                      'assets/images/student-2.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        customText(
                                            'Hi!',
                                            MyApp.secondary,
                                            28.0,
                                            EdgeInsets.fromLTRB(
                                                20.0, 5, 0, 5.0),
                                            FontWeight.bold,
                                            FontStyle.normal),
                                        customText(
                                            storedName!,
                                            // 'Samrath Acharya',
                                            Colors.white,
                                            26.0,
                                            EdgeInsets.fromLTRB(
                                                10.0, 5, 0, 5.0),
                                            FontWeight.w400,
                                            FontStyle.italic),
                                      ],
                                    ),
                                    customText(
                                        'Grade: ${storedGrade}',
                                        // 'Grade 10',
                                        Colors.white,
                                        22.0,
                                        EdgeInsets.fromLTRB(20.0, 2, 60, 5.0),
                                        FontWeight.w400,
                                        FontStyle.normal),
                                    customText(
                                        'User ID: ${storedUserId!.substring(0, 4)}',
                                        // 'Grade 10',
                                        Colors.white,
                                        16.0,
                                        EdgeInsets.fromLTRB(20.0, 2, 60, 5.0),
                                        FontWeight.w400,
                                        FontStyle.normal),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.15,
                            margin: EdgeInsets.only(
                                top: 10, bottom: 20, left: 10, right: 10),
                            padding: EdgeInsets.only(
                                top: 10, bottom: 0, left: 0, right: 0),
                            width: MediaQuery.of(context).size.width * 0.42,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 2, 16, 33),
                              borderRadius: BorderRadius.circular(15.0),
                              border: Border.all(
                                color: MyApp
                                    .secondary, // Set the color of the border
                                width: .60, // Set the width of the border
                                style: BorderStyle
                                    .solid, // Set the style of the border (solid, dashed, or none)
                              ),
                            ),
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/images/test-1.png',
                                  fit: BoxFit.cover,
                                  height: 45.0,
                                  width: 45.0,
                                ),
                                customText(
                                    'Total Tests',
                                    Colors.white,
                                    18.0,
                                    EdgeInsets.fromLTRB(0.0, 10, 0, 0.0),
                                    FontWeight.w500,
                                    FontStyle.normal),
                                customText(
                                    "${list[0].totalTestTaken}",
                                    Colors.white,
                                    26.0,
                                    EdgeInsets.fromLTRB(20.0, 0, 20, 0),
                                    FontWeight.w400,
                                    FontStyle.normal),
                              ],
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.15,
                            margin: EdgeInsets.only(
                                top: 10, bottom: 20, left: 10, right: 10),
                            padding: EdgeInsets.only(
                                top: 10, bottom: 0, left: 0, right: 0),
                            width: MediaQuery.of(context).size.width * 0.42,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 2, 16, 33),
                              borderRadius: BorderRadius.circular(15.0),
                              border: Border.all(
                                color: MyApp
                                    .secondary, // Set the color of the border
                                width: .60, // Set the width of the border
                                style: BorderStyle
                                    .solid, // Set the style of the border (solid, dashed, or none)
                              ),
                            ),
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/images/career-1.png',
                                  fit: BoxFit.cover,
                                  height: 45.0,
                                  width: 45.0,
                                ),
                                customText(
                                    'Time Taken',
                                    Colors.white,
                                    18.0,
                                    EdgeInsets.fromLTRB(0.0, 10, 0, 0.0),
                                    FontWeight.w500,
                                    FontStyle.normal),
                                customText(
                                     "${list[0].totalTimeSpent}",
                                    Colors.white,
                                    26.0,
                                    EdgeInsets.fromLTRB(20.0, 0, 20, 0),
                                    FontWeight.w400,
                                    FontStyle.normal),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.7,
                        margin: EdgeInsets.only(
                            top: 10, bottom: 20, left: 20, right: 20),
                        padding: EdgeInsets.only(
                            top: 0, bottom: 0, left: 0, right: 0),
                        width: MediaQuery.of(context).size.height * 0.8,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 2, 16, 33),
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(
                            color:
                                MyApp.secondary, // Set the color of the border
                            width: 0.6, // Set the width of the border
                            style: BorderStyle
                                .solid, // Set the style of the border (solid, dashed, or none)
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            customText(
                                'Tests Distribution',
                                Colors.white,
                                28.0,
                                EdgeInsets.fromLTRB(0, 15, 0, 0),
                                FontWeight.bold,
                                FontStyle.normal),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.45,
                              padding: EdgeInsets.fromLTRB(10, 05, 10, 05),
                              child: PieChartSample( list[0].generalScore*100.0, list[0].courseScore*100.0, list[0].careerScore*100.0),
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
                        margin: EdgeInsets.only(
                            top: 10, bottom: 20, left: 20, right: 20),
                        padding: EdgeInsets.only(
                            top: 0, bottom: 5, left: 0, right: 0),
                        width: MediaQuery.of(context).size.height * 0.8,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 2, 16, 33),
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(
                            color:
                                MyApp.secondary, // Set the color of the border
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
                                  margin: EdgeInsets.fromLTRB(0, 10, 0, 5),
                                  child: ElevatedButton(
                                    onPressed: (() {
                                      setState(() {
                                        select = 1;
                                        _scrollController.jumpTo(
                                            _scrollController.position.pixels);
                                      });
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
                                  width: 3,
                                  height: 60.0,
                                  color: MyApp.secondary,
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 10, 0, 5),
                                  child: ElevatedButton(
                                    onPressed: (() {
                                      setState(() {
                                        select = 2;
                                        _scrollController.jumpTo(
                                            _scrollController.position.pixels);
                                      });
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
                                  width: 3,
                                  height: 60.0,
                                  color: MyApp.secondary,
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 10, 0, 5),
                                  child: ElevatedButton(
                                    onPressed: (() {
                                      setState(() {
                                        select = 3;
                                        _scrollController.jumpTo(
                                            _scrollController.position.pixels);
                                      });
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
                            customText(
                                'Perfomance Analysis',
                                Colors.white,
                                24.0,
                                EdgeInsets.fromLTRB(25, 10, 25, 02),
                                FontWeight.w400,
                                FontStyle.normal),
                            if (select == 1)
                              BarGraphWidget(
                                // data:list[0].generalChapterScore[0].score as List<double> ,
                                data: data1,
                                category:category1 ,
                                // category: list[0].generalChapterScore[0].subtype,
                              )
                            else if (select == 2)
                              BarGraphWidget(
                                // data:list[0].generalChapterScore[0].score ,
                                // category: list[0].generalChapterScore[0].subtype,
                                data: data2,
                                category: category2,
                              )
                            else
                             BarGraphWidget(
                              // data: list[0].careerChapterScore[0].score ,
                                // category: list[0].careerChapterScore[0].subtype,
                                 data: data3 ,
                                category: category3,
                              ),
                            Divider(
                              thickness: 1,
                              color: MyApp.secondary,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }
            }),
      ),
    );
  }
}
