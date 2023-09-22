import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../Widgets/customText.dart';
import '../main.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

Future<void> wait2Seconds() async {
  // Simulate an asynchronous operation,
  await Future.delayed(const Duration(seconds: 1));
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: FutureBuilder<void>(
          future: wait2Seconds(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // Show a loading indicator while waiting for data
              return Center(
                child: CircularProgressIndicator(
                  strokeWidth: 4,
                  color: Colors.white,
                ),
              );
            } else if (snapshot.hasError) {
              // Handle errors
              return Text('Error: ${snapshot.error}');
            } else {
              // Display data once it's loaded
              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height * 0.18,
                      margin: EdgeInsets.only(
                          top: 11.0, bottom: 5.0, left: 21.0, right: 21.0),
                      padding: EdgeInsets.only(
                          top: 6.0, bottom: 5.0, left: 5.0, right: 5.0),
                      width: 377.0,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(10, 30, 46, 0.6),
                        borderRadius: BorderRadius.circular(15.0),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 1,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Padding(
                          //   padding: const EdgeInsets.fromLTRB(11, 6, 12, 20),
                          //   child: CircleAvatar(
                          //     radius: 35,
                          //     child: Image.asset(
                          //       'assets/images/pragati_logo.png',
                          //       fit: BoxFit.cover,
                          //     ),
                          //   ),
                          // ),
                          Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(11, 6, 12, 20),
                                child: CircleAvatar(
                                  radius: 35,
                                  child: Image.asset(
                                    'assets/images/profilepic.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  customText(
                                      'Welcome',
                                      MyApp.secondary,
                                      22.0,
                                      EdgeInsets.fromLTRB(20.0, 20, 60, 9.0),
                                      FontWeight.w400,
                                      FontStyle.normal),
                                  customText(
                                      'Samrath Acharya',
                                      Colors.white,
                                      22.0,
                                      EdgeInsets.fromLTRB(20.0, 2, 50, 9.0),
                                      FontWeight.w400,
                                      FontStyle.normal),
                                  customText(
                                      'Grade 10',
                                      Colors.white,
                                      22.0,
                                      EdgeInsets.fromLTRB(20.0, 2, 60, 9.0),
                                      FontWeight.w400,
                                      FontStyle.normal),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(21, 20, 35, 12),
                      child: TextField(
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: MyApp.secondary, width: 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: MyApp.secondary),
                            ),
                            filled: true,
                            fillColor: Color.fromARGB(99, 18, 37, 53),
                            labelText: 'Explore More',
                            labelStyle: TextStyle(
                                color: Colors.white38, letterSpacing: 1.3)),
                      ),
                    ),
                    customText(
                        'Resources for you ',
                        Colors.white,
                        24.0,
                        EdgeInsets.fromLTRB(24.0, 12, 28, 9.0),
                        FontWeight.w400,
                        FontStyle.normal),
                    Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              padding:
                                  EdgeInsets.fromLTRB(21, 11.0, 11.0, 11.0),
                              child: SizedBox(
                                height: 120,
                                width: 160,
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            MyApp.primaryColor),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          side: BorderSide(
                                              color: MyApp.secondary)),
                                    ),
                                  ),
                                  onPressed: () => context.go('/skills'),
                                  child: Text(
                                    'Career Guidance',
                                    style: TextStyle(fontSize: 24.0),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding:
                                  EdgeInsets.fromLTRB(11, 11.0, 11.0, 11.0),
                              child: SizedBox(
                                height: 120,
                                width: 160,
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            MyApp.primaryColor),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          side: BorderSide(
                                              color: MyApp.secondary)),
                                    ),
                                  ),
                                  onPressed: () => context.go('/typesOfStream'),
                                  child: const Text(
                                    'Stream Based Paths',
                                    style: TextStyle(fontSize: 24.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              padding:
                                  EdgeInsets.fromLTRB(21, 11.0, 11.0, 11.0),
                              child: SizedBox(
                                height: 120,
                                width: 160,
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            MyApp.primaryColor),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          side: BorderSide(
                                              color: MyApp.secondary)),
                                    ),
                                  ),
                                  onPressed: () => context.go('/jobUserInfo'),
                                  child: Text(
                                    'Jobs',
                                    style: TextStyle(fontSize: 24.0),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding:
                                  EdgeInsets.fromLTRB(11, 11.0, 11.0, 11.0),
                              child: SizedBox(
                                height: 120,
                                width: 160,
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            MyApp.primaryColor),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          side: BorderSide(
                                              color: MyApp.secondary)),
                                    ),
                                  ),
                                  onPressed: () =>
                                      context.go('/typesOfColleges'),
                                  child: const Text(
                                    'Colleges',
                                    style: TextStyle(fontSize: 24.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              padding:
                                  EdgeInsets.fromLTRB(21, 11.0, 11.0, 11.0),
                              child: SizedBox(
                                height: 120,
                                width: 160,
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            MyApp.primaryColor),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          side: BorderSide(
                                              color: MyApp.secondary)),
                                    ),
                                  ),
                                  onPressed: () => context.go('/home'),
                                  child: const Text(
                                    'Aspirants',
                                    style: TextStyle(fontSize: 24.0),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding:
                                  EdgeInsets.fromLTRB(11, 11.0, 11.0, 11.0),
                              child: SizedBox(
                                height: 120,
                                width: 160,
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            MyApp.primaryColor),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          side: BorderSide(
                                              color: MyApp.secondary)),
                                    ),
                                  ),
                                  onPressed: () => context.go('/aptitudeHome'),
                                  child: Text(
                                    'Tests',
                                    style: TextStyle(fontSize: 24.0),
                                  ),
                                ),
                              ),
                            ),
                            // SizedBox(
                            //   height: 160,
                            //   width: 160,
                            //   child: ElevatedButton(
                            //     onPressed: () => context.go('/CareerPathPage'),
                            //     child: const Text('Career Information'),
                            //   ),
                            // ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              padding:
                                  EdgeInsets.fromLTRB(21, 11.0, 11.0, 11.0),
                              child: SizedBox(
                                height: 80,
                                width: 160,
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            MyApp.primaryColor),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          side: BorderSide(
                                              color: MyApp.secondary)),
                                    ),
                                  ),
                                  onPressed: () => context.go('/typesOfExam'),
                                  child: const Text(
                                    'Exams',
                                    style: TextStyle(fontSize: 24.0),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding:
                                  EdgeInsets.fromLTRB(11, 11.0, 11.0, 11.0),
                              child: SizedBox(
                                height: 80,
                                width: 160,
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            MyApp.primaryColor),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          side: BorderSide(
                                              color: MyApp.secondary)),
                                    ),
                                  ),
                                  onPressed: () => context.go('/home'),
                                  child: Text(
                                    'Other Serivces',
                                    style: TextStyle(fontSize: 24.0),
                                  ),
                                ),
                              ),
                            ),
                            // SizedBox(
                            //   height: 160,
                            //   width: 160,
                            //   child: ElevatedButton(
                            //     onPressed: () => context.go('/CareerPathPage'),
                            //     child: const Text('Career Information'),
                            //   ),
                            // ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }
          }),
    );
  }
}
