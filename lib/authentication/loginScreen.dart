import 'package:flutter/material.dart';
import 'package:zafram_mart/authentication/signUpScreen.dart';
import 'package:zafram_mart/component/color.dart';
import 'package:zafram_mart/component/my_widgtes.dart';
import 'package:zafram_mart/screen/shimmerScreen.dart';

import '../screen/bottomNavigationBar.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();

    return Scaffold(
      backgroundColor: pink,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 25),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 90,
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Image.asset("assets/images/loginpage.png",height: 270,),
                //   ],
                // ),
                Text(
                  "Log In",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Enter your emails and password",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,fontFamily: 'montserrat',
                      color: Colors.grey,
                      fontSize: 16),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Email",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,fontFamily: 'montserrat',
                      color: Colors.grey,
                      fontSize: 16),
                ),
                SizedBox(
                  height: 10,
                ),
                mytextField(
                    controller: email,
                    hintText: "email",
                    suffixIcon: Icon(
                      Icons.email,
                      color: orange,
                    )),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Password",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,fontFamily: 'montserrat',
                      color: Colors.grey,
                      fontSize: 16),
                ),
                SizedBox(
                  height: 10,
                ),
                mytextField(
                    controller: password,
                    hintText: "password",
                    obscureText: true,
                    suffixIcon: Icon(
                      Icons.password_rounded,
                      color: orange,
                    )),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Text(
                        "Fogot password",
                        style: TextStyle(fontFamily: 'montserrat',color: orange),
                      ),
                    ),

                    Container(
                      width: 150,
                      height: 45,
                      child: myButton("Login", orange, () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ShimmerScreen(),));
                      }),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "don't have and acoount? ",
                      style: TextStyle(fontFamily: 'montserrat',fontSize: 16),
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignUp(),
                              ));
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                              fontSize: 16,fontFamily: 'montserrat',
                              fontWeight: FontWeight.bold,
                              color: orange),
                        )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
