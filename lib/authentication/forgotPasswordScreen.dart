import 'package:flutter/material.dart';
import 'package:zafram_mart/authentication/loginScreen.dart';
import 'package:zafram_mart/component/color.dart';

import '../component/my_widgtes.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

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
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 25),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 100,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/forgotpassword.png",height: 300,),
                ],
              ),
              SizedBox(height: 50,),
              Text(
                "Forgot passworrd",
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
                height: 25,
              ),
              Text(
                "Username ",
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
                height: 25,
              ),


              myButton("Reset Password", orange, () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),));
              }),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

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
    );
  }
}
