import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pragati_v1/Models/exam.dart';
import 'package:pragati_v1/Widgets/customText.dart';
import 'package:pragati_v1/apiService.dart';
import 'package:pragati_v1/main.dart';
import 'package:url_launcher/url_launcher.dart';

// bool isLoaded = false;

class examDetails extends StatefulWidget {
  final String route;
  examDetails({super.key, required this.route});

  @override
  State<examDetails> createState() => _examDetailsState();
}

class _examDetailsState extends State<examDetails> {
  late List<Exam>? examList = [];

  void getData(String route) async {
    // if (examList != null) {
    //   setState(() {
    //     isLoaded = true;
    //   });
    // }
  }

  Future<void> wait() async {
    // Simulate an asynchronous operation,
    final String route = widget.route;
    examList = await apiCollege().getExamDetails(route);
  }

  void initState() {
    super.initState();

    // getData(route);
    // print(route);
  }

  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          context.go('/typesOfExams');
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
                  return SingleChildScrollView(
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.9,
                      child: ListView.builder(
                          itemCount: examList!.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.only(
                                  top: 10.0,
                                  bottom: 15.0,
                                  left: 10.0,
                                  right: 10.0),
                              padding: EdgeInsets.only(
                                  top: 10.0,
                                  bottom: 5.0,
                                  left: 0.0,
                                  right: 0.0),
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(10, 30, 46, 0.6),
                                borderRadius: BorderRadius.circular(15.0),
                                border: Border.all(
                                  color: MyApp
                                      .secondary, // Specify the border color here
                                  width: 1.0, // Specify the border width here
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                        radius: 25,
                                        child: Image.network(
                                          examList![index].logo,
                                          fit: BoxFit.cover,
                                          errorBuilder: (BuildContext context,
                                              Object error,
                                              StackTrace? stackTrace) {
                                            return Image.network(
                                                examList![index].logo,
                                                fit: BoxFit.cover,
                                                height: 80,
                                                width: 80, errorBuilder:
                                                    (BuildContext context,
                                                        Object error,
                                                        StackTrace?
                                                            stackTrace) {
                                              // This function will be called when there is an error loading the image
                                              // You can return a fallback image or any other widget here
                                              return Image.asset(
                                                height: 80,
                                                width: 80,
                                                'assets/images/pen-2.png', // Replace with the path to your fallback image
                                                fit: BoxFit.cover,
                                              );
                                            });
                                          },
                                        ),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.6,
                                        child: customText(
                                            examList![index].title,
                                            Colors.white,
                                            20.0,
                                            EdgeInsets.fromLTRB(20, 0, 0, 0),
                                            FontWeight.bold,
                                            FontStyle.normal),
                                      ),
                                    ],
                                  ),
                                  customText(
                                      examList![index].description,
                                      Colors.white,
                                      16.0,
                                      EdgeInsets.fromLTRB(40, 25, 40, 20),
                                      FontWeight.w400,
                                      FontStyle.normal),
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.7,
                                    margin: EdgeInsets.only(
                                        top: 0.0,
                                        bottom: 25.0,
                                        left: 25.0,
                                        right: 25.0),
                                    padding: EdgeInsets.only(
                                        top: 6.0,
                                        bottom: 5.0,
                                        left: 5.0,
                                        right: 5.0),
                                    width: MediaQuery.of(context).size.width *
                                        0.90,
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
                                            'Details',
                                            Colors.white,
                                            24.0,
                                            EdgeInsets.fromLTRB(22, 5, 0, 10),
                                            FontWeight.bold,
                                            FontStyle.normal),
                                        customText(
                                            'Eligibility:',
                                            Colors.white,
                                            18.0,
                                            EdgeInsets.fromLTRB(22, 5, 0, 7),
                                            FontWeight.w400,
                                            FontStyle.normal),
                                        customText(
                                            examList![index].eligibility,
                                            MyApp.secondary,
                                            16.0,
                                            EdgeInsets.fromLTRB(22, 0, 2, 10),
                                            FontWeight.bold,
                                            FontStyle.normal),
                                        customText(
                                            'Pass Criteria',
                                            Colors.white,
                                            18.0,
                                            EdgeInsets.fromLTRB(22, 5, 0, 7),
                                            FontWeight.w400,
                                            FontStyle.normal),
                                        customText(
                                            examList![index].passCriteria,
                                            MyApp.secondary,
                                            16.0,
                                            EdgeInsets.fromLTRB(22, 0, 0, 10),
                                            FontWeight.bold,
                                            FontStyle.normal),
                                        customText(
                                            'Registration Fees:',
                                            Colors.white,
                                            18.0,
                                            EdgeInsets.fromLTRB(22, 5, 0, 7),
                                            FontWeight.w400,
                                            FontStyle.normal),
                                        customText(
                                            examList![index].fees,
                                            MyApp.secondary,
                                            16.0,
                                            EdgeInsets.fromLTRB(22, 0, 0, 10),
                                            FontWeight.bold,
                                            FontStyle.normal),
                                        customText(
                                            'Subjects',
                                            Colors.white,
                                            18.0,
                                            EdgeInsets.fromLTRB(22, 5, 0, 7),
                                            FontWeight.w400,
                                            FontStyle.normal),
                                        customText(
                                            "${examList![index].subjects}",
                                            MyApp.secondary,
                                            16.0,
                                            EdgeInsets.fromLTRB(22, 0, 0, 10),
                                            FontWeight.bold,
                                            FontStyle.normal),
                                        Row(
                                          children: [
                                            customText(
                                                'Previous Year Papers :',
                                                Colors.white,
                                                18.0,
                                                EdgeInsets.fromLTRB(
                                                    22, 5, 0, 27),
                                                FontWeight.w400,
                                                FontStyle.normal),
                                            IconButton(
                                              padding: EdgeInsets.fromLTRB(
                                                  5, 05, 0, 25),
                                              iconSize: 30,
                                              icon: const Icon(Icons.link),
                                              color: MyApp.secondary,
                                              onPressed: () {
                                                Uri uri = Uri.parse(
                                                    examList![index].link);
                                                launchUrl(uri);
                                              },
                                            ),
                                          ],
                                        ),
                                        Center(
                                          child: Container(
                                            margin: EdgeInsets.all(12.0),
                                            child: SizedBox(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.05,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.85,
                                              child: ElevatedButton(
                                                style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all<
                                                              Color>(
                                                          MyApp.secondary),
                                                  shape: MaterialStateProperty
                                                      .all<RoundedRectangleBorder>(
                                                          RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  )),
                                                ),
                                                onPressed: () {
                                                  // String name = _textFieldController1.text;
                                                  // String password = _textFieldController2.text;
                                                  Uri uri = Uri.parse(
                                                      examList![index].link);
                                                  launchUrl(uri);
                                                },
                                                child: const Text(
                                                  'Go to Website ',
                                                  style: TextStyle(
                                                    fontStyle: FontStyle.normal,
                                                    fontSize: 22,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),
                  );
                }
              }),
        ));
  }
}
