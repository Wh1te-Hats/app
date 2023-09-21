import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../main.dart';

class getStarted extends StatefulWidget {
  const getStarted({super.key});

  @override
  State<getStarted> createState() => _getStartedState();
}

class _getStartedState extends State<getStarted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Image.asset(
            'assets/images/getStarted.png',
            fit: BoxFit.cover, // Ensure the image covers the entire screen
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Center(
              child: Container(
                margin: EdgeInsets.all(32.0),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(MyApp.secondary),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                    ),
                    onPressed: () {
                      // String name = _textFieldController1.text;
                      // String password = _textFieldController2.text;
                      context.go('/welcome');
                    },
                    child: const Text(
                      'Get  Started',
                      style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontSize: 22,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            ],
          ),
        ],
      ),
    );
  }
}
