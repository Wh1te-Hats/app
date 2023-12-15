import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../Models/aptitude.dart';
import '../../Widgets/customText.dart';
import '../../apiService.dart';
import '../../main.dart';

class mcqTest extends StatefulWidget {
  final String topic;

  const mcqTest({super.key, required this.topic});

  @override
  State<mcqTest> createState() => _mcqTestState();
}

var isLoaded = false;

class _mcqTestState extends State<mcqTest> {
  // final List<Map<String, dynamic>> questions = [   {
  //     "questionumber": "1.",
  //     "question_text_html": "<div class=\"bix-td-qtxt table-responsive w-100\"><u>gala</u></div>",
  //     "options_html": [
  //       "<div class=\"flex-wrap\">celebration</div>",
  //       "<div class=\"flex-wrap\">tuxedo</div>",
  //       "<div class=\"flex-wrap\">appetizer</div>",
  //       "<div class=\"flex-wrap\">orator</div>"
  //     ]
  //   },
  //   {
  //     "question_number": "2.",
  //     "question_text_html": "<div class=\"bix-td-qtxt table-responsive w-100\"><u>champion</u></div>",
  //     "options_html": [
  //       "<div class=\"flex-wrap\">running</div>",
  //       "<div class=\"flex-wrap\">swimming</div>",
  //       "<div class=\"flex-wrap\">winning</div>",
  //       "<div class=\"flex-wrap\">speaking</div>"
  //     ]
  //   },
  //   {
  //     "question_number": "3.",
  //     "question_text_html": "<div class=\"bix-td-qtxt table-responsive w-100\">Odometer is to mileage as compass is to</div>",
  //     "options_html": [
  //       "<div class=\"flex-wrap\">speed</div>",
  //       "<div class=\"flex-wrap\">hiking</div>",
  //       "<div class=\"flex-wrap\">needle</div>",
  //       "<div class=\"flex-wrap\">direction</div>"
  //     ]
  //   },
  //   {
  //     "question_number": "4.",
  //     "question_text_html": "<div class=\"bix-td-qtxt table-responsive w-100\">Here are some words translated from an artificial language.<br/>\n<i>gemolinea</i> means fair warning<br/>\n<i>gerimitu</i> means report card<br/>\n<i>gilageri</i> means weather report<br/>\nWhich word could mean \"fair weather\"?</div>",
  //     "options_html": [
  //       "<div class=\"flex-wrap\">gemogila</div>",
  //       "<div class=\"flex-wrap\">gerigeme</div>",
  //       "<div class=\"flex-wrap\">gemomitu</div>",
  //       "<div class=\"flex-wrap\">gerimita</div>"
  //     ]
  //   },
  //   {
  //     "question_number": "5.",
  //     "question_text_html": "<div class=\"bix-td-qtxt table-responsive w-100\">A fruit basket contains more apples than lemons.<br/>\nThere are more lemons in the basket than there are oranges.<br/>\nThe basket contains more apples than oranges.<br/>\nIf the first two statements are true, the third statement is</div>",
  //     "options_html": [
  //       "<div class=\"flex-wrap\">true</div>",
  //       "<div class=\"flex-wrap\">false</div>",
  //       "<div class=\"flex-wrap\">uncertain</div>"
  //     ]
  //   }];
  //   {
  //     "Question": "Odometer is to mileage as compass is to",
  //     "options": ["speed", "hiking", "needle", "direction"],
  //   },
  //   {
  //     "Question": "Marathon is to race as hibernation is to",
  //     "options": ["winter", "bear", "dream", "sleep"],
  //   },
  //   {
  //     "Question": "Window is to pane as book is to",
  //     "options": ["novel", "glass", "cover", "page"],
  //   },
  // ];

  late List<Question> questions = [];

  void getData(String id, String topic) async {
    questions =
        (await apiCollege().postGeneralAptitude(id, topic)) as List<Question>;
    if (questions != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    // Access the endpointURL parameter in the initState method's body
    final String topic = widget.topic;
    print(topic);
    getData('4444', topic);
    userResponses = List.filled(20, null);
  }

  Future<void> wait2Seconds() async {
    // Simulate an asynchronous operation,
    await Future.delayed(const Duration(seconds: 1));
  }

  // A list to store user responses (initially empty)
  late List<int?> userResponses;

  @override
  Widget build(BuildContext context) {
    // late WebViewController _webViewController;

    // _loadHtml(String data) async {
    //   String fileHtmlContent = data;
    //   _webViewController.loadUrl(Uri.dataFromString(fileHtmlContent,
    //           mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
    //       .toString());
    // }

    return WillPopScope(
      onWillPop: () async {
        context.go('/generalAptitude');
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
              return Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.8,
                    child: ListView.builder(
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
                                    "Question ${index + 1} : ${questions[index].questionTextHtml}",
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
                                      .optionsHtml
                                      .asMap()
                                      .entries
                                      .map<Widget>((entry) {
                                    final int optionIndex = entry.key;
                                    final String optionText = entry.value;
                                    final int? response =
                                        userResponses.length > index
                                            ? userResponses[index]
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
                                      groupValue: response != null
                                          ? optionText ==
                                                  questions[index]
                                                      .optionsHtml[response]
                                              ? optionIndex
                                              : null
                                          : null,
                                      onChanged: (int? value) {
                                        userResponses[index] = value!;
                                        setState(() {});
                                        print(userResponses);
                                      },
                                    );
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
                            context.go('/currentAnalysis', extra: questions);
                          },
                          child: const Text(
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
