import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pragati_v1/Models/college.dart';
import '../../Widgets/customText.dart';
import '../../main.dart';

class CollegeInfoPage extends StatefulWidget {
  final college collegeInfo;

  CollegeInfoPage({super.key, required this.collegeInfo});

  @override
  State<CollegeInfoPage> createState() => _CollegeInfoPageState();
}

class _CollegeInfoPageState extends State<CollegeInfoPage> {
  @override
  Widget build(BuildContext context) {
    college info = widget.collegeInfo;
    // Color secondaryColor = Theme.of(context).colorScheme.secondary;
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
                child: Image.network(info.icon, fit: BoxFit.cover, errorBuilder:
                    (BuildContext context, Object error,
                        StackTrace? stackTrace) {
                  // This function will be called when there is an error loading the image
                  // You can return a fallback image or any other widget here
                  return Image.asset(
                    'assets/images/IIT_Madras_Logo.svg.png', // Replace with the path to your fallback image
                    fit: BoxFit.cover,
                  );
                }),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  customText(
                      info.name,
                      Colors.white,
                      24.0,
                      EdgeInsets.fromLTRB(31, 27, 31, 12),
                      FontWeight.bold,
                      FontStyle.normal),
                  Row(
                    children: [
                      IconButton(
                        padding: EdgeInsets.fromLTRB(124, 0, 0, 0),
                        iconSize: 27,
                        icon: const Icon(Icons.location_on_outlined),
                        color: MyApp.secondary,
                        onPressed: () {},
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
