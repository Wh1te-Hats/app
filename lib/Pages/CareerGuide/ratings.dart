import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pragati_v1/Widgets/customText.dart';
import 'package:pragati_v1/main.dart';

class Ratings extends StatefulWidget {
  final List<String> selectedList;
  Ratings({super.key, required this.selectedList});

  @override
  State<Ratings> createState() => _RatingsState();
}

class _RatingsState extends State<Ratings> {
  late List<String> list;

  late List<dynamic> listAndRating = [];

  Future<void> wait() async {
    // Simulate an asynchronous operation,
    await Future.delayed(const Duration(seconds: 1));
  }

  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    list = widget.selectedList;

    for (int i = 0; i < list.length; i++) {
      listAndRating.add([list[i], 0]);
    }

    return WillPopScope(
      onWillPop: () async {
        context.go('/home');
        return false;
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
                key: PageStorageKey<String>('ListViewKey'),
                controller: _scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          child: Image.asset(
                            'assets/images/profile-student.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        customText(
                            'Rank your Skills....',
                            MyApp.secondary,
                            28.0,
                            EdgeInsets.fromLTRB(20.0, 20, 20.0, 15.0),
                            FontWeight.bold,
                            FontStyle.normal),
                      ],
                    ),
                    customText(
                        'Select your proficiency with 5 stars being highest.',
                        Colors.white,
                        18.0,
                        EdgeInsets.fromLTRB(20.0, 5, 60.0, 15.0),
                        FontWeight.normal,
                        FontStyle.normal),
                    Column(
                        children: List.generate(list.length, (index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          customText(
                              list[index],
                              Colors.white,
                              24.0,
                              EdgeInsets.fromLTRB(25.0, 20, 20.0, 5.0),
                              FontWeight.normal,
                              FontStyle.normal),
                          Row(
                            children: List.generate(
                              5,
                              (i) => GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (i == listAndRating[index][1] - 1) {
                                      listAndRating[index][1] = 0;
                                    } else {
                                      listAndRating[index][1] = i + 1;
                                    }
                                  });
                                },
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(25, 5, 5, 5),
                                  child: Icon(
                                    size: 40,
                                    i < listAndRating[index][1]
                                        ? Icons.star
                                        : Icons.star_border,
                                    color: MyApp.secondary,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            thickness: 1,
                            color: MyApp.secondary,
                          )
                        ],
                      );
                    })),
                    SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: Container(
                        margin: EdgeInsets.all(12.0),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.06,
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
                              context.go('/typesOfCareer',
                                  extra: listAndRating);
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
              );
            }
          },
        ),
      ),
    );
  }
}
