import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../Models/college.dart';
import '../../Widgets/customText.dart';
import '../../apiService.dart';
import '../../main.dart';

class collegeList extends StatefulWidget {
  final String endpointURL;

  collegeList({required this.endpointURL});

  @override
  State<collegeList> createState() => CollegeListState();
}

var isLoaded = false;

class CollegeListState extends State<collegeList> {
  late List<college>? collegeList = [];

  void getData(String endpointURL) async {
    collegeList = (await apiCollege().getCollege(endpointURL));
    if (collegeList != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    // Access the endpointURL parameter in the initState method's body
    final String endpointURL = widget.endpointURL;
    // print(endpointURL);
    getData(endpointURL);
  }

  @override
  Widget build(BuildContext context) {
    // print(userModel![0].name);

    return WillPopScope(
      onWillPop: () async {
        context.go('/typesOfColleges');
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
            future: apiCollege().getCollege(widget.endpointURL),
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
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    customText(
                        'Colleges for',
                        Colors.white,
                        24.0,
                        EdgeInsets.fromLTRB(10, 20, 238, 02),
                        FontWeight.w400,
                        FontStyle.normal),
                    customText(
                        'Engineering',
                        MyApp.secondary,
                        24.0,
                        EdgeInsets.fromLTRB(0, 2, 228, 20),
                        FontWeight.w400,
                        FontStyle.normal),
                    Expanded(
                      child: ListView.builder(
                        itemCount: collegeList!.length,
                        itemBuilder: (context, index) {
                          return Container(
                            height: MediaQuery.of(context).size.height * 0.18,
                            margin: EdgeInsets.only(
                                top: 10.0,
                                bottom: 25.0,
                                left: 25.0,
                                right: 25.0),
                            padding: EdgeInsets.only(
                                top: 16.0, bottom: 5.0, left: 5.0, right: 5.0),
                            width: 377.0,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(10, 30, 46, .95),
                              borderRadius: BorderRadius.circular(15.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  spreadRadius: 1.0,
                                  blurRadius: 3.0,
                                ),
                              ],
                            ),
                            child: GestureDetector(
                              onTap: () => context.go('/CollegeInfo'),
                              child: ListTile(
                                leading: CircleAvatar(
                                  radius: 30,
                                  child: Image.network(
                                    collegeList![index].logo,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                title: customText(
                                  collegeList![index].name,
                                  Colors.white,
                                  20.0,
                                  EdgeInsets.fromLTRB(15, 0, 0, 0),
                                  FontWeight.bold,
                                  FontStyle.normal,
                                ),
                                subtitle: Row(
                                  children: [
                                    IconButton(
                                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      iconSize: 35.0,
                                      icon: const Icon(
                                          Icons.location_on_outlined),
                                      color: MyApp.secondary,
                                      onPressed: () =>
                                          context.go('/CollegeInfo'),
                                    ),
                                    customText(
                                        collegeList![index].location,
                                        Colors.white,
                                        14.0,
                                        EdgeInsets.fromLTRB(0, 0, 23, 0),
                                        FontWeight.w400,
                                        FontStyle.normal),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              }
            }),
      ),
    );
  }
}
