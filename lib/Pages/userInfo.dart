import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../Widgets/customText.dart';
import '../main.dart';

class UserInfoPage extends StatefulWidget {
  const UserInfoPage({Key? key}) : super(key: key);

  @override
  State<UserInfoPage> createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  String selectedItem = "CBSE"; // Variable to store the selected item
  List<String> items = [
    "CBSE",
    "ICSE",
    "Karnataka Board",
    "Maharashtra Board",
    "Cambridge Board"
  ]; // List of items

  final TextEditingController _textFieldController1 = TextEditingController();
  final TextEditingController _textFieldController2 = TextEditingController();

  List<bool> isSelectedGrade = [true, false, false, false];
  List<bool> isSelectedPurpose = [true, false, false];

  @override
  Widget build(BuildContext context) {
    // Color secondaryColor = Theme.of(context).colorScheme.secondary;
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            customText(
                'User Details',
                Colors.white,
                24.0,
                EdgeInsets.fromLTRB(25, 10, 28, 02),
                FontWeight.w400,
                FontStyle.normal),
            customText(
                'Name',
                Colors.white,
                20.0,
                EdgeInsets.fromLTRB(25, 20, 48, 02),
                FontWeight.w300,
                FontStyle.normal),
            Padding(
              padding: EdgeInsets.fromLTRB(25, 20, 25, 10),
              child: TextField(
                controller: _textFieldController1,
                style: TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: MyApp.secondary, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: MyApp.secondary),
                    ),
                    filled: true,
                    fillColor: Color.fromARGB(99, 18, 37, 53),
                    labelText: 'Name',
                    labelStyle:
                        TextStyle(color: Colors.white38, letterSpacing: 1.3)),
              ),
            ),
            customText(
                'Password',
                Colors.white,
                20.0,
                EdgeInsets.fromLTRB(25, 10, 248, 02),
                FontWeight.w300,
                FontStyle.normal),
            Container(
              padding: EdgeInsets.fromLTRB(25, 20, 25, 02),
              child: TextField(
                controller: _textFieldController2,
                obscureText: true,
                style: TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: MyApp.secondary, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: MyApp.secondary),
                    ),
                    filled: true,
                    fillColor: Color.fromARGB(99, 18, 37, 53),
                    labelText: 'Password',
                    labelStyle:
                        TextStyle(color: Colors.white38, letterSpacing: 1.3)),
              ),
            ),
            customText(
                'Board',
                Colors.white,
                20.0,
                EdgeInsets.fromLTRB(25, 20, 248, 02),
                FontWeight.w300,
                FontStyle.normal),
            Container(
              height: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.height * 0.95,
              margin: EdgeInsets.fromLTRB(25, 10, 25, 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(
                  color: MyApp.secondary, // Border color
                  width: 1.0, // Border width
                ),
              ),
              padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Selected Option: ${selectedItem}',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  Padding(padding: EdgeInsets.fromLTRB(5, 05, 5, 10)),
                  // Text(
                  //   selectedItem,
                  //   style: TextStyle(
                  //       fontSize: 24,
                  //       fontWeight: FontWeight.bold,
                  //       color: Colors.white),
                  // ),
                  SizedBox(height: 5),
                  DropdownButton<String>(
                    value: selectedItem, // The selected item from the list
                    items: items.map((String item) {
                      return DropdownMenuItem<String>(
                        value: item, // Each item has a unique value
                        child: Text(
                          item,
                          style:
                              TextStyle(fontSize: 20, color: MyApp.secondary),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedItem = newValue!; // Update the selected item
                      });
                    },
                  ),
                ],
              ),
            ),

            customText(
              'Select your Grade',
              Colors.white,
              20.0,
              EdgeInsets.fromLTRB(25, 10, 8, 02),
              FontWeight.w300,
              FontStyle.normal,
            ),
            Container(
              decoration: BoxDecoration(
                color: MyApp.primaryColor,
              ),
              margin: EdgeInsets.only(
                  top: 20.0, bottom: 20, left: 22.0, right: 25.0),
              padding: EdgeInsets.all(0.0),
              child: ToggleButtons(
                borderRadius: BorderRadius.circular(10),
                borderWidth: 15,
                direction: Axis.horizontal,
                isSelected: isSelectedGrade,
                fillColor: MyApp.secondary,
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.height * 0.05,
                    margin: EdgeInsets.all(12.0),
                    padding: EdgeInsets.only(
                        top: 1.0, bottom: 1.0, left: 1.0, right: 1.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Color.fromRGBO(10, 30, 46, 1.0),
                      boxShadow: [
                        BoxShadow(
                          color: MyApp.secondary,
                          spreadRadius: 2.0,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        '9',
                        style: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontSize: 24.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.height * 0.05,
                    margin: EdgeInsets.all(12.0),
                    padding: EdgeInsets.only(
                        top: 1.0, bottom: 1.0, left: 1.0, right: 1.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Color.fromRGBO(10, 30, 46, 1.0),
                      boxShadow: [
                        BoxShadow(
                          color: MyApp.secondary,
                          spreadRadius: 2.0,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        '10',
                        style: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontSize: 24.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.height * 0.05,
                    margin: EdgeInsets.all(12.0),
                    padding: EdgeInsets.only(
                        top: 1.0, bottom: 1.0, left: 1.0, right: 1.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Color.fromRGBO(10, 30, 46, 1.0),
                      boxShadow: [
                        BoxShadow(
                          color: MyApp.secondary,
                          spreadRadius: 2.0,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        '11',
                        style: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontSize: 24.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.height * 0.05,
                    margin: EdgeInsets.all(12.0),
                    padding: EdgeInsets.only(
                        top: 1.0, bottom: 1.0, left: 1.0, right: 1.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Color.fromRGBO(10, 30, 46, 1.0),
                      boxShadow: [
                        BoxShadow(
                          color: MyApp.secondary,
                          spreadRadius: 2.0,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        '12',
                        style: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontSize: 24.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ],
                onPressed: (int newIndex) {
                  setState(() {
                    for (int i = 0; i < isSelectedGrade.length; i++) {
                      if (i == newIndex) {
                        isSelectedGrade[i] = true;
                      } else {
                        isSelectedGrade[i] = false;
                      }
                    }
                  });
                },
              ),
            ),
            //  SELECT YOUR PURPOSE OF USE :
            // customText(
            //   'Select your purpose of use',
            //   Colors.white,
            //   24.0,
            //   EdgeInsets.fromLTRB(25, 32, 28, 02),
            //   FontWeight.w300,
            //   FontStyle.normal,
            // ),
            // Container(
            //   height: MediaQuery.of(context).size.height * 0.48,
            //   width: MediaQuery.of(context).size.width * 0.8,
            //   decoration: BoxDecoration(
            //     color: MyApp.primaryColor,
            //   ),
            //   margin: EdgeInsets.only(
            //       top: 20.0, bottom: 20.0, left: 22.0, right: 25.0),
            //   padding: EdgeInsets.all(0.0),
            //   child: ToggleButtons(
            //     borderRadius: BorderRadius.circular(10),
            //     borderWidth: 15,
            //     direction: Axis.vertical,
            //     isSelected: isSelectedPurpose,
            //     fillColor: MyApp.secondary,
            //     children: <Widget>[
            //       Container(
            //         height: MediaQuery.of(context).size.height * 0.1,
            //         width: MediaQuery.of(context).size.height * 0.3,
            //         margin: EdgeInsets.all(12.0),
            //         padding: EdgeInsets.only(
            //             top: 1.0, bottom: 1.0, left: 1.0, right: 1.0),
            //         decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(10),
            //           color: Color.fromRGBO(10, 30, 46, 1.0),
            //           boxShadow: [
            //             BoxShadow(
            //               color: MyApp.secondary,
            //               spreadRadius: 2.0,
            //             ),
            //           ],
            //         ),
            //         child: Center(
            //           child: Text(
            //             'Purpose Type 1',
            //             style: TextStyle(
            //                 fontStyle: FontStyle.normal,
            //                 fontSize: 20.0,
            //                 fontWeight: FontWeight.w400,
            //                 color: Colors.white),
            //           ),
            //         ),
            //       ),
            //       Container(
            //         height: MediaQuery.of(context).size.height * 0.1,
            //         width: MediaQuery.of(context).size.height * 0.3,
            //         margin: EdgeInsets.all(12.0),
            //         padding: EdgeInsets.only(
            //             top: 1.0, bottom: 1.0, left: 1.0, right: 1.0),
            //         decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(10),
            //           color: Color.fromRGBO(10, 30, 46, 1.0),
            //           boxShadow: [
            //             BoxShadow(
            //               color: MyApp.secondary,
            //               spreadRadius: 2.0,
            //             ),
            //           ],
            //         ),
            //         child: Center(
            //           child: Text(
            //             'Purpose Type 2',
            //             style: TextStyle(
            //                 fontStyle: FontStyle.normal,
            //                 fontSize: 20.0,
            //                 fontWeight: FontWeight.w400,
            //                 color: Colors.white),
            //           ),
            //         ),
            //       ),
            //       Container(
            //         height: MediaQuery.of(context).size.height * 0.1,
            //         width: MediaQuery.of(context).size.height * 0.3,
            //         margin: EdgeInsets.all(12.0),
            //         padding: EdgeInsets.only(
            //             top: 1.0, bottom: 1.0, left: 1.0, right: 1.0),
            //         decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(10),
            //           color: Color.fromRGBO(10, 30, 46, 1.0),
            //           boxShadow: [
            //             BoxShadow(
            //               color: MyApp.secondary,
            //               spreadRadius: 2.0,
            //             ),
            //           ],
            //         ),
            //         child: Center(
            //           child: Text(
            //             'Purpose Type 3',
            //             style: TextStyle(
            //                 fontStyle: FontStyle.normal,
            //                 fontSize: 20.0,
            //                 fontWeight: FontWeight.w400,
            //                 color: Colors.white),
            //           ),
            //         ),
            //       ),
            //     ],
            //     onPressed: (int newIndex2) {
            //       setState(() {
            //         for (int i = 0; i < isSelectedPurpose.length; i++) {
            //           if (i == newIndex2) {
            //             isSelectedPurpose[i] = true;
            //           } else {
            //             isSelectedPurpose[i] = false;
            //           }
            //         }
            //       });
            //     },
            //   ),
            // ),

            // customText(
            //     'Location',
            //     Colors.white,
            //     24.0,
            //     EdgeInsets.fromLTRB(25, 20, 248, 02),
            //     FontWeight.w300,
            //     FontStyle.normal),
            // Padding(
            //   padding: EdgeInsets.fromLTRB(25, 20, 25, 02),
            //   child: TextField(
            //     style: TextStyle(
            //       color: Colors.white,
            //     ),
            //     decoration: InputDecoration(
            //         enabledBorder: OutlineInputBorder(
            //           borderRadius: BorderRadius.circular(10),
            //           borderSide: BorderSide(color: MyApp.secondary, width: 1),
            //         ),
            //         focusedBorder: OutlineInputBorder(
            //           borderRadius: BorderRadius.circular(10),
            //           borderSide: BorderSide(color: MyApp.secondary),
            //         ),
            //         filled: true,
            //         fillColor: Color.fromARGB(99, 18, 37, 53),
            //         labelText: 'Location',
            //         labelStyle:
            //             TextStyle(color: Colors.white38, letterSpacing: 1.3)),
            //   ),
            // ),
            // customText(
            //     'Interested Subjects',
            //     Colors.white,
            //     24.0,
            //     EdgeInsets.fromLTRB(25, 20, 28, 02),
            //     FontWeight.w300,
            //     FontStyle.normal),
            // Container(
            //   height: MediaQuery.of(context).size.height * 0.06,
            //   width: MediaQuery.of(context).size.width * 0.90,
            //   margin: EdgeInsets.only(
            //       top: 25.0, bottom: 16.0, left: 25.0, right: 20.0),
            //   padding:
            //       EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
            //   decoration: BoxDecoration(
            //     // color: Color.fromRGBO(10, 30, 46, .95),
            //     color: Colors.white,
            //     borderRadius: BorderRadius.circular(10.0),
            //     boxShadow: [
            //       BoxShadow(
            //         color: MyApp.secondary,
            //         spreadRadius: 3.0,
            //       ),
            //     ],
            //   ),
            // ),

            Center(
              child: Container(
                margin: EdgeInsets.all(12.0),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(MyApp.secondary),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                    ),
                    onPressed: () {
                      // String name = _textFieldController1.text;
                      // String password = _textFieldController2.text;
                      context.go('/home');
                    },
                    child: const Text(
                      'Continue',
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
    );
  }
}
