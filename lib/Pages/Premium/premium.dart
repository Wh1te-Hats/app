import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pragati_v1/main.dart';

class PremiumPage extends StatelessWidget {
  Future<void> wait() async {
    await Future.delayed(const Duration(seconds: 1));
  }

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
                return Container( decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/aboutPage.png"),
            fit: BoxFit.fill,
          ),
        ),);
              }
            },
          ),
        ),
      ),
    );
  }
}
