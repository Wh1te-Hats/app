import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:pragati_v1/Models/aptitude.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../Widgets/customText.dart';
import '../../main.dart';

class CurrentAnalysis extends StatefulWidget {
  final List<Question> questions;
  CurrentAnalysis({super.key, required this.questions});

  @override
  State<CurrentAnalysis> createState() => _CurrentAnalysisState();
}

class _CurrentAnalysisState extends State<CurrentAnalysis> {
  String filePath = 'files/test.html';
  late WebViewController _webViewController;

  late List<Question>? questions = [];

  _loadHtml() async {
    String fileHtmlContent = await rootBundle.loadString(filePath);
    _webViewController.loadUrl(Uri.dataFromString(fileHtmlContent,
            mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString());
  }

  void initState() {
    super.initState();
    // Access the endpointURL parameter in the initState method's body
    questions = widget.questions;
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
      // body:SizedBox(
      //   child: WebView(
      //     initialUrl: "",
      //     javascriptMode: JavascriptMode.unrestricted,
      //     onWebViewCreated: (WebViewController webViewController){
      //       _webViewController = webViewController;
      //       _loadHtml();
      //     },
      //   ),
      // ),
      body: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
                width: MediaQuery.of(context).size.width * 0.75,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        MyApp.primaryColor.withOpacity(0.3)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(
                          color: MyApp.secondary,
                        ), // Use CircleBorder to make the button circular
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Your Score : 17/20',
                    style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontSize: 24,
                    ),
                  ),
                ),
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
                              "Question ${questions![index].questionNumber}",
                              Colors.white,
                              18.0,
                              EdgeInsets.fromLTRB(00, 00, 00, 00),
                              FontWeight.bold,
                              FontStyle.normal),
                          customText(
                              "${questions![index].questionTextHtml}",
                              Colors.white,
                              18.0,
                              EdgeInsets.fromLTRB(00, 00, 00, 00),
                              FontWeight.normal,
                              FontStyle.normal),
                          SizedBox(height: 15.0),
                          customText(
                              "Your Answer : a",
                              Colors.white,
                              18.0,
                              EdgeInsets.fromLTRB(00, 00, 00, 00),
                              FontWeight.bold,
                              FontStyle.normal),
                          customText(
                              "Correct Answer : ${questions![index].correctAnswer}",
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
}
