import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../Models/stream.dart';
import '../../Widgets/customText.dart';
import '../../apiService.dart';
import '../../main.dart';

class streamDetails extends StatefulWidget {
  final String endpointURL;

  streamDetails({super.key, required this.endpointURL});

  @override
  State<streamDetails> createState() => _streamDetailsState();
}

var isLoaded = false;

class _streamDetailsState extends State<streamDetails> {
  late List<Stream>? streamDetails = [];

  @override
  void initState() {
    super.initState();
  }

  Future<void> wait() async {
    final String endpointURL = widget.endpointURL;
    streamDetails = await apiCollege().getStream(endpointURL);
  }

  @override
  void dispose() {
    // Cancel or clean up asynchronous operations here
    super.dispose();
  }

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
                        'Loading...',
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
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    customText(
                        'Courses',
                        MyApp.secondary,
                        40.0,
                        EdgeInsets.fromLTRB(0, 40, 0, 20),
                        FontWeight.normal,
                        FontStyle.normal),
                    Expanded(
                      child: ListView.builder(
                        itemCount: streamDetails!.length,
                        itemBuilder: (context, index) {
                          return SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 24.0,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    customText(
                                        '${index + 1}',
                                        MyApp.secondary,
                                        30.0,
                                        EdgeInsets.fromLTRB(27, 2, 0, 02),
                                        FontWeight.normal,
                                        FontStyle.normal),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        customText(
                                            streamDetails![index].courseName,
                                            Colors.white,
                                            24.0,
                                            EdgeInsets.fromLTRB(27, 2, 1, 02),
                                            FontWeight.bold,
                                            FontStyle.normal),
                                      ],
                                    ),
                                    IconButton(
                                      padding:
                                          EdgeInsets.fromLTRB(25, 0, 10, 0),
                                      iconSize: 27,
                                      icon:
                                          const Icon(Icons.punch_clock_rounded),
                                      color: MyApp.secondary,
                                      onPressed: () =>
                                          context.go('/CollegeInfoPage'),
                                    ),
                                    customText(
                                        streamDetails![index].courseDuration,
                                        Colors.white,
                                        18.0,
                                        EdgeInsets.fromLTRB(27, 0, 31, 0),
                                        FontWeight.w400,
                                        FontStyle.normal),
                                  ],
                                ),
                                customText(
                                    'Course Description',
                                    Colors.white,
                                    20.0,
                                    EdgeInsets.fromLTRB(25, 35, 21, 20),
                                    FontWeight.bold,
                                    FontStyle.normal),
                                customText(
                                    streamDetails![index].courseDescription,
                                    Colors.white,
                                    16.0,
                                    EdgeInsets.fromLTRB(22, 5, 22, 40),
                                    FontWeight.w400,
                                    FontStyle.normal),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 1.1,
                                  margin: EdgeInsets.only(
                                      top: 0.0,
                                      bottom: 25.0,
                                      left: 25.0,
                                      right: 25.0),
                                  padding: EdgeInsets.only(
                                      top: 16.0,
                                      bottom: 5.0,
                                      left: 5.0,
                                      right: 5.0),
                                  width: 377.0,
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(10, 30, 46, 0.6),
                                    borderRadius: BorderRadius.circular(15.0),
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 1,
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      customText(
                                          'Requirments',
                                          Colors.white,
                                          20.0,
                                          EdgeInsets.fromLTRB(22, 5, 0, 7),
                                          FontWeight.w400,
                                          FontStyle.normal),
                                      customText(
                                          streamDetails![index]
                                              .eligibilityRequirements,
                                          MyApp.secondary,
                                          20.0,
                                          EdgeInsets.fromLTRB(22, 5, 10, 7),
                                          FontWeight.normal,
                                          FontStyle.normal),
                                      customText(
                                          'Curriculum',
                                          Colors.white,
                                          20.0,
                                          EdgeInsets.fromLTRB(22, 35, 0, 7),
                                          FontWeight.w400,
                                          FontStyle.normal),
                                      customText(
                                          streamDetails![index]
                                              .courseCurriculum,
                                          MyApp.secondary,
                                          20.0,
                                          EdgeInsets.fromLTRB(22, 0, 0, 40),
                                          FontWeight.normal,
                                          FontStyle.normal),
                                      customText(
                                          'Strucuture',
                                          Colors.white,
                                          20.0,
                                          EdgeInsets.fromLTRB(22, 5, 0, 7),
                                          FontWeight.w400,
                                          FontStyle.normal),
                                      customText(
                                          streamDetails![index].courseStructure,
                                          MyApp.secondary,
                                          20.0,
                                          EdgeInsets.fromLTRB(22, 0, 2, 40),
                                          FontWeight.normal,
                                          FontStyle.normal),
                                      customText(
                                          'Opportunities',
                                          Colors.white,
                                          20.0,
                                          EdgeInsets.fromLTRB(22, 5, 0, 7),
                                          FontWeight.w400,
                                          FontStyle.normal),
                                      customText(
                                          streamDetails![index]
                                              .careerOpportunities,
                                          MyApp.secondary,
                                          20.0,
                                          EdgeInsets.fromLTRB(22, 0, 2, 20),
                                          FontWeight.normal,
                                          FontStyle.normal),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              }
            }),
      ),
    );
  }
}
