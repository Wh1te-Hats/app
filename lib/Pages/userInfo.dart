import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pragati_v1/Providers/userInfoProvider.dart';
import 'package:pragati_v1/Providers/userProvider.dart';
import 'package:pragati_v1/apiService.dart';
import 'package:provider/provider.dart';
import '../Widgets/customText.dart';
import '../main.dart';

class UserInfoPage extends StatefulWidget {
  const UserInfoPage({Key? key}) : super(key: key);

  @override
  State<UserInfoPage> createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  String selectedGender = "Male";
  String selectedGrade = "9";

  String selectedItem = "CBSE"; // Variable to store the selected item
  List<String> items = [
    "CBSE",
    "ICSE",
    "Karnataka Board",
    "Maharashtra Board",
    "Cambridge Board"
  ];

  final TextEditingController _textFieldController1 = TextEditingController();
  final TextEditingController _textFieldController2 = TextEditingController();
  final TextEditingController _textFieldController3 = TextEditingController();

  List<bool> isSelectedGrade = [true, false, false, false];
  List<bool> isSelectedGender = [true, false];

  late UserInfoProvider userInfoProvider;
  late UserProvider userProvider;

  @override
  Widget build(BuildContext context) {
    userProvider = Provider.of<UserProvider>(context);
    userInfoProvider = UserInfoProvider();
    // Color secondaryColor = Theme.of(context).colorScheme.secondary;
    return WillPopScope(
      onWillPop: () async {
        context.go('/welcome');
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
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
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
                  padding: EdgeInsets.fromLTRB(25, 10, 25, 20),
                  child: TextField(
                    cursorColor: Colors.white,
                    controller: _textFieldController1,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: MyApp.secondary, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: MyApp.secondary),
                        ),
                        filled: true,
                        fillColor: Color.fromARGB(99, 18, 37, 53),
                        labelText: 'Name',
                        labelStyle: TextStyle(
                            color: Colors.white38, letterSpacing: 1.3)),
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
                      top: 10.0, bottom: 20, left: 22.0, right: 25.0),
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
                          if (newIndex == i) {
                            int grade = i + 9;
                            selectedGrade = "$grade";
                          }

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
                customText(
                  'Select your Gender',
                  Colors.white,
                  20.0,
                  EdgeInsets.fromLTRB(25, 10, 8, 0),
                  FontWeight.w300,
                  FontStyle.normal,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: MyApp.primaryColor,
                  ),
                  margin: EdgeInsets.only(
                      top: 10.0, bottom: 20, left: 22.0, right: 20.0),
                  padding: EdgeInsets.all(0.0),
                  child: ToggleButtons(
                    borderRadius: BorderRadius.circular(10),
                    borderWidth: 15,
                    direction: Axis.horizontal,
                    isSelected: isSelectedGender,
                    fillColor: MyApp.secondary,
                    children: <Widget>[
                      Container(
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.height * 0.15,
                        margin: EdgeInsets.all(12.0),
                        padding: EdgeInsets.only(
                            top: 1.0, bottom: 1.0, left: 1.0, right: 1.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
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
                            'Male',
                            style: TextStyle(
                                fontFamily: "Aeonik",
                                fontStyle: FontStyle.normal,
                                fontSize: 24.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.height * 0.15,
                        margin: EdgeInsets.all(12.0),
                        padding: EdgeInsets.only(
                            top: 1.0, bottom: 1.0, left: 1.0, right: 1.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
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
                            'Female',
                            style: TextStyle(
                                fontFamily: "Aeonik",
                                fontStyle: FontStyle.normal,
                                fontSize: 24.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                    onPressed: (int newIndex) {
                      setState(() {
                        for (int i = 0; i < isSelectedGender.length; i++) {
                          if (newIndex == 0) {
                            selectedGender = "Male";
                          } else {
                            selectedGender = "Female";
                          }

                          if (i == newIndex) {
                            isSelectedGender[i] = true;
                          } else {
                            isSelectedGender[i] = false;
                          }
                        }
                      });
                    },
                  ),
                ),
                customText(
                    'City',
                    Colors.white,
                    20.0,
                    EdgeInsets.fromLTRB(25, 10, 248, 02),
                    FontWeight.w300,
                    FontStyle.normal),
                Container(
                  padding: EdgeInsets.fromLTRB(25, 10, 25, 17),
                  child: TextField(
                    cursorColor: Colors.white,
                    controller: _textFieldController2,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: MyApp.secondary, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: MyApp.secondary),
                        ),
                        filled: true,
                        fillColor: Color.fromARGB(99, 18, 37, 53),
                        labelText: 'CITY',
                        labelStyle: TextStyle(
                            color: Colors.white38, letterSpacing: 1.3)),
                  ),
                ),
                customText(
                    'State',
                    Colors.white,
                    20.0,
                    EdgeInsets.fromLTRB(25, 10, 248, 02),
                    FontWeight.w300,
                    FontStyle.normal),
                Container(
                  padding: EdgeInsets.fromLTRB(25, 10, 25, 5),
                  child: TextField(
                    cursorColor: Colors.white,
                    controller: _textFieldController3,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: MyApp.secondary, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: MyApp.secondary),
                        ),
                        filled: true,
                        fillColor: Color.fromARGB(99, 18, 37, 53),
                        labelText: 'STATE',
                        labelStyle: TextStyle(
                            color: Colors.white38, letterSpacing: 1.3)),
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
                  margin: EdgeInsets.fromLTRB(25, 10, 25, 20),
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
                        'Selected: ${selectedItem}',
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
                              style: TextStyle(
                                  fontSize: 20, color: MyApp.secondary),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedItem =
                                newValue!; // Update the selected item
                          });
                        },
                      ),
                    ],
                  ),
                ),
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
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
                        ),
                        onPressed: () async {
                          userInfoProvider.name = _textFieldController1;
                          userInfoProvider.city = _textFieldController3;
                          userInfoProvider.state = _textFieldController3;
                          userInfoProvider.grade = selectedGrade;
                          userInfoProvider.gender = selectedGender;
                          userInfoProvider.board = selectedItem;
                          await apiCollege().postUserInfo(
                              userInfoProvider, userProvider.userId);

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
        ),
      ),
    );
  }
}
