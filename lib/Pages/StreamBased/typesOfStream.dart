import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../Widgets/customText.dart';
import '../../main.dart';

class typesOfStream extends StatefulWidget {
  const typesOfStream({super.key});

  @override
  State<typesOfStream> createState() => _typesOfStreamState();
}

class _typesOfStreamState extends State<typesOfStream> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.go('/home');
        return false;
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
        body: Center(
          child: Column(
            children: <Widget>[
              customText(
                'Choose your STREAM',
                Colors.white,
                30.0,
                EdgeInsets.fromLTRB(20, 40, 20, 20),
                FontWeight.w400,
                FontStyle.normal,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20.0, 10.0, 10.0, 20.0),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.10,
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          MyApp.primaryColor.withOpacity(0.3)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(
                            color: MyApp.secondary,
                          ), // Use CircleBorder to make the button circular
                        ),
                      ),
                    ),
                    onPressed: () {
                      String endpointURL =
                          'https://b5bb-122-172-87-1.ngrok-free.app/stream/pcm'; // Replace with your actual endpoint URL

                      // Define the route and pass the endpointURL as a parameter
                      // Navigate to the defined route
                      context.go('/streamDetails', extra: endpointURL);
                    },
                    child: const Text(
                      'PCM',
                      style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20.0, 10.0, 10.0, 20.0),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.10,
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          MyApp.primaryColor.withOpacity(0.3)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(
                            color: MyApp.secondary,
                          ), // Use CircleBorder to make the button circular
                        ),
                      ),
                    ),
                    onPressed: () {
                      String endpointURL =
                          'https://b5bb-122-172-87-1.ngrok-free.app/stream/pcb'; // Replace with your actual endpoint URL

                      // Define the route and pass the endpointURL as a parameter
                      // Navigate to the defined route
                      context.go('/streamDetails', extra: endpointURL);
                    },
                    child: const Text(
                      'PCB',
                      style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20.0, 10.0, 10.0, 20.0),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.10,
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          MyApp.primaryColor.withOpacity(0.3)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(
                            color: MyApp.secondary,
                          ), // Use CircleBorder to make the button circular
                        ),
                      ),
                    ),
                    onPressed: () {
                      String endpointURL =
                          'https://b5bb-122-172-87-1.ngrok-free.app/stream/pcmb'; // Replace with your actual endpoint URL

                      // Define the route and pass the endpointURL as a parameter
                      // Navigate to the defined route
                      context.go('/streamDetails', extra: endpointURL);
                    },
                    child: const Text(
                      'PCMB',
                      style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20.0, 10.0, 10.0, 20.0),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.10,
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          MyApp.primaryColor.withOpacity(0.3)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(
                            color: MyApp.secondary,
                          ), // Use CircleBorder to make the button circular
                        ),
                      ),
                    ),
                    onPressed: () {
                      String endpointURL =
                          'https://b5bb-122-172-87-1.ngrok-free.app/stream/commerce'; // Replace with your actual endpoint URL

                      // Define the route and pass the endpointURL as a parameter
                      // Navigate to the defined route
                      context.go('/streamDetails', extra: endpointURL);
                    },
                    child: const Text(
                      'Commerce',
                      style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20.0, 10.0, 10.0, 20.0),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.10,
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          MyApp.primaryColor.withOpacity(0.3)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(
                            color: MyApp.secondary,
                          ), // Use CircleBorder to make the button circular
                        ),
                      ),
                    ),
                    onPressed: () {
                      String endpointURL =
                          'https://b5bb-122-172-87-1.ngrok-free.app/stream/arts'; // Replace with your actual endpoint URL

                      // Define the route and pass the endpointURL as a parameter
                      // Navigate to the defined route
                      context.go('/streamDetails', extra: endpointURL);
                    },
                    child: const Text(
                      'Arts',
                      style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
