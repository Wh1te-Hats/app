import 'package:flutter/material.dart';

class chatbotProvider extends ChangeNotifier{
  List<Map> messages = [
    {"side": 0, "msg": "Hi , I am Pragati \u{1F604}! How can I help you ?"}
  ];

   void addUserMessage(String text){
     messages.insert(
        messages.length,
        {"side": 1, "msg": 'YOU: ' + text},
      );

      notifyListeners(); 
  }

  void addChatbotMessage(String chatbotResponse){
          messages.insert(messages.length, {
        "side": 0,
        "msg": chatbotResponse
      });
      
      notifyListeners(); // Add chatbot response to chat
  }

}