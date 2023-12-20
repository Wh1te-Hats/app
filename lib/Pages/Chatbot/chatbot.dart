import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pragati_v1/Providers/chartbotProvider.dart';
import 'package:pragati_v1/Widgets/customText.dart';
import 'package:pragati_v1/apiService.dart';
import 'package:pragati_v1/main.dart';
import 'package:provider/provider.dart';

class Chatbot extends StatefulWidget {
  const Chatbot({super.key});

  @override
  State<Chatbot> createState() => _ChatbotState();
}

class _ChatbotState extends State<Chatbot> {
  String formatJobData(String dataStr) {
    // try {
    // List<dynamic> dataList = jsonDecode(dataStr);
    // List<String> dataEntries = RegExp(r'{[^}]+}').allMatches(dataList[0]).map((match) => match.group(0)!).toList();
    String transformedData = "";
    // for (String dataEntry in dataEntries) {
    String modifiedEntry = dataStr
        .replaceAll('job_name', 'Job')
        .replaceAll('company_name', 'Company')
        .replaceAll('link', 'Link')
        .replaceAll('location', 'Location');
    String formattedEntry = modifiedEntry
        .replaceAll(':', ': ')
        .replaceAll(',', ' \n')
        .replaceAll('{', '')
        .replaceAll('}', '');
    // transformedData.add(formattedEntry);
    String result = formattedEntry + ' \n\n\n';
    return result;
  }

