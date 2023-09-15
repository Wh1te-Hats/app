import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../main.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
         fit: StackFit.expand,
        children: [
            // Background Image
            Image.asset('assets/images/homepage_bg.jpg',
              fit: BoxFit.cover, // Ensure the image covers the entire screen
            ),
          Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(60.0, 80.0, 60.0, 20.0),
                child: Center(
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/pragati_logo.png',
                      fit: BoxFit.cover,
                      height: 200.0,
                      width: 200.0,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(210.0, 20.0, 20.0, 0.0),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.20,
                  width: MediaQuery.of(context).size.width * 0.35,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(MyApp.secondary),
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        CircleBorder(), // Use CircleBorder to make the button circular
                      ),
                    ),
                    onPressed: () => context.go('/welcome'),
                    child: const Text(
                      'Student',
                      style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontSize: 22,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20.0, 0.0, 210.0, 0.0),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.20,
                  width: MediaQuery.of(context).size.width * 0.35,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(MyApp.secondary),
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        CircleBorder(), // Use CircleBorder to make the button circular
                      ),
                    ),
                    onPressed: () => context.go('/welcome'),
                    child: const Text(
                      'Parent',
                      style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontSize: 22,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(210.0, 0.0, 10.0, 20.0),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: MediaQuery.of(context).size.width * 0.35,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(MyApp.secondary),
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        CircleBorder(), // Use CircleBorder to make the button circular
                      ),
                    ),
                    onPressed: () => context.go('/welcome'),
                    child: const Text(
                      'Graduate',
                      style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontSize: 22,
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
