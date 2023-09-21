import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../Widgets/customText.dart';
import '../../main.dart';

class CollegeInfoPage extends StatefulWidget {
  const CollegeInfoPage({Key? key}) : super(key: key);

  @override
  State<CollegeInfoPage> createState() => _CollegeInfoPageState();
}

class _CollegeInfoPageState extends State<CollegeInfoPage> {
  @override
  Widget build(BuildContext context) {
    // Color secondaryColor = Theme.of(context).colorScheme.secondary;
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 24.0,
              ),
              CircleAvatar(
                radius: 35,
                child: Image.network(
                  "https://static.zollege.in/public/college_data/images/logos/1434977143jpjpjpjpj.jpg?tr=h-60,w-60,c-force",
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  customText(
                      'IIT',
                      Colors.white,
                      24.0,
                      EdgeInsets.fromLTRB(31, 27, 31, 02),
                      FontWeight.bold,
                      FontStyle.normal),
                  customText(
                      'Delhi',
                      Colors.white,
                      24.0,
                      EdgeInsets.fromLTRB(31, 0, 31, 02),
                      FontWeight.bold,
                      FontStyle.normal),
                  Row(
                    children: [
                      IconButton(
                        padding: EdgeInsets.fromLTRB(134, 0, 0, 0),
                        iconSize: 27,
                        icon: const Icon(Icons.location_on_outlined),
                        color: MyApp.secondary,
                        onPressed: () => context.go('/CollegeInfoPage'),
                      ),
                      customText(
                          'New Delhi, India',
                          Colors.white,
                          16.0,
                          EdgeInsets.fromLTRB(0, 0, 31, 0),
                          FontWeight.w400,
                          FontStyle.normal),
                    ],
                  ),
                ],
              ),
              customText(
                  'Information',
                  Colors.white,
                  20.0,
                  EdgeInsets.fromLTRB(0, 35, 261, 20),
                  FontWeight.bold,
                  FontStyle.normal),
              customText(
                  'IIT Delhi was established in 1961. First, it was established as the College of Engineering, and later on, it was declared as an Institute of National Importance under the ‘Institute of Technology Act, 1963’. The Government of India has given the status of Deemed University, the college is autonomous and can take its own decisions about the academic policy, examinations and degrees.',
                  Colors.white,
                  16.0,
                  EdgeInsets.fromLTRB(22, 5, 22, 40),
                  FontWeight.w400,
                  FontStyle.normal),
              Container(
                height: MediaQuery.of(context).size.height * 0.60,
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
                    customText(
                        'B.Tech',
                        Colors.white,
                        28.0,
                        EdgeInsets.fromLTRB(22, 5, 0, 20),
                        FontWeight.bold,
                        FontStyle.normal),
                    Row(
                      children: [
                        customText(
                            'Ranking:',
                            Colors.white,
                            20.0,
                            EdgeInsets.fromLTRB(22, 5, 0, 7),
                            FontWeight.w400,
                            FontStyle.normal),
                        customText(
                            '1st year Fees',
                            Colors.white,
                            20.0,
                            EdgeInsets.fromLTRB(99, 5, 0, 7),
                            FontWeight.w400,
                            FontStyle.normal),
                      ],
                    ),
                    Row(
                      children: [
                        customText(
                            '# 2 NIRF',
                            MyApp.secondary,
                            20.0,
                            EdgeInsets.fromLTRB(22, 0, 0, 40),
                            FontWeight.bold,
                            FontStyle.normal),
                        customText(
                            'Rs 2,20,000/-',
                            MyApp.secondary,
                            20.0,
                            EdgeInsets.fromLTRB(99, 0, 0, 40),
                            FontWeight.bold,
                            FontStyle.normal),
                      ],
                    ),
                    Row(
                      children: [
                        customText(
                            'Duration:',
                            Colors.white,
                            20.0,
                            EdgeInsets.fromLTRB(22, 5, 0, 7),
                            FontWeight.w400,
                            FontStyle.normal),
                        customText(
                            'Exams:',
                            Colors.white,
                            20.0,
                            EdgeInsets.fromLTRB(99, 5, 0, 7),
                            FontWeight.w400,
                            FontStyle.normal),
                      ],
                    ),
                    Row(
                      children: [
                        customText(
                            '4 Years.',
                            MyApp.secondary,
                            20.0,
                            EdgeInsets.fromLTRB(22, 0, 0, 40),
                            FontWeight.bold,
                            FontStyle.normal),
                        customText(
                            'JEE Advanced',
                            MyApp.secondary,
                            20.0,
                            EdgeInsets.fromLTRB(99, 0, 0, 40),
                            FontWeight.bold,
                            FontStyle.normal),
                      ],
                    ),
                    customText(
                        'Eligibiilty',
                        Colors.white,
                        20.0,
                        EdgeInsets.fromLTRB(22, 5, 0, 7),
                        FontWeight.w400,
                        FontStyle.normal),
                    customText(
                        '10+2 with 75% + JEE Advanced',
                        MyApp.secondary,
                        20.0,
                        EdgeInsets.fromLTRB(22, 0, 152, 20),
                        FontWeight.bold,
                        FontStyle.normal),
                  ],
                ),
              ),
             
      
            ],
          ),
        ),
      ),
    );
    // Scaffold(
    //   backgroundColor: MyApp.backgroundColor,
    //   appBar: AppBar(
    //     title: const Text(MyApp.title),
    //     leading: ElevatedButton(
    //       onPressed: () => context.go('/'),
    //       child: const Icon(Icons.arrow_back),
    //     ),
    //   ),
    //   body: Column(
    //     children: <Widget>[
    //       Text(
    //         "College for",
    //         selectionColor: secondaryColor,
    //         style: Theme.of(context).textTheme.headline6,
    //       ),
    //       Text(
    //         "Information Science",
    //         style: Theme.of(context).textTheme.headline6,
    //       ),
    //       Column(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: <Widget>[
    //           ElevatedButton(
    //             onPressed: () => context.go('/CollegeInfoPage'),
    //             child: const Text('College Information'),
    //           ),
    //         ],
    //       ),
    //     ],
    //   ),
    // );
  }
}



