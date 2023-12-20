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
    "Government Exams",
  ];

  List<String> logo = [
    'assets/images/stream.png',
    'assets/images/student-2.png',
    'assets/images/college.png',
  ];

  List<String> routes = ['schoolexams', 'engexams', 'govtexams'];

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
          child: Container(
            height: MediaQuery.of(context).size.height * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: [
                    SizedBox(width: 20),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 20, 0, 40),
                      child: CircleAvatar(
                        radius: 30,
                        child: Image.asset(
                          'assets/images/exam-1.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    customText(
                      'Exams for You',
                      Colors.white,
                      30.0,
                      EdgeInsets.fromLTRB(20, 20, 20, 40),
                      FontWeight.bold,
                      FontStyle.normal,
                    ),
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: typesOfExam.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: MediaQuery.of(context).size.height * 0.12,
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
                              color: MyApp.secondary,
                              spreadRadius: 1.0,
                            ),
                          ],
                        ),
                        child: GestureDetector(
                          onTap: () => context.go('/${routes[index]}'),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(width: 10),
                              CircleAvatar(
                                radius: 25,
                                child: Image.asset(
                                  logo[index],
                                  fit: BoxFit.cover,
                                ),
                              ),
                              customText(
                                typesOfExam[index],
                                Colors.white,
                                22.0,
                                EdgeInsets.fromLTRB(15, 0, 0, 0),
                                FontWeight.bold,
                                FontStyle.normal,
                              ),
                              IconButton(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                iconSize: 27,
                                icon: const Icon(Icons.arrow_forward),
                                color: MyApp.secondary,
                                onPressed: () =>
                                    context.go('/${routes[index]}'),
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
