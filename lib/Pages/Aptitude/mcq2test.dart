import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pragati_v1/Providers/timeProvider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Models/aptitude.dart';
import '../../Widgets/customText.dart';
import '../../apiService.dart';
import '../../main.dart';

class mcqTest2 extends StatefulWidget {
  final List<dynamic> postList;

  const mcqTest2({super.key, required this.postList});

  @override
  State<mcqTest2> createState() => _mcqTest2State();
}

var isLoaded = false;

class _mcqTest2State extends State<mcqTest2> {
  late TimeProvider timeProvider;
  late ScrollController scrollController;
  late List<Question> questions = [];
  late String storedGrade = '9';
  late List<dynamic> postList = widget.postList;
  late String subject;
  late String chapter;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();

  }

  void getData() async {
    
  }

  Future<void> execute() async {
    // Simulate an asynchronous operation,
    SharedPreferences prefs = await SharedPreferences.getInstance();
    storedGrade = prefs.getString('grade') ?? "9";
    subject = postList[0].subject;
    chapter = postList[0].chapter[postList[1]];
    questions = (await apiCollege()
        .postCourseAptitude(storedGrade, subject, chapter)) as List<Question>;
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

    return WillPopScope(
      onWillPop: () async {
        context.go('/chapters', extra: postList[0]);
        return false;
      },
      child: Scaffold(
        backgroundColor: MyApp.primaryColor,
        appBar: AppBar(
          title: const Text(MyApp.title),
        ),
        body: FutureBuilder<void>(
          future: execute(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // Show a loading indicator while waiting for data
              return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 5,
                        color: Colors.white,
                      ),
                    ),
                    customText(
                        'Loading Test...',
                        Colors.white,
                        24.0,
                        EdgeInsets.fromLTRB(25, 20, 28, 10),
                        FontWeight.w400,
                        FontStyle.normal),
                  ]);
            } else if (snapshot.hasError) {
              // Handle errors
              return Text('Error: ${snapshot.error}');
            } else {
              // Display data once it's loaded
              return Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.8,
                    child: ListView.builder(
                      key: PageStorageKey<String>('yourListViewKey'),
                      controller: scrollController,
                      itemCount: questions.length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: EdgeInsets.all(16.0),
                          child: Container(
                            color: MyApp.primaryColor.withOpacity(0.88),
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                customText(
                                    "Question ${index + 1} : ${questions[index].questionText}",
                                    Colors.white,
                                    18.0,
                                    EdgeInsets.fromLTRB(00, 00, 00, 00),
                                    FontWeight.bold,
                                    FontStyle.normal),
            
                                SizedBox(height: 8.0),
                                Column(
                                  children: questions[index]
                                      .options
                                      .asMap()
                                      .entries
                                      .map<Widget>((entry) {
                                    int flag = 0;
                                    final int optionIndex = entry.key;
                                    final String optionText = entry.value;
                                    final int? response =
                                        timeProvider.userResponses.length >
                                                index
                                            ? timeProvider.userResponses[index]
                                            : null;
                                    return RadioListTile(
                                        activeColor: MyApp.secondary,
                                        title: customText(
                                            optionText,
                                            Colors.white,
                                            16.0,
                                            EdgeInsets.fromLTRB(00, 00, 00, 00),
                                            FontWeight.normal,
                                            FontStyle.normal),
                                        value: optionIndex,
                                        // ignore: unnecessary_null_comparison
                                        groupValue: response,
                                        // ? optionText ==
                                        //         questions[index]
                                        //             .optionsHtml[response]
                                        //     ? optionIndex
                                        //     : null
                                        // : null,
                                        onChanged: (int? value) {
                                          setState(() {
                                            timeProvider.userResponses[index] =
                                                value!;
                                          });

                                          if (timeProvider
                                                      .userResponses[index] ==
                                                  charToNumber(questions[index]
                                                      .correctAnswer) &&
                                              flag == 0) {
                                            flag = 1;
                                            timeProvider.score++;
                                          }
                                        });
                                  }).toList(),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Center(
                    child: Container(
                      height: 48,
                      margin: EdgeInsets.fromLTRB(10, 10, 10, 5),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                        width: MediaQuery.of(context).size.width * 0.85,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                MyApp.secondary),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                          ),
                          onPressed: () {
                            // String name = _textFieldController1.text;
                            // String password = _textFieldController2.text;
                            timeProvider.endTest();
                            context.go(
                              '/currentAnalysis',
                              extra: questions,
                            );
                          },
                          child: Text(
                            'Submit',
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
              );
            }
          },
        ),
      ),
    );
  }
}
