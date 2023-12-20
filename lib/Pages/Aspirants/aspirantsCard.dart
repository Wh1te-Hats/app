import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pragati_v1/Widgets/customText.dart';
import 'package:pragati_v1/main.dart';

class AspirantsCard extends StatefulWidget {
  const AspirantsCard({super.key});

  @override
  State<AspirantsCard> createState() => _AspirantsCardState();
}

class _AspirantsCardState extends State<AspirantsCard> {
  Future<void> wait() async {
    await Future.delayed(const Duration(seconds: 1));
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
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(5, 5, 05, 0),
                            child: ClipOval(
                              child: Image.asset(
                                'assets/images/tagline.png',
                                fit: BoxFit.cover,
                                height: 100.0,
                                width: 100.0,
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: customText(
                                'Creating your path to Success....',
                                Colors.white,
                                22.0,
                                EdgeInsets.fromLTRB(10, 5, 0, 0),
                                FontWeight.normal,
                                FontStyle.normal),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: 10.0, bottom: 15.0, left: 10.0, right: 10.0),
                        padding: EdgeInsets.only(
                            top: 10.0, bottom: 5.0, left: 0.0, right: 0.0),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(10, 30, 46, 0.6),
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(
                            color: MyApp
                                .secondary, // Specify the border color here
                            width: 1.0, // Specify the border width here
                          ),
                        ),
                        height: MediaQuery.of(context).size.height * 0.72,
                        width: MediaQuery.of(context).size.width * 0.94,
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding:
                                            EdgeInsets.fromLTRB(15, 15, 0, 05),
                                        child: CircleAvatar(
                                          radius: 15,
                                          child: Image.asset(
                                            'assets/images/bullet.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.fromLTRB(10, 10, 0, 05),
                                        child: Column(
                                          children: List.generate(
                                            5,
                                            (index) => Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  15, 5, 20, 5),
                                              height: 15,
                                              width:
                                                  5, // Adjust the width as needed
                                              color: MyApp.secondary,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.13,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.75,
                                        child: customText(
                                            '- You must choose the following as your Optional in class 9&10..',
                                            Colors.white,
                                            20.0,
                                            EdgeInsets.fromLTRB(15, 15, 0, 05),
                                            FontWeight.normal,
                                            FontStyle.normal),
                                      ),
                                      Center(
                                        child: Container(
                                          margin: EdgeInsets.all(12.0),
                                          child: SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.05,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.67,
                                            child: ElevatedButton(
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all<
                                                        Color>(MyApp.secondary),
                                                shape: MaterialStateProperty.all<
                                                        RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                )),
                                              ),
                                              onPressed: () {
                                                // String name = _textFieldController1.text;
                                                // String password = _textFieldController2.text;
                                                context.go('/aspirantsDetails',
                                                    extra: 0);
                                              },
                                              child: Row(
                                                children: [
                                                  Text(
                                                    'Structured Infomration',
                                                    style: TextStyle(
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                  Icon(Icons.launch,
                                                      color: Colors.white,
                                                      size: 25),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding:
                                            EdgeInsets.fromLTRB(15, 15, 0, 05),
                                        child: CircleAvatar(
                                          radius: 15,
                                          child: Image.asset(
                                            'assets/images/bullet.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.fromLTRB(10, 10, 0, 05),
                                        child: Column(
                                          children: List.generate(
                                            6,
                                            (index) => Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  15, 5, 20, 5),
                                              height: 15,
                                              width:
                                                  5, // Adjust the width as needed
                                              color: MyApp.secondary,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.17,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.75,
                                        child: customText(
                                            '- Entering Class 11&12 here are some Colleges, Streams and Exams we reccommend for your growth...',
                                            Colors.white,
                                            18.0,
                                            EdgeInsets.fromLTRB(15, 15, 0, 05),
                                            FontWeight.normal,
                                            FontStyle.normal),
                                      ),
                                      Center(
                                        child: Container(
                                          margin:
                                              EdgeInsets.fromLTRB(0, 0, 0, 10),
                                          child: SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.05,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.65,
                                            child: ElevatedButton(
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all<
                                                        Color>(MyApp.secondary),
                                                shape: MaterialStateProperty.all<
                                                        RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                )),
                                              ),
                                              onPressed: () {
                                                // String name = _textFieldController1.text;
                                                // String password = _textFieldController2.text;
                                                context.go('/aspirantsDetails',
                                                    extra: 1);
                                              },
                                              child: Row(
                                                children: [
                                                  Text(
                                                    'Stream Giudance',
                                                    style: TextStyle(
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontSize: 24,
                                                    ),
                                                  ),
                                                  Icon(Icons.launch,
                                                      color: Colors.white,
                                                      size: 25),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding:
                                            EdgeInsets.fromLTRB(15, 15, 0, 05),
                                        child: CircleAvatar(
                                          radius: 15,
                                          child: Image.asset(
                                            'assets/images/bullet.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.fromLTRB(10, 10, 0, 05),
                                        child: Column(
                                          children: List.generate(
                                            6,
                                            (index) => Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  15, 5, 20, 5),
                                              height: 15,
                                              width:
                                                  5, // Adjust the width as needed
                                              color: MyApp.secondary,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.13,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.75,
                                        child: customText(
                                            '- Here are the top Colleges & Streams related to your Under-Graduation (UG)..',
                                            Colors.white,
                                            20.0,
                                            EdgeInsets.fromLTRB(15, 15, 0, 05),
                                            FontWeight.normal,
                                            FontStyle.normal),
                                      ),
                                      Center(
                                        child: Container(
                                          margin: EdgeInsets.all(12.0),
                                          child: SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.05,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.67,
                                            child: ElevatedButton(
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all<
                                                        Color>(MyApp.secondary),
                                                shape: MaterialStateProperty.all<
                                                        RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                )),
                                              ),
                                              onPressed: () {
                                                // String name = _textFieldController1.text;
                                                // String password = _textFieldController2.text;
                                                context.go('/aspirantsDetails',
                                                    extra: 2);
                                              },
                                              child: Row(
                                                children: [
                                                  Text(
                                                    'Recommended Colleges',
                                                    style: TextStyle(
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                  Icon(Icons.launch,
                                                      color: Colors.white,
                                                      size: 25),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding:
                                            EdgeInsets.fromLTRB(15, 15, 0, 05),
                                        child: CircleAvatar(
                                          radius: 15,
                                          child: Image.asset(
                                            'assets/images/bullet.png',
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.fromLTRB(10, 10, 0, 05),
                                        child: Column(
                                          children: List.generate(
                                            8,
                                            (index) => Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  15, 5, 20, 5),
                                              height: 15,
                                              width:
                                                  5, // Adjust the width as needed
                                              color: MyApp.secondary,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.13,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.75,
                                        child: customText(
                                            '- Skills you should develop, some Hackathons/Events to particicpate in and areas of Training yuorself....',
                                            Colors.white,
                                            18.0,
                                            EdgeInsets.fromLTRB(15, 15, 0, 05),
                                            FontWeight.normal,
                                            FontStyle.normal),
                                      ),
                                      Center(
                                        child: Container(
                                          margin: EdgeInsets.all(12.0),
                                          child: SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.05,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.67,
                                            child: ElevatedButton(
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all<
                                                        Color>(MyApp.secondary),
                                                shape: MaterialStateProperty.all<
                                                        RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                )),
                                              ),
                                              onPressed: () {
                                                // String name = _textFieldController1.text;
                                                // String password = _textFieldController2.text;
                                                context.go('/aspirantsDetails',
                                                    extra: 2);
                                              },
                                              child: Row(
                                                children: [
                                                  Text(
                                                    'More Details',
                                                    style: TextStyle(
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                  Icon(Icons.launch,
                                                      color: Colors.white,
                                                      size: 25),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Center(
                                        child: Container(
                                          margin: EdgeInsets.all(12.0),
                                          child: SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.05,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.67,
                                            child: ElevatedButton(
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all<
                                                        Color>(MyApp.secondary),
                                                shape: MaterialStateProperty.all<
                                                        RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                )),
                                              ),
                                              onPressed: () {
                                                // String name = _textFieldController1.text;
                                                // String password = _textFieldController2.text;
                                                context.go('/aspirantsDetails',
                                                    extra: 2);
                                              },
                                              child: Row(
                                                children: [
                                                  Text(
                                                    'Course recommnedation',
                                                    style: TextStyle(
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                  Icon(Icons.launch,
                                                      color: Colors.white,
                                                      size: 25),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
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
