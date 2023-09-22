import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pragati_v1/Widgets/customText.dart';
import 'package:pragati_v1/main.dart';

class jobInfo extends StatefulWidget {
  const jobInfo({super.key});

  @override
  State<jobInfo> createState() => _jobInfoState();
}

class _jobInfoState extends State<jobInfo> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyApp.primaryColor,
      appBar: AppBar(
        leading: ElevatedButton(
          onPressed: () => context.go('/home'),
          child: const Icon(Icons.arrow_back),
        ),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 24.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        customText(
                            'Senior Software \nEngineer',
                            Colors.white,
                            24.0,
                            EdgeInsets.fromLTRB(27, 2, 41, 02),
                            FontWeight.bold,
                            FontStyle.normal),
                        customText(
                            'PayPal',
                            Colors.white,
                            24.0,
                            EdgeInsets.fromLTRB(27, 10, 81, 12),
                            FontWeight.w300,
                            FontStyle.normal),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CircleAvatar(
                        radius: 45,
                        child: Image.asset(
                          'assets/images/jobicon.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
                      iconSize: 27,
                      icon: const Icon(Icons.shopping_bag),
                      color: MyApp.secondary,
                      onPressed: () => context.go('/CollegeInfoPage'),
                    ),
                    customText(
                        '1-4 years',
                        Colors.white,
                        18.0,
                        EdgeInsets.fromLTRB(0, 0, 31, 0),
                        FontWeight.w400,
                        FontStyle.normal),
                    IconButton(
                      padding: EdgeInsets.fromLTRB(24, 0, 0, 0),
                      iconSize: 27,
                      icon: const Icon(Icons.location_on),
                      color: MyApp.secondary,
                      onPressed: () => context.go('/CollegeInfoPage'),
                    ),
                    customText(
                        'New Delhi, India',
                        Colors.white,
                        18.0,
                        EdgeInsets.fromLTRB(0, 0, 30, 0),
                        FontWeight.w400,
                        FontStyle.normal),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
                      iconSize: 27,
                      icon: const Icon(Icons.currency_rupee),
                      color: MyApp.secondary,
                      onPressed: () => context.go('/CollegeInfoPage'),
                    ),
                    customText(
                        '6.0 - 8.5 LPA',
                        Colors.white,
                        18.0,
                        EdgeInsets.fromLTRB(0, 0, 30, 0),
                        FontWeight.w400,
                        FontStyle.normal),
                  ],
                ),
              ],
            ),
            customText(
                'Job Description',
                Colors.white,
                20.0,
                EdgeInsets.fromLTRB(25, 35, 21, 20),
                FontWeight.bold,
                FontStyle.normal),
            customText(
                'The role involves creating insights from predictive statistical modeling, mathematical knowledge, tools, and techniques to solve complex problems and deliver value Implement new predictive and prescriptive solutions based upon business needs and requirements Translate business issues into specific requirements to develop analytic solutions.',
                Colors.white,
                16.0,
                EdgeInsets.fromLTRB(22, 5, 22, 40),
                FontWeight.w400,
                FontStyle.normal),
            Container(
              height: MediaQuery.of(context).size.height * 0.69,
              margin: EdgeInsets.only(
                  top: 0.0, bottom: 25.0, left: 25.0, right: 25.0),
              padding: EdgeInsets.only(
                  top: 16.0, bottom: 5.0, left: 5.0, right: 5.0),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      customText(
                          'Role',
                          Colors.white,
                          20.0,
                          EdgeInsets.fromLTRB(22, 5, 0, 7),
                          FontWeight.w400,
                          FontStyle.normal),
                      customText(
                          'Functional Area',
                          Colors.white,
                          20.0,
                          EdgeInsets.fromLTRB(119, 5, 0, 7),
                          FontWeight.w400,
                          FontStyle.normal),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        height: 80,
                        width: 120,
                        child: customText(
                            'Senior SDE',
                            MyApp.secondary,
                            20.0,
                            EdgeInsets.fromLTRB(22, 5, 10, 7),
                            FontWeight.bold,
                            FontStyle.normal),
                      ),
                      SizedBox(
                        height: 80,
                        width: 200,
                        child: customText(
                            'Development & Testing',
                            MyApp.secondary,
                            20.0,
                            EdgeInsets.fromLTRB(59, 5, 10, 7),
                            FontWeight.bold,
                            FontStyle.normal),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        height: 100,
                        width: 150,
                        child: customText(
                            'Employement Type',
                            Colors.white,
                            20.0,
                            EdgeInsets.fromLTRB(22, 35, 0, 7),
                            FontWeight.w400,
                            FontStyle.normal),
                      ),
                      customText(
                          'Role Category',
                          Colors.white,
                          20.0,
                          EdgeInsets.fromLTRB(40, 0, 0, 7),
                          FontWeight.w400,
                          FontStyle.normal),
                    ],
                  ),
                  Row(
                    children: [
                      customText(
                          'Permanent',
                          MyApp.secondary,
                          20.0,
                          EdgeInsets.fromLTRB(22, 0, 0, 40),
                          FontWeight.bold,
                          FontStyle.normal),
                      customText(
                          'Machine\nLearning',
                          MyApp.secondary,
                          20.0,
                          EdgeInsets.fromLTRB(65, 0, 0, 40),
                          FontWeight.bold,
                          FontStyle.normal),
                    ],
                  ),
                  customText(
                      'Education',
                      Colors.white,
                      20.0,
                      EdgeInsets.fromLTRB(22, 5, 0, 7),
                      FontWeight.w400,
                      FontStyle.normal),
                  customText(
                      'Education\nUG:Any Graduate\nPG:Any PostGraduate',
                      MyApp.secondary,
                      20.0,
                      EdgeInsets.fromLTRB(22, 0, 112, 20),
                      FontWeight.bold,
                      FontStyle.normal),
                ],
              ),
            ),
            Center(
              child: SizedBox(
                height: 38,
                width: 320,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(MyApp.secondary),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                  ),
                  onPressed: () => context.go('/'),
                  child: const Text(
                    'Interested',
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
      ),
    );
  }
}
