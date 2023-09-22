import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pragati_v1/Models/career.dart';
import 'package:pragati_v1/Widgets/customText.dart';
import 'package:pragati_v1/apiService.dart';

import '../../main.dart';

bool isLoaded = false;

class typesOfCareer extends StatefulWidget {
  final List<String> skillList;
  typesOfCareer({super.key, required this.skillList});

  @override
  State<typesOfCareer> createState() => _typesOfCareerState();
}

class _typesOfCareerState extends State<typesOfCareer> {
  late List<CareerModel>? careerList = [];

  void getData(List<String> skillList) async {
    careerList = await apiCollege().postSkills(skillList);
    if (careerList != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    // Access the endpointURL parameter in the initState method's body
    final List<String> skillList = widget.skillList;
    print(skillList);
    getData(skillList);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.go('/skills');
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

          future: apiCollege().postSkills(widget.skillList),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customText(
                  'Based on your Skills',
                  Colors.white,
                  24.0,
                  EdgeInsets.fromLTRB(25, 20, 28, 02),
                  FontWeight.w400,
                  FontStyle.normal),
              customText(
                  'We recommend you',
                  MyApp.secondary,
                  24.0,
                  EdgeInsets.fromLTRB(25, 2, 15, 20),
                  FontWeight.w300,
                  FontStyle.normal),
              customText(
                  'Career Path in',
                  Colors.white,
                  24.0,
                  EdgeInsets.fromLTRB(25, 2, 15, 20),
                  FontWeight.w300,
                  FontStyle.normal),
              Expanded(
                child: ListView.builder(
                  itemCount: careerList!.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.32,
                      margin: EdgeInsets.only(
                          top: 10.0, bottom: 25.0, left: 25.0, right: 24.0),
                      padding: EdgeInsets.only(
                          top: 3.0, bottom: 5.0, left: 2.0, right: 5.0),
                      width: 377.0,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(110, 18, 37, 53),
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(185, 18, 37, 53),
                            spreadRadius: 1.0,
                          ),
                        ],
                      ),
                      child:
                          // ? Column(
                          //     children: <Widget>[
                          //       Text(
                          //         'No Colleges Found',
                          //         style: Theme.of(context).textTheme.headline6,
                          //       ),
                          //       SizedBox(height: 10),
                          //       Container(
                          //         height: 200,
                          //         child: Image.asset(
                          //           'assets/images/nature.png',
                          //           fit: BoxFit.cover,
                          //         ),
                          //       ),
                          //     ],
                          //   ):
                          GestureDetector(
                        onTap: () => context.go('/careerInfo'),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            customText(
                                careerList![index].careerName,
                                Colors.white,
                                24.0,
                                EdgeInsets.fromLTRB(5, 0, 28, 02),
                                FontWeight.w400,
                                FontStyle.normal),
                            customText(
                                '${careerList![index].careerGrowth}% increase in jobs',
                                MyApp.secondary,
                                20.0,
                                EdgeInsets.fromLTRB(5, 10, 28, 02),
                                FontWeight.w300,
                                FontStyle.normal),
                            customText(
                                careerList![index].careerDescription.length > 280
                                    ? '${careerList![index].careerDescription.substring(0, 280)}....'
                                    : careerList![index].careerDescription,
                                Colors.white,
                                16.0,
                                EdgeInsets.fromLTRB(5, 10, 23, 10),
                                FontWeight.w300,
                                FontStyle.normal),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );}}
        ),
      ),
    );
  }
}
