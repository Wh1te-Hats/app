import 'package:flutter/material.dart';

class chatbotProvider extends ChangeNotifier{
  List<Map> messages = [
    {"side": 0, "msg": "Hi , I am Pragati \u{1F604}! How can I help you ?" , "template": 1, "flow":"EMPTY"}
  ];

   void addUserMessage(String text){
     messages.insert(
        messages.length,
        {"side": 1, "msg": 'YOU: ' + text, "template":-1, "flow":"EMPTY"},
      );

      notifyListeners(); 
  }

  void addChatbotMessage(String chatbotResponse, int template, String flow){
          messages.insert(messages.length, {
        "side": 0,
        "msg": chatbotResponse,
        "template": template,
        "flow": flow
      });
      
      notifyListeners(); // Add chatbot response to chat
  }

}