import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pragati_v1/Models/courseList.dart';
import 'package:pragati_v1/Providers/userInfoProvider.dart';
import 'package:pragati_v1/Widgets/customText.dart';
import 'package:pragati_v1/apiService.dart';
import 'package:pragati_v1/main.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CourseBased extends StatefulWidget {
  final List<CourseList> courseList;

  CourseBased({super.key, required this.courseList});

  @override
  State<CourseBased> createState() => _CourseBasedState();
}

var isLoaded = false;

class _CourseBasedState extends State<CourseBased> {
  // List<String> subjects1 = [
  //   'English',
  //   'Maths',
  //   'Science',
  //   'Hindi',
  //   'Social Science',
  //   'IT(A)',
  //   'IT(B)'
  // ];

  late List<CourseList> list = [];
  late String storedGrade = '9' ;

  

  void initState() {
    super.initState();
  }

  Future<void> execute() async {
    // Simulate an asynchronous operation,
    SharedPreferences prefs = await SharedPreferences.getInstance();
    storedGrade = prefs.getString('grade')??"9";
    list = (await apiCollege().getCourseList(storedGrade));

  }

  // void getData(String grade) async {
    
  //   print(storedGrade);
  //   setState(() {
  //     isLoaded = true;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.go('/aptitudeHome');
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
        body: FutureBuilder<void>(
          future: execute(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // Show a loading indicator while waiting for data
              return Center(
                child: CircularProgressIndicator(
                  strokeWidth: 5,
                  color: Colors.white,
                ),
              );
            } else if (snapshot.hasError) {
              // Handle errors
              return Text('Error: ${snapshot.error}');
            } else {
              // Display data once it's loaded
              return SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      customText(
                        'Tests For You',
                        Colors.white,
                        30.0,
                        EdgeInsets.fromLTRB(20, 20, 20, 20),
                        FontWeight.w400,
                        FontStyle.normal,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.75,
                        child: ListView.builder(
                          itemCount: list.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin:
                                  EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
                              child: SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.07,
                                width: MediaQuery.of(context).size.width * 0.55,
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                      MyApp.primaryColor.withOpacity(0.3),
                                    ),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        side: BorderSide(
                                          color: MyApp.secondary,
                                        ),
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    // Customize the onPressed logic if needed
                                    context.go('/chapters', extra: list[index]);
                                  },
                                  child: Text(
                                    list[index].subject,
                                    style: TextStyle(
                                      fontStyle: FontStyle.normal,
                                      fontSize: 22,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
