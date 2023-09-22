import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pragati_v1/Widgets/customText.dart';
import 'package:pragati_v1/main.dart';

class typesOfExam extends StatefulWidget {
  const typesOfExam({super.key});

  @override
  State<typesOfExam> createState() => _typesOfExamState();
}

class _typesOfExamState extends State<typesOfExam> {
  List<String> typesOfExam = [
    "School Based Exams",
    "Engineering Exams",
    "Medical Exams",
    "Govt. Job Exams",
    "National Level Science Exams",
    "UGC NET",
    "MBA Entrance",
    "Architecture",
    "Central Applications",
    "Central University Exam",
    "Hotel Mangement",
    "Law",
    "Agriculture",
  ];

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
          child: Container(
            height: MediaQuery.of(context).size.height * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                customText(
                  'Exams for You',
                  MyApp.secondary,
                  26.0,
                  EdgeInsets.fromLTRB(20, 20, 20, 20),
                  FontWeight.w400,
                  FontStyle.normal,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: typesOfExam.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: MediaQuery.of(context).size.height * 0.08,
                        margin: EdgeInsets.only(
                            top: 10.0, bottom: 5.0, left: 25.0, right: 25.0),
                        padding: EdgeInsets.only(
                            top: 5.0, bottom: 5.0, left: 1.0, right: 1.0),
                        width: MediaQuery.of(context).size.width * 0.8,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(10, 30, 46, .95),
                          borderRadius: BorderRadius.circular(5.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white,
                              spreadRadius: 1.0,
                            ),
                          ],
                        ),
                        child: GestureDetector(
                          onTap: () => context.go('/CollegeInfo'),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  customText(
                                    typesOfExam[index],
                                    Colors.white,
                                    20.0,
                                    EdgeInsets.fromLTRB(15, 0, 0, 0),
                                    FontWeight.bold,
                                    FontStyle.normal,
                                  ),
                                ],
                              ),
                              IconButton(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                iconSize: 27,
                                icon: const Icon(Icons.arrow_forward),
                                color: MyApp.secondary,
                                onPressed: () => context.go('/CollegeInfo'),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
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
