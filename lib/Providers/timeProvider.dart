import 'package:flutter/material.dart';

class TimeProvider extends ChangeNotifier {
  int score=0;
  late DateTime startTime;
  late DateTime endTime;
  int totalTime = 0;
  List<int?> userResponses = List.filled(20, null); 
  bool isTestStarted = false;

  void startTest() {
    print("Test Started");
    score=0;
    userResponses = List.filled(20, null); 
    isTestStarted = true;
    startTime = DateTime.now();
  }

  void endTest() {
    if (isTestStarted) {
      endTime = DateTime.now();
      // timer.cancel();
      isTestStarted = false;
       totalTime = endTime.difference(startTime).inSeconds;
      print('Total Time Taken: $totalTime seconds');
      notifyListeners();
    }
  }
}