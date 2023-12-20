import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pragati_v1/Models/career.dart';
import 'package:pragati_v1/Widgets/customText.dart';
import 'package:pragati_v1/apiService.dart';

import '../../main.dart';

bool isLoaded = false;

class typesOfCareer extends StatefulWidget {
  final List<dynamic> list;
  typesOfCareer({super.key, required this.list});

  @override
  State<typesOfCareer> createState() => _typesOfCareerState();
}

class _typesOfCareerState extends State<typesOfCareer> {
  late List<CareerModel>? careerList = [];
  late List<String> skillList = [];

  Future<void> wait() async {
    careerList = await apiCollege().postSkills(skillList);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<dynamic> mainList = widget.list;

    for (int i = 0; i < mainList.length; i++) {
      skillList.add(mainList[i][0]);
    }
    return WillPopScope(
      onWillPop: () async {
        context.go('/skills');
        return false;
      },
      child: Scaffold(
        backgroundColor: MyApp.primaryColor,
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              customText(
                  'Pragati',
                  Colors.white,
                  22.0,
                  EdgeInsets.fromLTRB(10, 0, 0, 0),
                  FontWeight.bold,
                  FontStyle.normal),
            ],
          ),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customText(
                        'Based on your Skills',
                        Colors.white,
                        24.0,
                        EdgeInsets.fromLTRB(25, 20, 28, 02),
                        FontWeight.w400,
                        FontStyle.normal),
                    customText(
                        'We recommend you',
                        MyApp.secondary,
                        24.0,
                        EdgeInsets.fromLTRB(25, 2, 15, 20),
                        FontWeight.w300,
                        FontStyle.normal),
                    customText(
                        'Career Path in',
                        Colors.white,
                        24.0,
                        EdgeInsets.fromLTRB(25, 2, 15, 20),
                        FontWeight.w300,
                        FontStyle.normal),
                    Expanded(
                      child: ListView.builder(
                        itemCount: careerList!.length,
                        itemBuilder: (context, index) {
                          return Container(
                            height: MediaQuery.of(context).size.height * 0.24,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                color: MyApp.secondary, // Border color
                                width: 0.5, // Border width
                              ),
                            ),
                            margin: EdgeInsets.only(
                                top: 10.0,
                                bottom: 25.0,
                                left: 25.0,
                                right: 24.0),
                            padding: EdgeInsets.only(
                                top: 10.0, bottom: 5.0, left: 12.0, right: 5.0),
                            width: 377.0,
                            child: GestureDetector(
                              onTap: () => context.go('/careerInfo',
                                  extra: careerList![index]),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  customText(
                                      careerList![index].careerName,
                                      Colors.white,
                                      24.0,
                                      EdgeInsets.fromLTRB(5, 0, 28, 02),
                                      FontWeight.w400,
                                      FontStyle.normal),
                                  Row(
                                    children: [
                                      customText(
                                          '${careerList![index].careerGrowth}% increase in jobs',
                                          MyApp.secondary,
                                          20.0,
                                          EdgeInsets.fromLTRB(5, 10, 28, 02),
                                          FontWeight.w300,
                                          FontStyle.normal),
                                      IconButton(
                                        padding:
                                            EdgeInsets.fromLTRB(30, 0, 0, 0),
                                        iconSize: 55.0,
                                        color: Colors.white,
                                        onPressed: () {
                                          context.go('/careerInfo',
                                              extra: careerList![index]);
                                        },
                                        icon: const Icon(
                                            Icons.arrow_forward_rounded),
                                      ),
                                    ],
                                  ),
                                  customText(
                                      '${careerList![index].careerDescription.substring(0, 50)}....',
                                      Colors.white,
                                      16.0,
                                      EdgeInsets.fromLTRB(5, 10, 23, 10),
                                      FontWeight.w300,
                                      FontStyle.normal),
                                ],
                              ),
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
