import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zafram_mart/authentication/forgotPasswordScreen.dart';
import 'package:zafram_mart/authentication/signIn.dart';
import 'package:zafram_mart/component/color.dart';
import 'package:zafram_mart/screen/bottomNavigationBar.dart';
import 'package:zafram_mart/splashscreen/main_splashScreen.dart';
import 'package:zafram_mart/splashscreen/onboarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Set system overlay style
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Set status bar color to transparent
    ));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: appbarColor),
        primaryColor: appbarColor,
      ),
      home: MainSplashScreen(),
    );
  }
}
