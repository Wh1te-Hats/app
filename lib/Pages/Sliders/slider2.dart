import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pragati_v1/main.dart';

class Slider2 extends StatefulWidget {
  const Slider2({super.key});

  @override
  State<Slider2> createState() => _Slider2State();
}

class _Slider2State extends State<Slider2> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).go('/slider3');
      },
      child: Scaffold(
        backgroundColor: MyApp.primaryColor,
        body: Center(
          child: Container(
            child: Image.asset(
                "assets/images/Slider2.png"), // Display your splash image
          ),
        ),
      ),
    );
  }
}
