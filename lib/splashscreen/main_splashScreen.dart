import 'dart:async';

import 'package:flutter/material.dart';
import 'package:zafram_mart/component/color.dart';
import 'package:zafram_mart/splashscreen/onboarding.dart';

class MainSplashScreen extends StatefulWidget {
  const MainSplashScreen({Key? key}) : super(key: key);

  @override
  State<MainSplashScreen> createState() => _MainSplashScreenState();
}

class _MainSplashScreenState extends State<MainSplashScreen> {
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    // Set a timer for 3 seconds
    Timer(Duration(seconds: 1), () {
      // After 1 second, set _isVisible to true to trigger the fade effect
      setState(() {
        _isVisible = true;
      });
    });
    // Set a timer for 4 seconds
    Timer(Duration(seconds: 4), () {
      // After 4 seconds, navigate to the next screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnBoarding()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AnimatedOpacity(
                    opacity: _isVisible ? 1.0 : 0.0,
                    duration: Duration(seconds: 2),
                    curve: Curves.easeInOut,
                    child: Image.asset("assets/images/zafranlogo1.png", height: 320, width: 320),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
