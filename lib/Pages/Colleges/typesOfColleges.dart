import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pragati_v1/Widgets/customText.dart';
import '../../main.dart';

class typesOfCollege extends StatefulWidget {
  const typesOfCollege({super.key});

  @override
  State<typesOfCollege> createState() => _typesOfCollegeState();
}

class _typesOfCollegeState extends State<typesOfCollege> {
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
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage(
                        'assets/images/jobBg.jpg'), // Replace with your image asset
                    fit: BoxFit.cover,
                  )),
                ),
                customText(
                  'Colleges',
                  Colors.white,
                  30.0,
                  EdgeInsets.fromLTRB(20, 20, 20, 0),
                  FontWeight.bold,
                  FontStyle.normal,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20.0, 40.0, 10.0, 0.0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: MediaQuery.of(context).size.width * 0.65,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            MyApp.primaryColor.withOpacity(0.3)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                              color: MyApp.secondary,
                            ), // Use CircleBorder to make the button circular
                          ),
                        ),
                      ),
                      onPressed: () {
                        // Define the endpoint URL for this button
                        String endpointURL =
                            'https://3905-106-76-230-13.ngrok-free.app/college/engineering'; // Replace with your actual endpoint URL

                        // Define the route and pass the endpointURL as a parameter
                        // Navigate to the defined route
                        context.go('/collegeList', extra: endpointURL);
                        // Navigate to the defined route
                      },
                      child: const Text(
                        'Engineering',
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20.0, 20.0, 10.0, 0.0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: MediaQuery.of(context).size.width * 0.65,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            MyApp.primaryColor.withOpacity(0.3)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                              color: MyApp.secondary,
                            ), // Use CircleBorder to make the button circular
                          ),
                        ),
                      ),
                      onPressed: () {
                        // Define the endpoint URL for this button
                        String endpointURL =
                            'https://3905-106-76-230-13.ngrok-free.app/college/mbbs'; // Replace with your actual endpoint URL

                        // Define the route and pass the endpointURL as a parameter
                        // Navigate to the defined route
                        context.go('/collegeList', extra: endpointURL);
                        // Navigate to the defined route
                      },
                      child: const Text(
                        'Medical',
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20.0, 20.0, 10.0, 0.0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: MediaQuery.of(context).size.width * 0.65,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            MyApp.primaryColor.withOpacity(0.3)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                              color: MyApp.secondary,
                            ), // Use CircleBorder to make the button circular
                          ),
                        ),
                      ),
                      onPressed: () {
                        // Define the endpoint URL for this button
                        String endpointURL =
                            'https://3905-106-76-230-13.ngrok-free.app/college/science'; // Replace with your actual endpoint URL

                        // Define the route and pass the endpointURL as a parameter
                        // Navigate to the defined route
                        context.go('/collegeList', extra: endpointURL);
                        // Navigate to the defined route
                      },
                      child: const Text(
                        'Science',
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20.0, 20.0, 10.0, 0.0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: MediaQuery.of(context).size.width * 0.65,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            MyApp.primaryColor.withOpacity(0.3)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                              color: MyApp.secondary,
                            ), // Use CircleBorder to make the button circular
                          ),
                        ),
                      ),
                      onPressed: () {
                        // Define the endpoint URL for this button
                        String endpointURL =
                            'https://3905-106-76-230-13.ngrok-free.app/college/architecture';

                        // Define the route and pass the endpointURL as a parameter
                        // Navigate to the defined route
                        context.go('/collegeList', extra: endpointURL);
                        // Navigate to the defined route
                      },
                      child: const Text(
                        'Architecture',
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20.0, 20.0, 10.0, 0.0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: MediaQuery.of(context).size.width * 0.65,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            MyApp.primaryColor.withOpacity(0.3)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                              color: MyApp.secondary,
                            ), // Use CircleBorder to make the button circular
                          ),
                        ),
                      ),
                      onPressed: () {
                        // Define the endpoint URL for this button
                        String endpointURL =
                            'https://3905-106-76-230-13.ngrok-free.app/college/mass_media'; // Replace with your actual endpoint URL

                        // Define the route and pass the endpointURL as a parameter
                        // Navigate to the defined route
                        context.go('/collegeList', extra: endpointURL);
                        // Navigate to the defined route
                      },
                      child: const Text(
                        'Mass Media',
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20.0, 20.0, 10.0, 0.0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: MediaQuery.of(context).size.width * 0.65,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            MyApp.primaryColor.withOpacity(0.3)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                              color: MyApp.secondary,
                            ), // Use CircleBorder to make the button circular
                          ),
                        ),
                      ),
                      onPressed: () {
                        // Define the endpoint URL for this button
                        String endpointURL =
                            'https://3905-106-76-230-13.ngrok-free.app/college/law'; // Replace with your actual endpoint URL

                        // Define the route and pass the endpointURL as a parameter
                        // Navigate to the defined route
                        context.go('/collegeList', extra: endpointURL);
                        // Navigate to the defined route
                      },
                      child: const Text(
                        'Law',
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20.0, 20.0, 10.0, 0.0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: MediaQuery.of(context).size.width * 0.65,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            MyApp.primaryColor.withOpacity(0.3)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                              color: MyApp.secondary,
                            ), // Use CircleBorder to make the button circular
                          ),
                        ),
                      ),
                      onPressed: () {
                        // Define the endpoint URL for this button
                        String endpointURL =
                            'https://3905-106-76-230-13.ngrok-free.app/college/bcom'; // Replace with your actual endpoint URL

                        // Define the route and pass the endpointURL as a parameter
                        // Navigate to the defined route
                        context.go('/collegeList', extra: endpointURL);
                        // Navigate to the defined route
                      },
                      child: const Text(
                        'BCoM',
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20.0, 20.0, 10.0, 0.0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: MediaQuery.of(context).size.width * 0.65,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            MyApp.primaryColor.withOpacity(0.3)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                              color: MyApp.secondary,
                            ), // Use CircleBorder to make the button circular
                          ),
                        ),
                      ),
                      onPressed: () {
                        // Define the endpoint URL for this button
                        String endpointURL =
                            'https://3905-106-76-230-13.ngrok-free.app/college/mba'; // Replace with your actual endpoint URL

                        // Define the route and pass the endpointURL as a parameter
                        // Navigate to the defined route
                        context.go('/collegeList', extra: endpointURL);
                        // Navigate to the defined route
                      },
                      child: const Text(
                        'Management',
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
