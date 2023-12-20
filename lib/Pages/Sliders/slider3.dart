import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pragati_v1/main.dart';

class Slider3 extends StatefulWidget {
  const Slider3({super.key});

  @override
  State<Slider3> createState() => _Slider3State();
}

class _Slider3State extends State<Slider3> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).go('/signin');
      },
      child: Scaffold(
        backgroundColor: MyApp.primaryColor,
        body: Center(
          child: Container(
            child: Image.asset(
                "assets/images/Slider.png"), // Display your splash image
          ),
        ),
      ),
    );
  }
}
