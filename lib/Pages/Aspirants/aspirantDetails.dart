import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pragati_v1/Widgets/customText.dart';
import 'package:pragati_v1/main.dart';

class AspirantsDetails extends StatefulWidget {
  final int index;
  AspirantsDetails({super.key, required this.index});

  @override
  State<AspirantsDetails> createState() => _AspirantsDetailsState();
}

class _AspirantsDetailsState extends State<AspirantsDetails> {
  Future<void> wait() async {
    await Future.delayed(const Duration(seconds: 1));
  }

  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.go('/aspirantsCard');
        return false;
      },
      child: Scaffold(
        backgroundColor: MyApp.primaryColor,
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              customText(
                  'Pragati',
                  Colors.white,
                  22.0,
                  EdgeInsets.fromLTRB(10, 0, 0, 0),
                  FontWeight.bold,
                  FontStyle.normal),
            ],
          ),
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
              return Column();
            }
          },
        ),
      ),
    );
  }
}
