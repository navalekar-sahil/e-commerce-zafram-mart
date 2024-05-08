import 'package:flutter/material.dart';
import 'package:zafram_mart/authentication/otp_verification.dart';
import 'package:zafram_mart/component/color.dart';
import 'package:zafram_mart/component/my_widgtes.dart';
import 'package:zafram_mart/screen/bottomNavigationBar.dart';
import 'package:zafram_mart/screen/shimmerScreen.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    _slideAnimation = Tween<Offset>(
      begin: Offset(0, -1.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
    _controller.forward();
    // setState(() {
    //
    // });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return SlideTransition(
            position: _slideAnimation,
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 60,
                      height: 60,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => ShimmerScreen()),
                          );
                        },
                        child: Text(
                          "Skip",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'montserrat',
                            fontSize: 17,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 300),
                  Text(
                    "Login Account",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'montserrat',
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Hello, welcome to zafran mart",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'montserrat',
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 50),
                  countryCode_TextField(),
                  SizedBox(height: 23),
                  myButton("Request OTP", orange, () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => OtpVerification()));
                  }),
                  SizedBox(height: 23),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 45,
                          child: Image.asset("assets/images/googl.png", height: 40),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Not registered yet? ",
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontFamily: 'montserrat',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          "Create an account ",
                          style: TextStyle(
                            color: darkBlue,
                            fontFamily: 'montserrat',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
