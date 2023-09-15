import 'package:flutter/material.dart';

import '../../main.dart';

class mcqTest extends StatefulWidget {
  const mcqTest({super.key});

  @override
  State<mcqTest> createState() => _mcqTestState();
}

class _mcqTestState extends State<mcqTest> {

  final List<Map<String, dynamic>> questions = [
    {
      "Question": "Odometer is to mileage as compass is to",
      "options": ["speed", "hiking", "needle", "direction"],
    },
    {
      "Question": "Marathon is to race as hibernation is to",
      "options": ["winter", "bear", "dream", "sleep"],
    },
    {
      "Question": "Window is to pane as book is to",
      "options": ["novel", "glass", "cover", "page"],
    },
  ];

  // A list to store user responses (initially empty)
  late List<int?> userResponses;

  @override
  void initState() {
    super.initState();
    userResponses = List.filled(questions.length, null);
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
      body: ListView.builder(
        
          itemCount: questions.length,
          itemBuilder: (BuildContext context, int index) {
            final question = questions[index];
            return Card(
              margin: EdgeInsets.all(16.0),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Question ${index + 1}: ${question['Question']}",
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Column(
                      children: question["options"]
                          .asMap()
                          .entries
                          .map<Widget>((entry) {
                        final int optionIndex = entry.key;
                        final String optionText = entry.value;
                        final int? response = userResponses.length > index
                            ? userResponses[index]: null;
                        return RadioListTile(
                          title: Text(optionText),
                          value: optionIndex,
                          // ignore: unnecessary_null_comparison
                          groupValue: response != null
                              ? optionText == question["options"][response]
                                  ? optionIndex
                                  : null
                              : null,
                          onChanged: (int? value) {
                            userResponses[index] =value!;
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
      );
  }
}
