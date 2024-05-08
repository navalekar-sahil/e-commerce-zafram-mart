import 'package:flutter/material.dart';
import 'package:zafram_mart/authentication/loginScreen.dart';
import 'package:zafram_mart/component/color.dart';

import '../component/my_widgtes.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    TextEditingController username=TextEditingController();

    return Scaffold(
      // backgroundColor: pink,
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
                SizedBox(height: 60,),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Image.asset("assets/images/signIn.png",width: 260),
                //   ],
                // ),
                Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 24, fontFamily: 'montserrat',fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 5,),
                Text(
                  "Enter your credentials to continue",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,fontFamily: 'montserrat',
                      fontSize: 16),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Username",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,fontFamily: 'montserrat',
                      fontSize: 16),
                ),
                SizedBox(
                  height: 10,
                ),
                mytextField(controller: username, hintText: "Email or Phone Number",suffixIcon: Icon(Icons.person,color: orange,)),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Email",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,fontFamily: 'montserrat',
                      fontSize: 16),
                ),
                SizedBox(
                  height: 10,
                ),
                mytextField(controller: email, hintText: "email",suffixIcon: Icon(Icons.email,color: orange,)),
                SizedBox(
                  height: 20,
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
                    suffixIcon: Icon(Icons.password_rounded,color: orange,)),
                SizedBox(
                  height: 25,
                ),

                myButton("Sign Up", orange, () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),));
                }),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "already have an acoount? ",
                      style: TextStyle(fontFamily: 'montserrat',fontSize: 16),
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),));
                        },
                        child: Text(
                          "Log In",
                          style: TextStyle(fontSize: 16,fontFamily: 'montserrat',fontWeight: FontWeight.bold,color: orange),
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
