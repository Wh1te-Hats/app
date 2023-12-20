import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pragati_v1/Widgets/customText.dart';
import 'package:pragati_v1/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  late String? storedUserId;
  late String? storedName;
  late String? storedGrade;

  Future<void> wait() async {
    await Future.delayed(const Duration(seconds: 1));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    storedUserId = prefs.getString('user_id');
    storedName = prefs.getString('name');
    storedGrade = prefs.getString('grade');
  }

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.go('/home');
        return false;
      },
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          backgroundColor: MyApp.primaryColor,
          appBar: AppBar(
            title: const Text(MyApp.title),
          ),
          body: FutureBuilder<void>(
              future: wait(),
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
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: ClipOval(
                          child: Image.asset(
                            'assets/images/tagline.png',
                            fit: BoxFit.cover,
                            height: 160.0,
                            width: 160.0,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          customText(
                              'Hey',
                              Colors.white,
                              25.0,
                              EdgeInsets.fromLTRB(35, 10, 0, 02),
                              FontWeight.normal,
                              FontStyle.normal),
                          customText(
                              "${storedName!} ,",
                              MyApp.secondary,
                              25.0,
                              EdgeInsets.fromLTRB(10, 10, 0, 02),
                              FontWeight.bold,
                              FontStyle.normal),
                        ],
                      ),
                      customText(
                          'Welcome to our ASPIRANTS page !! We are committed to helping you achieve your GOALS......',
                          Colors.white,
                          24.0,
                          EdgeInsets.fromLTRB(30, 10, 0, 25),
                          FontWeight.normal,
                          FontStyle.normal),
                      SizedBox(height: 5),
                      Divider(
                        thickness: 1,
                        color: MyApp.secondary
                      ),
                      Center(
                        child: ClipOval(
                          child: Image.asset(
                            'assets/images/career-1.png',
                            fit: BoxFit.cover,
                            height: 100.0,
                            width: 100.0,
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          margin: EdgeInsets.all(20.0),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.06,
                            width: MediaQuery.of(context).size.width * 0.85,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        MyApp.secondary),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                              ),
                              onPressed: () async {
                                context.go('/typesOfAspirants');
                              },
                              child:  
                                  const Text(
                                    'Get Started',
                                    style: TextStyle(
                                      fontStyle: FontStyle.normal,
                                      fontSize: 26,
                                    
                                  ),
                                
                              ),
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: ClipOval(
                          child: Image.asset(
                            'assets/images/student-1.png',
                            height: 100.0,
                            width: 100.0,
                          ),
                        ),
                      ),
                       Divider(
                        thickness: 1,
                        color: MyApp.secondary
                      ),
                    ],
                  );
                }
              }),
        ),
      ),
    );
  }
}
