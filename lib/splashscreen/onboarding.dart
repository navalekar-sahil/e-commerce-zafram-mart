import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:zafram_mart/authentication/signIn.dart';
import 'package:zafram_mart/component/color.dart';
import 'package:zafram_mart/component/my_widgtes.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2000),
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset(-1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    // Start the animation when the widget is initialized
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Image.asset(
                      "assets/images/zafranlogo1.png",
                      width: 230,
                    ),
                    Text(
                      "Get your groceries \nwith Zafran",
                      style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600,fontFamily: 'montserrat'),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    SlideTransition(
                      position: _slideAnimation,
                      child: Image.asset(
                        "assets/images/onbord.png",
                        width: 240,
                      ),
                    ),
                    myButton("Get Started", orange, () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn()));
                    }),
                  ],
                ),
              ),
            )
          ],
        )
    );
  }
}
