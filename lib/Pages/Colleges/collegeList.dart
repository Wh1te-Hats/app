import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../Models/college.dart';
import '../../Widgets/customText.dart';
import '../../apiService.dart';
import '../../main.dart';

class collegeList extends StatefulWidget {
  final String endpointURL;

  collegeList({required this.endpointURL});

  @override
  State<collegeList> createState() => CollegeListState();
}

var isLoaded = false;

class CollegeListState extends State<collegeList> {
  late List<college>? collegeList = [];

  void getData(String endpointURL) async {
    collegeList = (await apiCollege().getCollege(endpointURL));
    if (collegeList != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    // Access the endpointURL parameter in the initState method's body
    final String endpointURL = widget.endpointURL;
    // print(endpointURL);
    getData(endpointURL);
  }

  @override
  Widget build(BuildContext context) {
    // print(userModel![0].name);

    return WillPopScope(
      onWillPop: () async {
        context.go('/typesOfColleges');
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
            future: apiCollege().getCollege(widget.endpointURL),
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
                  children: [
                    customText(
                        'Your Top Colleges',
                        Colors.white,
                        30.0,
                        EdgeInsets.fromLTRB(20, 20, 40, 20),
                        FontWeight.bold,
                        FontStyle.normal),
                    Expanded(
                      child: ListView.builder(
                        itemCount: collegeList!.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.2,
                                margin: EdgeInsets.only(
                                    top: 10.0,
                                    bottom: 10.0,
                                    left: 25.0,
                                    right: 25.0),
                                padding: EdgeInsets.only(
                                    top: 10.0,
                                    bottom: 5.0,
                                    left: 5.0,
                                    right: 5.0),
                                width: MediaQuery.of(context).size.width * 0.86,
                                decoration: BoxDecoration(
                                  color: MyApp.primaryColor,
                                  borderRadius: BorderRadius.circular(15.0),
                                  border: Border.all(
                                    color: MyApp.secondary,
                                    width: 0.5,
                                  ),
                                ),
                                child: GestureDetector(
                                  onTap: () {},
                                  child: ListTile(
                                    leading: CircleAvatar(
                                        radius: 30,
                                        child: Image.network(
                                            collegeList![index].icon,
                                            fit: BoxFit.cover, errorBuilder:
                                                (BuildContext context,
                                                    Object error,
                                                    StackTrace? stackTrace) {
                                          // This function will be called when there is an error loading the image
                                          // You can return a fallback image or any other widget here
                                          return Image.asset(
                                            'assets/images/IIT_Madras_Logo.svg.png', // Replace with the path to your fallback image
                                            fit: BoxFit.cover,
                                          );
                                        })),
                                    title: customText(
                                      collegeList![index].name,
                                      Colors.white,
                                      20.0,
                                      EdgeInsets.fromLTRB(15, 10, 0, 0),
                                      FontWeight.bold,
                                      FontStyle.normal,
                                    ),
                                    subtitle: Row(
                                      children: [
                                        IconButton(
                                            padding:
                                                EdgeInsets.fromLTRB(0, 0, 0, 0),
                                            iconSize: 35.0,
                                            icon: const Icon(
                                                Icons.location_on_outlined),
                                            color: MyApp.secondary,
                                            onPressed: () {}),
                                        customText(
                                            "Chennai, Tamil Nadu",
                                            Colors.white,
                                            14.0,
                                            EdgeInsets.fromLTRB(0, 0, 23, 0),
                                            FontWeight.w400,
                                            FontStyle.normal),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.6,
                                margin: EdgeInsets.only(
                                    top: 0.0,
                                    bottom: 25.0,
                                    left: 25.0,
                                    right: 25.0),
                                padding: EdgeInsets.only(
                                    top: 16.0,
                                    bottom: 5.0,
                                    left: 5.0,
                                    right: 5.0),
                                width: MediaQuery.of(context).size.width * 0.86,
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
                                        EdgeInsets.fromLTRB(22, 5, 0, 10),
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
                                            'Fees',
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
                                            collegeList![index]
                                                .ranking.length>=4?collegeList![index].ranking:"#24",
                                              
                                            MyApp.secondary,
                                            20.0,
                                            EdgeInsets.fromLTRB(22, 0, 0, 20),
                                            FontWeight.bold,
                                            FontStyle.normal),
                                        customText(
                                            collegeList![index]
                                                .ranking.length>=7?collegeList![index].ranking.substring(7):"Rs 6.45Lakh",
                                            MyApp.secondary,
                                            20.0,
                                            EdgeInsets.fromLTRB(70, 0, 0, 20),
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
                                            collegeList![index].duration,
                                            MyApp.secondary,
                                            20.0,
                                            EdgeInsets.fromLTRB(22, 0, 0, 20),
                                            FontWeight.bold,
                                            FontStyle.normal),
                                        customText(
                                            collegeList![index].examAccepted,
                                            MyApp.secondary,
                                            20.0,
                                            EdgeInsets.fromLTRB(40, 0, 0, 20),
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
                                        collegeList![index].eligibility,
                                        MyApp.secondary,
                                        20.0,
                                        EdgeInsets.fromLTRB(22, 0, 152, 20),
                                        FontWeight.bold,
                                        FontStyle.normal),
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
                                              0.85,
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
                                            onPressed: () async {},
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
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                );
              }
            }),
      ),
    );
  }
}
