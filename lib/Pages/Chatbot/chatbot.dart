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
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    // reverse: true,
                    itemCount: value.messages.length,
                    itemBuilder: (context, index) {
                      if (value.messages[index]["side"] == 0)
                        return Container(
                          margin: EdgeInsets.only(
                              top: 05.0, bottom: 5.0, left: 15.0, right: 115.0),
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
                      else {
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
                            color: MyApp.secondary.withOpacity(0.85),
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
                    },
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: MyApp.primaryColor,
                  ),
                  child: _buildTextComposer(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Implement chatbot interaction logic here

  final TextEditingController _textController = TextEditingController();

  late String chatbotResponse;

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
                    value.addUserMessage(query);
                  });

                  // try {
                  chatbotResponse =
                      (await apiCollege().fetchChatbotResponse(query));
                  setState(() {
                    // print(chatbotResponse);
                    value.addChatbotMessage(chatbotResponse);
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