  late FocusNode _focusNode;

  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _scrollController.dispose(); // Dispose of the ScrollController
    super.dispose();
    _focusNode.dispose();
  }

  late ScrollController _scrollController;

  @override
  Widget build(BuildContext context) {
    return Consumer<chatbotProvider>(
      builder: (context, value, child) => WillPopScope(
        onWillPop: () async {
          context.go('/home');
          return false;
        },
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            backgroundColor: MyApp.primaryColor,
            appBar: AppBar(
              title: const Text(MyApp.title),
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    // reverse: true,
                    controller: _scrollController,
                    itemCount: value.messages.length,
                    itemBuilder: (context, index) {
                      if (value.messages[index]["side"] == 1) {
                        return Container(
                          margin: EdgeInsets.only(
                              top: 05.0, bottom: 5.0, left: 115.0, right: 15.0),
                          padding: EdgeInsets.only(
                              top: 0.0, bottom: 0.0, left: 5.0, right: 5.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: MyApp.primaryColor, // Border color
                              // Border width
                            ),
                            color: MyApp.secondary.withOpacity(0.95),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: customText(
                            value.messages[index]["msg"],
                            Colors.white,
                            18.0,
                            EdgeInsets.fromLTRB(10, 20, 05, 20),
                            FontWeight.w400,
                            FontStyle.normal,
                          ),
                        );
                      } else {
                        if (value.messages[index]["template"] == 1 ||
                            value.messages[index]["template"] == 2) {
                          return Container(
                            // height: MediaQuery.of(context).size.height * 0.25,
                            margin: EdgeInsets.only(
                                top: 05.0,
                                bottom: 5.0,
                                left: 15.0,
                                right: 115.0),
                            padding: EdgeInsets.only(
                                top: 0.0, bottom: 0.0, left: 5.0, right: 5.0),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: MyApp.secondary, // Border color
                                // Border width
                              ),
                              color: MyApp.primaryColor,
                              borderRadius: BorderRadius.circular(10.0),
                            ),

                            child: customText(
                              value.messages[index]["msg"],
                              Colors.white,
                              18.0,
                              EdgeInsets.fromLTRB(10, 20, 05, 20),
                              FontWeight.w400,
                              FontStyle.normal,
                            ),
                          );
                        } else {
                          if (value.messages[index]["flow"] == "career") {
                            return Container(
                              // height: MediaQuery.of(context).size.height * 0.25,
                              margin: EdgeInsets.only(
                                  top: 05.0,
                                  bottom: 5.0,
                                  left: 15.0,
                                  right: 115.0),
                              padding: EdgeInsets.only(
                                  top: 0.0, bottom: 0.0, left: 5.0, right: 5.0),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: MyApp.secondary, // Border color
                                  // Border width
                                ),
                                color: MyApp.primaryColor,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Column(
                                children: [
                                  customText(
                                    value.messages[index]["msg"],
                                    Colors.white,
                                    18.0,
                                    EdgeInsets.fromLTRB(10, 20, 05, 20),
                                    FontWeight.w400,
                                    FontStyle.normal,
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(5, 5, 10, 20),
                                    // height:
                                    // MediaQuery.of(context).size.height * 0.08,
                                    width: MediaQuery.of(context).size.width *
                                        0.55,
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                MyApp.secondary),
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        )),
                                      ),
                                      onPressed: () async {
                                        context.go('/skills');
                                      },
                                      child: const Text(
                                        'Career Guidance',
                                        style: TextStyle(
                                          fontStyle: FontStyle.normal,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          } else if (value.messages[index]["flow"] ==
                              "subject") {
                            return Container(
                              // height: MediaQuery.of(context).size.height * 0.25,
                              margin: EdgeInsets.only(
                                  top: 05.0,
                                  bottom: 5.0,
                                  left: 15.0,
                                  right: 115.0),
                              padding: EdgeInsets.only(
                                  top: 0.0, bottom: 0.0, left: 5.0, right: 5.0),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: MyApp.secondary, // Border color
                                  // Border width
                                ),
                                color: MyApp.primaryColor,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Column(
                                children: [
                                  customText(
                                    value.messages[index]["msg"],
                                    Colors.white,
                                    18.0,
                                    EdgeInsets.fromLTRB(10, 20, 05, 20),
                                    FontWeight.w400,
                                    FontStyle.normal,
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(10, 5, 10, 20),
                                    // height:
                                    // MediaQuery.of(context).size.height * 0.08,
                                    width: MediaQuery.of(context).size.width *
                                        0.55,
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                MyApp.secondary),
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        )),
                                      ),
                                      onPressed: () async {
                                        context.go('/typesOfStream');
                                      },
                                      child: Text(
                                        'Streams Guidance',
                                        style: TextStyle(
                                          fontStyle: FontStyle.normal,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          } else if (value.messages[index]["flow"] ==
                              "college") {
                            return Container(
                              // height: MediaQuery.of(context).size.height * 0.25,
                              margin: EdgeInsets.only(
                                  top: 05.0,
                                  bottom: 5.0,
                                  left: 15.0,
                                  right: 115.0),
                              padding: EdgeInsets.only(
                                  top: 0.0, bottom: 0.0, left: 5.0, right: 5.0),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: MyApp.secondary, // Border color
                                  // Border width
                                ),
                                color: MyApp.primaryColor,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Column(
                                children: [
                                  customText(
                                    value.messages[index]["msg"],
                                    Colors.white,
                                    18.0,
                                    EdgeInsets.fromLTRB(10, 20, 05, 20),
                                    FontWeight.w400,
                                    FontStyle.normal,
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(10, 5, 10, 20),
                                    // height:
                                    // MediaQuery.of(context).size.height * 0.08,
                                    width: MediaQuery.of(context).size.width *
                                        0.55,
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                MyApp.secondary),
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        )),
                                      ),
                                      onPressed: () async {
                                        context.go('/typesOfColleges');
                                      },
                                      child: const Text(
                                        'See Colleges',
                                        style: TextStyle(
                                          fontStyle: FontStyle.normal,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          } else {
                            return Container(
                              // height: MediaQuery.of(context).size.height * 0.25,
                              margin: EdgeInsets.only(
                                  top: 05.0,
                                  bottom: 5.0,
                                  left: 15.0,
                                  right: 115.0),
                              padding: EdgeInsets.only(
                                  top: 0.0, bottom: 0.0, left: 5.0, right: 5.0),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: MyApp.secondary, // Border color
                                  // Border width
                                ),
                                color: MyApp.primaryColor,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: customText(
                                value.messages[index]["msg"],
                                Colors.white,
                                18.0,
                                EdgeInsets.fromLTRB(10, 20, 05, 20),
                                FontWeight.w400,
                                FontStyle.normal,
                              ),
                            );
                          }
                        }
                      }
                    },
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: MyApp.primaryColor,
                  ),
                  child: _buildTextComposer(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Implement chatbot interaction logic here
  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  final TextEditingController _textController = TextEditingController();

  late dynamic chatbotResponse;
  int templateNo = 1;
  String flow = "EMPTY";
  int num = -1;

  Widget _buildTextComposer() {
    return Consumer<chatbotProvider>(
      builder: (context, value, child) => IconTheme(
        data: IconThemeData(color: Theme.of(context).colorScheme.secondary),
        child: Container(
          margin:
              EdgeInsets.only(top: 05.0, bottom: 5.0, left: 10.0, right: 5.0),
          padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          decoration: BoxDecoration(
            border: Border.all(
              color: MyApp.secondary, // Border color
              // Border width
            ),
            color: MyApp.primaryColor,
            borderRadius: BorderRadius.circular(40.0),
          ),
          child: Row(
            children: [
              Flexible(
                child: TextField(
                  focusNode: _focusNode, // Add this line
                  cursorColor: Colors.white,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration.collapsed(
                    hintText: 'Message',
                    filled: true,
                    fillColor: MyApp.primaryColor,
                  ),
                  controller: _textController,
                ),
              ),
              IconButton(
                color: Colors.white,
                icon: Icon(Icons.send),
                onPressed: () async {
                  String query = _textController.text;
                  _textController.clear();
                  setState(() {
                    // Add user message to chat
                    _scrollToBottom();
                    value.addUserMessage(query);
                    _scrollToBottom();
                  });

                  // try {
                  chatbotResponse = (await apiCollege()
                      .fetchChatbotResponse(query, flow, num));

                  String finalResponse = "";
                  // print(chatbotResponse['message']);

                  // if (num == 3 && flow == 'job') {
                  flow = chatbotResponse['flow'];
                  num = chatbotResponse['num'];
                  templateNo = chatbotResponse['template'];

                  if (templateNo == 1 || templateNo == 3 || templateNo == 4) {
                    List<dynamic> ans = chatbotResponse['message'];
                    String answer = ans.join('\n');
                    print(ans);
                    finalResponse = answer;

                    finalResponse = "Pragati: \n" + finalResponse;
                  } else if (templateNo == 2) {
                    finalResponse =
                        finalResponse + chatbotResponse['message'].join('\n');
                    finalResponse = formatJobData(finalResponse);
                    finalResponse = "Pragati: \n" + finalResponse;
                  } else {
                    List<dynamic> ans = chatbotResponse['message'];
                    String answer = ans.join('\n');
                    print(ans);
                    finalResponse = answer;
                  }
                  // }

                  setState(() {
                    _scrollToBottom();
                    value.addChatbotMessage(finalResponse, templateNo, flow);
                    _scrollToBottom();
                  });
                  // } catch (e) {
                  //   // Handle API request errors here
                  //   print('Error: $e');
                  //   setState(() {
                  //     _messages.insert(_messages.length ,
                  //         'Error: Failed to get a response'); // Display error message
                  //   });
                  // }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}