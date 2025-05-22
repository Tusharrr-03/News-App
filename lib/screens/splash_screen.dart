import 'dart:async';
import 'package:flutter/material.dart';
import 'package:news_app_ui/screens/news_type_page.dart';
import 'home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  bool isVisible = false;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 2), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => NewsTypePage()));
    });

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();

    Timer(Duration(milliseconds: 500), () {
      setState(() {
        isVisible = true;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedOpacity(
          opacity: isVisible ? 1.0 : 0.0,
          duration: Duration(milliseconds: 500),
          child: Image.asset(
            "assets/images/newspaper.png",
            width: 120,
            height: 120,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
