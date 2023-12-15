import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pragati_v1/Widgets/customText.dart';
import 'package:pragati_v1/main.dart';
import 'package:url_launcher/url_launcher.dart';

class examDetails extends StatefulWidget {
  const examDetails({super.key});

  @override
  State<examDetails> createState() => _examDetailsState();
}

class _examDetailsState extends State<examDetails> {
  Widget build(BuildContext context) {
    // Color secondaryColor = Theme.of(context).colorScheme.secondary;
    return WillPopScope(
      onWillPop: () async {
        context.go('/typesOfExams');
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
                  "https://s3images.zee5.com/wp-content/uploads/2022/01/JEE2022Exam2022012809032320220128091544.jpg",
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  customText(
                      'Joint Entrance Exam - JEE',
                      Colors.white,
                      24.0,
                      EdgeInsets.fromLTRB(31, 27, 31, 02),
                      FontWeight.bold,
                      FontStyle.normal),
                ],
              ),
              customText(
                  'Description',
                  Colors.white,
                  20.0,
                  EdgeInsets.fromLTRB(20, 35, 261, 20),
                  FontWeight.bold,
                  FontStyle.normal),
              customText(
                  'IIT Delhi was established in 1961. First, it was established as the College of Engineering, and later on, it was declared as an Institute of National Importance under the ‘Institute of Technology Act, 1963’.',
                  Colors.white,
                  16.0,
                  EdgeInsets.fromLTRB(22, 5, 22, 30),
                  FontWeight.w400,
                  FontStyle.normal),
              Container(
                height: MediaQuery.of(context).size.height * 0.5,
                margin: EdgeInsets.only(
                    top: 0.0, bottom: 25.0, left: 25.0, right: 25.0),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customText(
                        'Details',
                        Colors.white,
                        28.0,
                        EdgeInsets.fromLTRB(22, 5, 0, 20),
                        FontWeight.bold,
                        FontStyle.normal),
                    Row(
                      children: [
                        customText(
                            'Eligibility:',
                            Colors.white,
                            20.0,
                            EdgeInsets.fromLTRB(22, 5, 0, 7),
                            FontWeight.w400,
                            FontStyle.normal),
                      ],
                    ),
                    Row(
                      children: [
                        customText(
                            '10+2 with 75% + JEE Advanced',
                            MyApp.secondary,
                            20.0,
                            EdgeInsets.fromLTRB(22, 0, 2, 20),
                            FontWeight.bold,
                            FontStyle.normal),
                      ],
                    ),
                    Row(
                      children: [
                        customText(
                            'Registration Fees:',
                            Colors.white,
                            20.0,
                            EdgeInsets.fromLTRB(22, 5, 0, 7),
                            FontWeight.w400,
                            FontStyle.normal),
                      ],
                    ),
                    Row(children: [
                      customText(
                          'Rs 2000/-',
                          MyApp.secondary,
                          20.0,
                          EdgeInsets.fromLTRB(22, 0, 0, 20),
                          FontWeight.bold,
                          FontStyle.normal),
                    ]),
                    Row(
                      children: [
                        customText(
                            'Previous Year Papers :',
                            Colors.white,
                            20.0,
                            EdgeInsets.fromLTRB(22, 5, 0, 27),
                            FontWeight.w400,
                            FontStyle.normal),
                        IconButton(
                          padding: EdgeInsets.fromLTRB(5, 05, 0, 25),
                          iconSize: 30,
                          icon: const Icon(Icons.link),
                          color: MyApp.secondary,
                          onPressed: () {
                            Uri uri = Uri.parse("youtube.com");
                            launchUrl(uri);
                          },
                        ),
                      ],
                    ),
                    Center(
                      child: Container(
                        margin: EdgeInsets.all(12.0),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.85,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  MyApp.secondary),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                            ),
                            onPressed: () {
                              // String name = _textFieldController1.text;
                              // String password = _textFieldController2.text;
                              Uri uri = Uri.parse("youtube.com");
                              launchUrl(uri);
                            },
                            child: const Text(
                              'Go to Website ',
                              style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontSize: 22,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
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
