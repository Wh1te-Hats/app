import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:pragati_v1/Models/aptitude.dart';
import 'package:pragati_v1/Providers/timeProvider.dart';
import 'package:pragati_v1/apiService.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Widgets/customText.dart';
import '../../main.dart';

class Analysis extends StatefulWidget {
  final List<Question> questions;
  Analysis({super.key, required this.questions});

  @override
  State<Analysis> createState() => _AnalysisState();
}

class _AnalysisState extends State<Analysis> {
  late List<Question>? questions = [];

  void initState() {
    super.initState();
    questions = widget.questions;
  }

  Future<void> wait2Seconds() async {
    // Simulate an asynchronous operation,
    await Future.delayed(const Duration(seconds: 1));
  }

  late TimeProvider timeProvider;

  String numberToChar(int number) {
    if (number >= 0 && number <= 15) {
      // Convert the number to the corresponding letter ('a' to 'z')
      return String.fromCharCode('a'.codeUnitAt(0) + number - 1);
    } else {
      // Handle invalid input
      print('Invalid input: $number');
      return ''; // or throw an exception, return a default value, etc.
    }
  }

  int charToNumber(String char) {
    if (char.length == 1 && char.toLowerCase().contains(RegExp(r'[a-z]'))) {
      // Convert the lowercase character to its ASCII code and subtract the ASCII code of 'a' (97)
      return char.codeUnitAt(0) - 'a'.codeUnitAt(0) + 1;
    } else {
      // Handle invalid input
      print('Invalid input: $char');
      return 0; // or throw an exception, return a default value, etc.
    }
  }

  @override
  Widget build(BuildContext context) {
    timeProvider = Provider.of<TimeProvider>(context);
    int totalTime = timeProvider.totalTime;
    DateTime startTime = timeProvider.startTime;
    int score = timeProvider.score;
    int total = questions!.length;

    return WillPopScope(
      onWillPop: () async {
        context.go('/aptitudeHome');
        return false;
      },
      child: Scaffold(
        backgroundColor: MyApp.primaryColor,
        appBar: AppBar(
          title: const Text(MyApp.title),
        
        ),
        body: FutureBuilder<void>(
          future: wait2Seconds(),
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
              return SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: MyApp.secondary, // Border color
                            width: 0.9, // Border width
                          ),
                        ),
                        height: MediaQuery.of(context).size.height * 0.22,
                        width: MediaQuery.of(context).size.width * 0.95,
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                customText(
                                    "Test Analysis :",
                                    MyApp.secondary,
                                    24.0,
                                    EdgeInsets.fromLTRB(20, 10, 5, 00),
                                    FontWeight.normal,
                                    FontStyle.normal),
                                customText(
                                    "Score : $score / $total",
                                    Colors.white,
                                    22.0,
                                    EdgeInsets.fromLTRB(20, 10, 5, 00),
                                    FontWeight.normal,
                                    FontStyle.normal),
                                customText(
                                    "Time: $totalTime seconds",
                                    Colors.white,
                                    22.0,
                                    EdgeInsets.fromLTRB(20, 10, 5, 00),
                                    FontWeight.normal,
                                    FontStyle.normal),
                                customText(
                                    "Date : ${startTime.toLocal().toString().substring(0, 10)}",
                                    Colors.white,
                                    22.0,
                                    EdgeInsets.fromLTRB(20, 10, 5, 00),
                                    FontWeight.normal,
                                    FontStyle.normal),
                              ],
                            ),
                            Container(
                              height: 28,
                              margin: EdgeInsets.fromLTRB(40, 10, 10, 5),
                              child: SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.04,
                                width: MediaQuery.of(context).size.width * 0.3,
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            MyApp.secondary),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    )),
                                  ),
                                  onPressed: () async {
                    
                                    context.go(
                                      '/home',
                                    );
                                  },
                                  child: Text(
                                    'Finish',
                                    style: TextStyle(
                                      fontStyle: FontStyle.normal,
                                      fontSize: 22,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(10, 00, 10, 00),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: MyApp.secondary, // Border color
                            width: 0.9, // Border width
                          ),
                        ),
                        height: MediaQuery.of(context).size.height * 0.8,
                        width: MediaQuery.of(context).size.width * 0.95,
                        child: ListView.builder(
                          itemCount: questions!.length,
                          itemBuilder: (context, index) {
                            return Card(
                              margin: EdgeInsets.all(16.0),
                              child: Container(
                                color: MyApp.primaryColor.withOpacity(0.95),
                                padding: EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    customText(
                                        "Question ${index + 1}",
                                        Colors.white,
                                        18.0,
                                        EdgeInsets.fromLTRB(00, 00, 00, 02),
                                        FontWeight.bold,
                                        FontStyle.normal),
                                    customText(
                                        "${questions![index].questionText}",
                                        Colors.white,
                                        18.0,
                                        EdgeInsets.fromLTRB(00, 00, 00, 00),
                                        FontWeight.normal,
                                        FontStyle.normal),
                                    SizedBox(height: 15.0),
                                    customText(
                                        "Your Answer : ${timeProvider.userResponses[index]} ",
                                        Colors.white,
                                        18.0,
                                        EdgeInsets.fromLTRB(00, 00, 00, 00),
                                        FontWeight.bold,
                                        FontStyle.normal),
                                    customText(
                                        "Correct Answer : ${charToNumber(questions![index].correctAnswer)}",
                                        Colors.white,
                                        18.0,
                                        EdgeInsets.fromLTRB(00, 00, 00, 00),
                                        FontWeight.bold,
                                        FontStyle.normal),
                                    SizedBox(height: 15.0),
                                    customText(
                                        "Explaination : ",
                                        MyApp.secondary,
                                        18.0,
                                        EdgeInsets.fromLTRB(00, 00, 00, 00),
                                        FontWeight.bold,
                                        FontStyle.normal),
                                    customText(
                                        "${questions![index].explaination}",
                                        Colors.white,
                                        18.0,
                                        EdgeInsets.fromLTRB(00, 00, 00, 00),
                                        FontWeight.normal,
                                        FontStyle.normal),
                                    //
                                    SizedBox(height: 8.0),
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
              );
            }
          },
        ),
      ),
    );
  }
}
