import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../Widgets/pieChart.dart';
import '../../main.dart';

class CurrentAnalysis extends StatefulWidget {
  const CurrentAnalysis({super.key});

  @override
  State<CurrentAnalysis> createState() => _CurrentAnalysisState();
}

class _CurrentAnalysisState extends State<CurrentAnalysis> {
  String filePath = 'files/test.html';
  late WebViewController _webViewController;

  _loadHtml() async {
    String fileHtmlContent = await rootBundle.loadString(filePath);
    _webViewController.loadUrl(Uri.dataFromString(fileHtmlContent,
            mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString());
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
      body: Column(
        children: [
          Container(
            height: 300, 
            child: PieChartSample(),
          ),
        ],
      ),
    );
  }
}
