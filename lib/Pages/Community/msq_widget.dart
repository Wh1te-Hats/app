import 'package:flutter/material.dart';

class SenderMsqWidget extends StatelessWidget {
  final String message;
  final String sender;
  const SenderMsqWidget(
      {super.key, required this.message, required this.sender});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width - 60,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
           crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            CircleAvatar(
              radius: 12,
              backgroundColor: Colors.greenAccent,
              child: Text(
                sender.isNotEmpty ? sender[0].toUpperCase() : 'S',
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
            ),
            SizedBox(
              height: 55,
              child: Container(
                child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          30.0), // Set the border radius as needed
                    ),
                    color: Colors.teal,
                    child: Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            message,
                            style:
                                const TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ],
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RecieverMsqWidget extends StatelessWidget {
  final String message;
  final String sender;
  const RecieverMsqWidget(
      {super.key, required this.message, required this.sender});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width - 60,
        ),
        child: Row(
          children: [

            SizedBox(
              height: 55,
              child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        30.0), // Set the border radius as needed
                  ),
                  color: Color(0xff1c252d),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          message,
                          style: const TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ],
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
