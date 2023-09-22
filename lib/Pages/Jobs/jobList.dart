import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pragati_v1/Models/job.dart';
import 'package:pragati_v1/Widgets/customText.dart';
import 'package:pragati_v1/main.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../apiService.dart';

class jobList extends StatefulWidget {
  final List<String> jobUserInfo;

  jobList({super.key, required this.jobUserInfo});

  @override
  State<jobList> createState() => _jobListState();
}

bool isLoaded = false;

class _jobListState extends State<jobList> {
  late List<Job>? jobList = [];

  void getData(List<String> jobUserInfo) async {
    jobList = (await apiCollege().postJobInfo(jobUserInfo));
    if (jobList != null) {
      setState(() {
        isLoaded = true;
      });
      print(jobList);
    }
  }

  @override
  void initState() {
    super.initState();
    // Access the endpointURL parameter in the initState method's body
    final List<String> jobUserInfoArray = widget.jobUserInfo;
    // print(endpointURL);
    getData(jobUserInfoArray);
  }

  void _launchURL(String _url) async {
    if (await canLaunch(_url)) {
      await launch(_url);
    } else {
      throw 'Could not launch $_url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        future: apiCollege().postJobInfo(widget.jobUserInfo),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Show a loading indicator while waiting for data
            return Center(
              child: CircularProgressIndicator(
                strokeWidth: 5,
                color: Colors.white,
              ),
            );
          } else if (snapshot.hasError) {
            // Handle errors
            return Text('Error: ${snapshot.error}');
          } else {
            // Display data once it's loaded
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                customText(
                    'Based on your requirements',
                    Colors.white,
                    24.0,
                    EdgeInsets.fromLTRB(25, 20, 28, 10),
                    FontWeight.w400,
                    FontStyle.normal),
                customText(
                    'Jobs available are',
                    MyApp.secondary,
                    24.0,
                    EdgeInsets.fromLTRB(25, 2, 15, 12),
                    FontWeight.w300,
                    FontStyle.normal),
                Expanded(
                  child: ListView.builder(
                    itemCount: jobList!.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => context.go('/JobInfo'),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.25,
                          margin: EdgeInsets.only(
                              top: 10.0, bottom: 25.0, left: 25.0, right: 25.0),
                          padding: EdgeInsets.only(
                              top: 16.0, bottom: 5.0, left: 5.0, right: 5.0),
                          width: 377.0,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white, // Border color
                              width: 0.9, // Border width
                            ),
                            color: Color.fromARGB(255, 18, 37, 53),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              customText(
                                jobList![index].jobName,
                                Colors.white,
                                20.0,
                                EdgeInsets.fromLTRB(15, 0, 0, 0),
                                FontWeight.bold,
                                FontStyle.normal,
                              ),
                              customText(
                                  jobList![index].companyName,
                                  Colors.white,
                                  20.0,
                                  EdgeInsets.fromLTRB(15, 10, 3, 0),
                                  FontWeight.normal,
                                  FontStyle.normal),
                              customText(
                                  jobList![index].location,
                                  MyApp.secondary,
                                  20.0,
                                  EdgeInsets.fromLTRB(3, 10, 3, 0),
                                  FontWeight.w400,
                                  FontStyle.normal),
                              Row(
                                children: [
                                  customText(
                                      "Visit Link : ",
                                      Colors.white,
                                      20.0,
                                      EdgeInsets.fromLTRB(15, 10, 0, 0),
                                      FontWeight.normal,
                                      FontStyle.normal),
                                  IconButton(
                                    padding: EdgeInsets.fromLTRB(5, 10, 0, 0),
                                    iconSize: 30,
                                    icon: const Icon(Icons.link),
                                    color: MyApp.secondary,
                                    onPressed: () {
                                        Uri uri = Uri.parse(jobList![index].link);
                                        launchUrl(uri);   
                                    },
                                  ),
                                ],
                              ),
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
        },
      ),
    );
  }
}
