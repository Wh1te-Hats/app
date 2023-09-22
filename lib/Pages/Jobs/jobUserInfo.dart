import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pragati_v1/main.dart';

import '../../Widgets/customText.dart';

class jobUserInfo extends StatefulWidget {
  const jobUserInfo({super.key});

  @override
  State<jobUserInfo> createState() => _jobUserInfoState();
}

class _jobUserInfoState extends State<jobUserInfo> {

  final  jobUserInfo = List<String>.filled(3, ""); 
  String selectedItem = "FULLTIME"; // Variable to store the selected item
  List<String> items = [
    "CONTRACTOR",
    "PARTTIME",
    "FULLTIME",
    "INTERNSHIP"
  ]; // List of items

  final TextEditingController _textFieldController1 = TextEditingController();
  final TextEditingController _textFieldController2 = TextEditingController();

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
                'Enter Job Details',
                Colors.white,
                24.0,
                EdgeInsets.fromLTRB(25, 10, 28, 02),
                FontWeight.w400,
                FontStyle.normal),
            customText(
                'Role',
                Colors.white,
                22.0,
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
                    labelText: 'Role/Post you want',
                    labelStyle:
                        TextStyle(color: Colors.white38, letterSpacing: 1.3)),
              ),
            ),
            SizedBox(height: 25),
            customText(
                'Location',
                Colors.white,
                22.0,
                EdgeInsets.fromLTRB(25, 10, 248, 02),
                FontWeight.w300,
                FontStyle.normal),
            Container(
              padding: EdgeInsets.fromLTRB(25, 20, 25, 02),
              child: TextField(
                controller: _textFieldController2,
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
                    labelText: 'Preferred Location',
                    labelStyle:
                        TextStyle(color: Colors.white38, letterSpacing: 1.3)),
              ),
            ),
            SizedBox(height: 25),
            customText(
                'Type',
                Colors.white,
                22.0,
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
                  SizedBox(height: 15),
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
            SizedBox(height: 25),
            Center(
              child: Container(
                margin: EdgeInsets.all(12.0),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.075,
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
                      
                      String role = _textFieldController1.text;
                      print(role);
                      String location = _textFieldController2.text;
                      print(location);
                      String type = selectedItem;
                      print(selectedItem);

                      jobUserInfo[0]=role;
                      jobUserInfo[1]=location;
                      jobUserInfo[2]=type;

                      print(jobUserInfo);

                      context.go('/jobList', extra: jobUserInfo);
                    },
                    child: const Text(
                      'FIND JOBS',
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
