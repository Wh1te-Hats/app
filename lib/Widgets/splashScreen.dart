import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pragati_v1/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
// Import the actual screen

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeInAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2), // Adjust the duration as needed
    );

    _fadeInAnimation = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1.0),
          weight: 1.0,
        ),
      ],
    ).animate(_controller);

    _controller.forward();
    _checkLoggedInUser();

  }

  Future<void> _checkLoggedInUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('user_id');

    if (userId != null) {
      Timer(Duration(seconds: 2), () {
      GoRouter.of(context)
          .go('/home'); // Navigate to your actual screen using go_router
    });
    }
    else{
      Timer(Duration(seconds: 2), () {
      GoRouter.of(context)
          .go('/slider1'); // Navigate to your actual screen using go_router
    });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyApp.primaryColor,
      body: Center(
        child: FadeTransition(
          opacity: (_fadeInAnimation),
          child: Image.asset(
              "assets/images/splash.png"), // Display your splash image
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
