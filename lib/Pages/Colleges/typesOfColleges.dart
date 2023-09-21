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
      onWillPop:()async{
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
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                customText(
                  'Under Graduate',
                  Colors.white,
                  30.0,
                  EdgeInsets.fromLTRB(20, 40, 20, 0),
                  FontWeight.w400,
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
                        // Define the endpoint URL for this button
                        String endpointURL =
                            'https://0aa6-122-172-85-234.ngrok-free.app/college'; // Replace with your actual endpoint URL
    
                        // Define the route and pass the endpointURL as a parameter
                        // Navigate to the defined route
                        context.go('/collegeList', extra:endpointURL );
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
                  margin: EdgeInsets.fromLTRB(20.0, 40.0, 10.0, 0.0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: MediaQuery.of(context).size.width * 0.65,
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
                        // Define the endpoint URL for this button
                        String endpointURL =
                            'https://0aa6-122-172-85-234.ngrok-free.app/college'; // Replace with your actual endpoint URL
    
                        // Define the route and pass the endpointURL as a parameter
                        // Navigate to the defined route
                        context.go('/collegeList', extra:endpointURL );
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
                  margin: EdgeInsets.fromLTRB(20.0, 40.0, 10.0, 0.0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: MediaQuery.of(context).size.width * 0.65,
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
                        // Define the endpoint URL for this button
                        String endpointURL =
                            'https://0aa6-122-172-85-234.ngrok-free.app/college'; // Replace with your actual endpoint URL
    
                        // Define the route and pass the endpointURL as a parameter
                        // Navigate to the defined route
                        context.go('/collegeList', extra:endpointURL );
                        // Navigate to the defined route
                      },
                      child: const Text(
                        'Arts',
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
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
                        // Define the endpoint URL for this button
                        String endpointURL =
                            'https://0aa6-122-172-85-234.ngrok-free.app/college'; // Replace with your actual endpoint URL
    
                        // Define the route and pass the endpointURL as a parameter
                        // Navigate to the defined route
                        context.go('/collegeList', extra:endpointURL );
                        // Navigate to the defined route
                      },
                      child: const Text(
                        'Designing',
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
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
                        // Define the endpoint URL for this button
                        String endpointURL =
                            'https://0aa6-122-172-85-234.ngrok-free.app/college'; // Replace with your actual endpoint URL
    
                        // Define the route and pass the endpointURL as a parameter
                        // Navigate to the defined route
                        context.go('/collegeList', extra:endpointURL );
                        // Navigate to the defined route
                      },
                      child: const Text(
                        'BCA',
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
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
                        // Define the endpoint URL for this button
                        String endpointURL =
                            'https://0aa6-122-172-85-234.ngrok-free.app/college'; // Replace with your actual endpoint URL
    
                        // Define the route and pass the endpointURL as a parameter
                        // Navigate to the defined route
                        context.go('/collegeList', extra:endpointURL );
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
                  margin: EdgeInsets.fromLTRB(20.0, 40.0, 10.0, 0.0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: MediaQuery.of(context).size.width * 0.65,
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
                        // Define the endpoint URL for this button
                        String endpointURL =
                            'https://0aa6-122-172-85-234.ngrok-free.app/college'; // Replace with your actual endpoint URL
    
                        // Define the route and pass the endpointURL as a parameter
                        // Navigate to the defined route
                        context.go('/collegeList', extra:endpointURL );
                        // Navigate to the defined route
                      },
                      child: const Text(
                        'BBA',
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
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
                        // Define the endpoint URL for this button
                        String endpointURL =
                            'https://0aa6-122-172-85-234.ngrok-free.app/college'; // Replace with your actual endpoint URL
    
                        // Define the route and pass the endpointURL as a parameter
                        // Navigate to the defined route
                        context.go('/collegeList', extra:endpointURL );
                        // Navigate to the defined route
                      },
                      child: const Text(
                        'Hotel Management',
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20.0, 40.0, 10.0, 50.0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: MediaQuery.of(context).size.width * 0.65,
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
                        // Define the endpoint URL for this button
                        String endpointURL =
                            'https://0aa6-122-172-85-234.ngrok-free.app/college'; // Replace with your actual endpoint URL
    
                        // Define the route and pass the endpointURL as a parameter
                        // Navigate to the defined route
                        context.go('/collegeList', extra:endpointURL );
                        // Navigate to the defined route
                      },
                      child: const Text(
                        'Finance',
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                customText(
                  'Post Graduate',
                  Colors.white,
                  30.0,
                  EdgeInsets.fromLTRB(20, 40, 20, 0),
                  FontWeight.w400,
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
                        // Define the endpoint URL for this button
                        String endpointURL =
                            'https://0aa6-122-172-85-234.ngrok-free.app/college'; // Replace with your actual endpoint URL
    
                        // Define the route and pass the endpointURL as a parameter
                        // Navigate to the defined route
                        context.go('/collegeList', extra:endpointURL );
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
                Container(
                  margin: EdgeInsets.fromLTRB(20.0, 40.0, 10.0, 0.0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: MediaQuery.of(context).size.width * 0.65,
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
                        // Define the endpoint URL for this button
                        String endpointURL =
                            'https://0aa6-122-172-85-234.ngrok-free.app/college'; // Replace with your actual endpoint URL
    
                        // Define the route and pass the endpointURL as a parameter
                        // Navigate to the defined route
                        context.go('/collegeList', extra:endpointURL );
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
                  margin: EdgeInsets.fromLTRB(20.0, 40.0, 10.0, 0.0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: MediaQuery.of(context).size.width * 0.65,
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
                        // Define the endpoint URL for this button
                        String endpointURL =
                            'https://0aa6-122-172-85-234.ngrok-free.app/college'; // Replace with your actual endpoint URL
    
                        // Define the route and pass the endpointURL as a parameter
                        // Navigate to the defined route
                        context.go('/collegeList', extra:endpointURL );
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
                  margin: EdgeInsets.fromLTRB(20.0, 40.0, 10.0, 0.0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: MediaQuery.of(context).size.width * 0.65,
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
                        // Define the endpoint URL for this button
                        String endpointURL =
                            'https://0aa6-122-172-85-234.ngrok-free.app/college'; // Replace with your actual endpoint URL
    
                        // Define the route and pass the endpointURL as a parameter
                        // Navigate to the defined route
                        context.go('/collegeList', extra:endpointURL );
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
                  margin: EdgeInsets.fromLTRB(20.0, 40.0, 10.0, 0.0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: MediaQuery.of(context).size.width * 0.65,
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
                        // Define the endpoint URL for this button
                        String endpointURL =
                            'https://0aa6-122-172-85-234.ngrok-free.app/college'; // Replace with your actual endpoint URL
    
                        // Define the route and pass the endpointURL as a parameter
                        // Navigate to the defined route
                        context.go('/collegeList', extra:endpointURL );
                        // Navigate to the defined route
                      },
                      child: const Text(
                        'Arts',
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
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
                        // Define the endpoint URL for this button
                        String endpointURL =
                            'https://0aa6-122-172-85-234.ngrok-free.app/college'; // Replace with your actual endpoint URL
    
                        // Define the route and pass the endpointURL as a parameter
                        // Navigate to the defined route
                        context.go('/collegeList', extra:endpointURL );
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
                  margin: EdgeInsets.fromLTRB(20.0, 40.0, 10.0, 0.0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: MediaQuery.of(context).size.width * 0.65,
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
                        // Define the endpoint URL for this button
                        String endpointURL =
                            'https://0aa6-122-172-85-234.ngrok-free.app/college'; // Replace with your actual endpoint URL
    
                        // Define the route and pass the endpointURL as a parameter
                        // Navigate to the defined route
                        context.go('/collegeList', extra:endpointURL );
                        // Navigate to the defined route
                      },
                      child: const Text(
                        'Design',
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
