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
      backgroundColor: MyApp.primaryColor,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          // Image.asset(
          //   'assets/images/homebg.png',
          //   color: Color.fromARGB(255, 255, 255, 255).withOpacity(0.75),
          //   colorBlendMode: BlendMode.modulate,

          //   fit: BoxFit.fitWidth, // Ensure the image covers the entire screen
          // ),
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
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(120.0, 10.0, 0.0, 0.0),
                    child: Image.asset(
                      'assets/images/studented.png',
                      fit: BoxFit.cover,
                      height: 70.0,
                      width: 70.0,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.20,
                      width: MediaQuery.of(context).size.width * 0.35,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape:
                              CircleBorder(), // Use CircleBorder to make the button circular

                          backgroundColor: MyApp.primaryColor.withOpacity(0.8),
                          elevation: 10,
                          side: const BorderSide(
                            color: MyApp.secondary,
                          ),
                        ),
                        onPressed: () => context.go('/signin'),
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
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.20,
                      width: MediaQuery.of(context).size.width * 0.35,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape:
                              CircleBorder(), // Use CircleBorder to make the button circular

                          backgroundColor: MyApp.primaryColor.withOpacity(0.8),
                          elevation: 10,
                          side: const BorderSide(
                            color: MyApp.secondary,
                          ),
                        ),
                        onPressed: () => context.go('/signin'),
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
                    margin: EdgeInsets.fromLTRB(20.0, 10.0, 0.0, 0.0),
                    child: Image.asset(
                      'assets/images/parented.png',
                      fit: BoxFit.cover,
                      height: 70.0,
                      width: 70.0,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(120.0, 10.0, 0.0, 0.0),
                    child: Image.asset(
                      'assets/images/graduated.png',
                      fit: BoxFit.cover,
                      height: 70.0,
                      width: 70.0,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.20,
                      width: MediaQuery.of(context).size.width * 0.35,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape:
                              CircleBorder(), // Use CircleBorder to make the button circular

                          backgroundColor: MyApp.primaryColor.withOpacity(0.8),
                          elevation: 10,
                          side: const BorderSide(
                            color: MyApp.secondary,
                          ),
                        ),
                        onPressed: () => context.go('/sign'),
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
        ],
      ),
    );
  }
}
