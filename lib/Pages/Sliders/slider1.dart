import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pragati_v1/main.dart';

class Slider1 extends StatefulWidget {
  const Slider1({super.key});

  @override
  State<Slider1> createState() => _Slider1State();
}

class _Slider1State extends State<Slider1> {
  @override
   Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        GoRouter.of(context)
          .go('/slider2'); 
      },
      child: Scaffold(
        backgroundColor: MyApp.primaryColor,
        body: Center(
          child: Container(
            child: Image.asset(
                "assets/images/Slider1.png"), // Display your splash image
          ),
        ),
      ),
    );
  }
}