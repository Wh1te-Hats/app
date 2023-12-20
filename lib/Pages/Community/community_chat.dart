import 'package:flutter/material.dart';
import 'package:pragati_v1/Models/message.dart';
import 'package:pragati_v1/Pages/Community/msq_widget.dart';
import 'package:pragati_v1/main.dart';

class CommunityChat extends StatefulWidget {
  final String title;
  const CommunityChat({super.key, required this.title});

  @override
  State<CommunityChat> createState() => _CommunityChatState();
}

class _CommunityChatState extends State<CommunityChat> {
  List<MsgModel> ListMsg = [];

  void sendMsg(String msg) {
    var message = MsgModel(message: msg, sender: "Samrath");
    setState(() {
      ListMsg.add(message);
    });
  }

  @override
  Widget build(BuildContext context) {
    final String title = widget.title;
    TextEditingController chatController = TextEditingController();
    return Scaffold(
      backgroundColor: MyApp.primaryColor,
      appBar: AppBar(
        title: Text(title),
        backgroundColor: MyApp.secondary,
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: ListMsg.length,
                  itemBuilder: (context, index) {
                    if (ListMsg[index].sender == "Samrath") {
                      return SenderMsqWidget(
                          message: ListMsg[index].message,
                          sender: ListMsg[index].sender);
                    } else {
                      return RecieverMsqWidget(
                          message: ListMsg[index].message,
                          sender: ListMsg[index].sender);
                    }
                  })),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Row(
              children: [
                Expanded(
                    child: Container(
                  padding: const EdgeInsets.all(9.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(
                      width: 0.5,
                      color: Colors.white,
                    ),
                  ),
                  child: TextFormField(
                    controller: chatController,
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                    decoration: InputDecoration(
                        hintText: "Type...",
                        border: InputBorder.none,
                        suffixIcon: IconButton(
                          icon: const Icon(
                            Icons.send,
                            color: MyApp.secondary,
                          ),
                          onPressed: () {
                            sendMsg(chatController.text);
                            chatController.clear();
                          },
                        )),
                  ),
                )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
