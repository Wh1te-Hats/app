import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pragati_v1/Models/aptitude.dart';
import 'package:pragati_v1/Providers/timeProvider.dart';
import 'package:pragati_v1/Widgets/customText.dart';
import 'package:pragati_v1/apiService.dart';
import 'package:pragati_v1/main.dart';
import 'package:provider/provider.dart';

class SkillTest extends StatefulWidget {

   final String topic;

  const SkillTest({super.key, required this.topic});

    @override
  State<SkillTest> createState() => _SkillTestState();

}

class _SkillTestState extends State<SkillTest> {
  late TimeProvider timeProvider;
  late ScrollController scrollController;
  late List<Question> questions = [];

  void getData(String id, String topic) async {
    
  }

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
  }

  Future<void> wait() async {
    // Simulate an asynchronous operation,
    final String topic = widget.topic;
  //  questions =(await apiCollege().postSkillAssessment(topic)) as List<Question>;
  questions = List.generate(10, (index) {
    return Question(
      questionNumber: "Q${index + 1}",
      questionText: "Sample Question ${index + 1}?",
      options: [
        "Option A",
        "Option B",
        "Option C",
        "Option D",
      ],
      correctAnswer: "Option A",
      explaination: "Explanation for Sample Question ${index + 1}.",
    );
  });
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
  Widget build(BuildContext context) {

    timeProvider = Provider.of<TimeProvider>(context);

  return WillPopScope(
      onWillPop: () async {
        context.go('/generalAptitude');
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
                      FontStyle.normal),]);
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
                                // SizedBox(
                                //   height: 20,
                                //   child: WebView(
                                //     initialUrl: "",
                                //     javascriptMode: JavascriptMode.unrestricted,
                                //     onWebViewCreated:
                                //         (WebViewController webViewController) {
                                //       _webViewController = webViewController;
                                //       _loadHtml(questions[index].questionTextHtml);
                                //     },
                                //   ),
                                // ),
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
                              '/skillAnalysis',
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
