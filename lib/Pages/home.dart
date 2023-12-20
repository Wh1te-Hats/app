import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pragati_v1/Providers/userInfoProvider.dart';
import 'package:pragati_v1/Widgets/menu.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Widgets/customText.dart';
import '../main.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _drawerSlideController;
  late String? storedUserId;
  late String? storedName;
  late String? storedGrade;

  @override
  void initState() {
    super.initState();
    _drawerSlideController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
  }

  @override
  void dispose() {
    _drawerSlideController.dispose();
    super.dispose();
  }

  Future<void> wait() async {
    // Simulate an asynchronous operation,
    SharedPreferences prefs = await SharedPreferences.getInstance();
    storedUserId = prefs.getString('user_id');
    storedName = prefs.getString('name');
    spaceIndex = storedName!.indexOf(' ');
    storedGrade = prefs.getString('grade');
    displaySubstring =
        spaceIndex != -1 ? storedName!.substring(0, spaceIndex) : storedName!;
  }

  int spaceIndex = -1;
  String displaySubstring = "";

  bool _isDrawerOpen() {
    return _drawerSlideController.value == 1.0;
  }

  bool _isDrawerOpening() {
    return _drawerSlideController.status == AnimationStatus.forward;
  }

  bool _isDrawerClosed() {
    return _drawerSlideController.value == 0.0;
  }

  void _toggleDrawer() {
    if (_isDrawerOpen() || _isDrawerOpening()) {
      _drawerSlideController.reverse();
    } else {
      _drawerSlideController.forward();
    }
  }

  Widget _buildDrawer() {
    return AnimatedBuilder(
      animation: _drawerSlideController,
      builder: (context, child) {
        return FractionalTranslation(
          translation: Offset(1.0 - _drawerSlideController.value, 0.0),
          child: _isDrawerClosed() ? const SizedBox() : const Menu(),
        );
      },
    );
  }

  late UserInfoProvider userInfoProvider;

  @override
  Widget build(BuildContext context) {
    userInfoProvider = Provider.of<UserInfoProvider>(context);

    // Get the substring until the first space

    return WillPopScope(
      onWillPop: () async {
        context.go('/');
        return false;
      },
      child: Scaffold(
        backgroundColor: MyApp.primaryColor,
        appBar: AppBar(
          title: const Text(MyApp.title),
          actions: [
            AnimatedBuilder(
              animation: _drawerSlideController,
              builder: (context, child) {
                return IconButton(
                  padding: EdgeInsets.fromLTRB(0, 0, 30, 10),
                  iconSize: 35.0,
                  onPressed: _toggleDrawer,
                  icon: _isDrawerOpen() || _isDrawerOpening()
                      ? const Icon(
                          Icons.clear,
                          color: Colors.white,
                        )
                      : const Icon(
                          Icons.menu,
                          color: Colors.white,
                        ),
                );
              },
            ),
          ],
        ),
        body: Stack(
          children: [
            FutureBuilder<void>(
              future: wait(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // Show a loading indicator while waiting for data
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 4,
                          color: Colors.white,
                        ),
                      ),
                      customText(
                          'Loading...',
                          Colors.white,
                          28.0,
                          EdgeInsets.fromLTRB(20.0, 20, 20.0, 5.0),
                          FontWeight.bold,
                          FontStyle.normal)
                    ],
                  );
                } else if (snapshot.hasError) {
                  // Handle errors
                  return Text('Error: ${snapshot.error}');
                } else {
                  // Display data once it's loaded
                  return SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: MediaQuery.of(context).size.height * 0.18,
                          margin: EdgeInsets.only(
                              top: 11.0, bottom: 15.0, left: 21.0, right: 21.0),
                          padding: EdgeInsets.only(
                              top: 6.0, bottom: 5.0, left: 5.0, right: 5.0),
                          width: 377.0,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(10, 30, 46, 0.6),
                              borderRadius: BorderRadius.circular(15.0),
                              border: Border.all(color: MyApp.secondary)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        11, 6, 12, 20),
                                    child: CircleAvatar(
                                      radius: 35,
                                      child: Image.asset(
                                        'assets/images/student.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          customText(
                                              'Hello!',
                                              MyApp.secondary,
                                              28.0,
                                              EdgeInsets.fromLTRB(
                                                  20.0, 20, 0, 9.0),
                                              FontWeight.bold,
                                              FontStyle.normal),
                                          customText(
                                              displaySubstring,
                                              // 'Samrath Acharya',
                                              Colors.white,
                                              26.0,
                                              EdgeInsets.fromLTRB(
                                                  10.0, 20, 0, 9.0),
                                              FontWeight.w400,
                                              FontStyle.italic),
                                        ],
                                      ),
                                      customText(
                                          'Grade: ${storedGrade}',
                                          // 'Grade 10',
                                          Colors.white,
                                          22.0,
                                          EdgeInsets.fromLTRB(20.0, 2, 60, 9.0),
                                          FontWeight.w400,
                                          FontStyle.normal),
                                      customText(
                                          'User ID: ${storedUserId!.substring(0, 4)}',
                                          // 'Grade 10',
                                          Colors.white,
                                          16.0,
                                          EdgeInsets.fromLTRB(20.0, 2, 60, 9.0),
                                          FontWeight.w400,
                                          FontStyle.normal),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            SizedBox(width: 20),
                            CircleAvatar(
                              radius: 20,
                              child: Image.asset(
                                'assets/images/book-1.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            customText(
                                'Resources for You ',
                                Colors.white,
                                28.0,
                                EdgeInsets.fromLTRB(15.0, 20, 15, 10),
                                FontWeight.w400,
                                FontStyle.normal),
                          ],
                        ),
                        Divider(
                          color: MyApp.secondary,
                          thickness: 0.6,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.18,
                                  width:
                                      MediaQuery.of(context).size.width * 0.47,
                                  padding:
                                      EdgeInsets.fromLTRB(5, 5.0, 5.0, 5.0),
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              MyApp.primaryColor),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          side: BorderSide(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    onPressed: () =>
                                        context.go('/typesOfColleges'),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        customText(
                                            'COLLEGES',
                                            Colors.white,
                                            20.0,
                                            EdgeInsets.fromLTRB(0.0, 5, 5, 0.0),
                                            FontWeight.bold,
                                            FontStyle.normal),
                                        customText(
                                            'Explore different types of institutes in India.',
                                            Colors.white,
                                            14.0,
                                            EdgeInsets.fromLTRB(0.0, 0, 0, 5.0),
                                            FontWeight.normal,
                                            FontStyle.normal),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Center(
                                          child: Image.network(
                                              'https://t3.ftcdn.net/jpg/00/65/25/04/360_F_65250427_GSbg61xpzPB8ahKAuYcjKHIT6B3xiHDp.jpg',
                                              fit: BoxFit.cover,
                                              height: 50,
                                              width: 50, errorBuilder:
                                                  (BuildContext context,
                                                      Object error,
                                                      StackTrace? stackTrace) {
                                            // This function will be called when there is an error loading the image
                                            // You can return a fallback image or any other widget here
                                            return Image.asset(
                                              height: 50,
                                              width: 50,
                                              'assets/images/govt.jpg', // Replace with the path to your fallback image
                                              fit: BoxFit.cover,
                                            );
                                          }),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.18,
                                  width:
                                      MediaQuery.of(context).size.width * 0.47,
                                  padding:
                                      EdgeInsets.fromLTRB(5, 5.0, 5.0, 5.0),
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              MyApp.primaryColor),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          side: BorderSide(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    onPressed: () =>
                                        context.go('/typesOfStream'),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        customText(
                                            'STREAMS',
                                            Colors.white,
                                            20.0,
                                            EdgeInsets.fromLTRB(0.0, 5, 5, 0.0),
                                            FontWeight.bold,
                                            FontStyle.normal),
                                        customText(
                                            'Path based Courses at Secondary Level.',
                                            Colors.white,
                                            14.0,
                                            EdgeInsets.fromLTRB(0.0, 0, 5, 5.0),
                                            FontWeight.normal,
                                            FontStyle.normal),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Center(
                                          child: Image.network(
                                              'https://img.freepik.com/free-vector/school-elements-subjects-icons-set_23-2147491535.jpg?1',
                                              fit: BoxFit.cover,
                                              height: 50,
                                              width: 50, errorBuilder:
                                                  (BuildContext context,
                                                      Object error,
                                                      StackTrace? stackTrace) {
                                            // This function will be called when there is an error loading the image
                                            // You can return a fallback image or any other widget here
                                            return Image.asset(
                                              height: 50,
                                              width: 50,
                                              'assets/images/homebg.png', // Replace with the path to your fallback image
                                              fit: BoxFit.cover,
                                            );
                                          }),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Divider(
                              color: MyApp.secondary,
                              thickness: 0.6,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.18,
                                  width:
                                      MediaQuery.of(context).size.width * 0.47,
                                  padding:
                                      EdgeInsets.fromLTRB(5, 5.0, 5.0, 5.0),
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              MyApp.primaryColor),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          side: BorderSide(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    onPressed: () => context.go('/jobUserInfo'),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        customText(
                                            'JOBS',
                                            Colors.white,
                                            20.0,
                                            EdgeInsets.fromLTRB(0.0, 5, 5, 0.0),
                                            FontWeight.bold,
                                            FontStyle.normal),
                                        customText(
                                            'Opportunities based on your choices & location.',
                                            Colors.white,
                                            14.0,
                                            EdgeInsets.fromLTRB(0.0, 0, 5, 5.0),
                                            FontWeight.normal,
                                            FontStyle.normal),
                                        Center(
                                          child: Image.asset(
                                            height: 50,
                                            width: 50,
                                            'assets/images/jobs-3.png', // Replace with the path to your fallback image
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.18,
                                  width:
                                      MediaQuery.of(context).size.width * 0.47,
                                  padding:
                                      EdgeInsets.fromLTRB(5, 5.0, 5.0, 5.0),
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              MyApp.primaryColor),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          side: BorderSide(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    onPressed: () =>
                                        context.go('/typesOfExams'),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        customText(
                                            'EXAMS',
                                            Colors.white,
                                            20.0,
                                            EdgeInsets.fromLTRB(0.0, 5, 5, 0.0),
                                            FontWeight.bold,
                                            FontStyle.normal),
                                        customText(
                                            'Govt, National & State Level details and Materials',
                                            Colors.white,
                                            14.0,
                                            EdgeInsets.fromLTRB(0.0, 5, 0, 0.0),
                                            FontWeight.normal,
                                            FontStyle.normal),
                                        Center(
                                          child: Image.network(
                                              'https://cdn.iconscout.com/icon/premium/png-256-thumb/exam-3467501-2901473.png',
                                              fit: BoxFit.cover,
                                              height: 50,
                                              width: 50, errorBuilder:
                                                  (BuildContext context,
                                                      Object error,
                                                      StackTrace? stackTrace) {
                                            // This function will be called when there is an error loading the image
                                            // You can return a fallback image or any other widget here
                                            return Image.asset(
                                              height: 50,
                                              width: 50,
                                              'assets/images/homebg2.png', // Replace with the path to your fallback image
                                              fit: BoxFit.cover,
                                            );
                                          }),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Divider(
                              color: MyApp.secondary,
                              thickness: 0.6,
                            ),
                            // SizedBox(
                            //   height: 10,
                            // ),
                            // Container(
                            //   height: MediaQuery.of(context).size.height * 0.7,
                            //   width: MediaQuery.of(context).size.width * 0.98,
                            //   padding:
                            //       EdgeInsets.fromLTRB(15, 15.0, 15.0, 15.0),
                            //   child: ElevatedButton(
                            //     style: ButtonStyle(
                            //       backgroundColor:
                            //           MaterialStateProperty.all<Color>(
                            //               MyApp.primaryColor),
                            //       shape: MaterialStateProperty.all<
                            //           RoundedRectangleBorder>(
                            //         RoundedRectangleBorder(
                            //           borderRadius: BorderRadius.circular(10),
                            //           side: BorderSide(color: Colors.white),
                            //         ),
                            //       ),
                            //     ),
                            //     onPressed: () => context.go('/jobUserInfo'),
                            //     child: Row(
                            //       mainAxisAlignment: MainAxisAlignment.start,
                            //       children: [
                            //         customText(
                            //             'About ',
                            //             Colors.white,
                            //             28.0,
                            //             EdgeInsets.fromLTRB(4.0, 5, 5, 5.0),
                            //             FontWeight.bold,
                            //             FontStyle.normal),
                            //         CircleAvatar(
                            //           radius: 20,
                            //           child: Image.asset(
                            //             'assets/images/info-1.png',
                            //             fit: BoxFit.cover,
                            //           ),
                            //         ),
                            //       ],
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
            _buildDrawer()
          ],
        ),
        floatingActionButton: Container(
          margin: EdgeInsets.fromLTRB(0, 0, 5, 10),
          child: FloatingActionButton(
            onPressed: () {
              // Open the chatbot conversation page here
              context.go('/chatbot');
            },
            child: CircleAvatar(
              radius: 35,
              child: Image.asset(
                'assets/images/chatbot.png',
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        bottomNavigationBar: MyBottomNavigationBar(
          selectedIndex: 2,
        ),
      ),
    );
  }
}

class MyBottomNavigationBar extends StatefulWidget {
  final int selectedIndex;

  MyBottomNavigationBar({Key? key, required this.selectedIndex})
      : super(key: key);

  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: MyApp.primaryColor,
      type: BottomNavigationBarType.fixed,
      currentIndex: selectedIndex,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white,
      showUnselectedLabels: true,
      items: [
        _buildBottomNavigationBarItem(
            'assets/images/aspirants.png', 'Aspirants', 0),
        _buildBottomNavigationBarItem(
            'assets/images/career-2.png', 'Careers', 1),
        _buildBottomNavigationBarItem('assets/images/home.png', 'Home', 2),
        _buildBottomNavigationBarItem('assets/images/test-1.png', 'Tests', 3),
        _buildBottomNavigationBarItem(
            'assets/images/dashboard.png', 'Dashboard', 4),
      ],
      onTap: (index) {
        // Handle button taps here
        print('Button tapped: $index');
        setState(() {
          selectedIndex = index;
          if (selectedIndex == 4) {
            context.go('/dashboard');
          } else if (selectedIndex == 0) {
            context.go('/intropage');
          } else if (selectedIndex == 1) {
            context.go('/skills');
          } else if (selectedIndex == 3) {
            context.go('/aptitudeHome');
          }
        });
      },
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(
      String imagePath, String label, int index) {
    final bool isSelected = selectedIndex == index;
    return BottomNavigationBarItem(
      icon: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isSelected ? Colors.white : MyApp.primaryColor,
            border: Border.all(
              color: isSelected ? MyApp.secondary : Colors.transparent,
              width: 5.0,
            ),
          ),
          padding: EdgeInsets.all(8),
          child: Image.asset(
            height: 30,
            width: 30,
            imagePath,
            // Replace with the path to your fallback image
            fit: BoxFit.cover,
          )),
      label: label,
    );
  }
}
