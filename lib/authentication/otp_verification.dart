import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zafram_mart/authentication/locationScreen.dart';
import 'package:zafram_mart/component/color.dart';
import 'package:zafram_mart/component/my_widgtes.dart';

class OtpVerification extends StatefulWidget {
  const OtpVerification({super.key});

  @override
  State<OtpVerification> createState() => _OtpverificationState();
}

class _OtpverificationState extends State<OtpVerification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            color: pink,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 25),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 130,
                    ),
                    Image.asset(
                      "assets/images/opt.png",
                      height: 280,
                      width: 300,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Verification  Code",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,fontFamily: 'montserrat',
                          fontSize: 26,
                          color: Colors.black87),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "We have sent verification code to \nYour mobile number",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,fontFamily: 'montserrat',
                          fontSize: 17,
                          color: Colors.grey),
                    ),
                    SizedBox(
                      height: 17,
                    ),
                    Text(
                      "+91 1231231212",
                      style: TextStyle(
                          color: blue,fontFamily: 'montserrat',
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 35,
                    ),

                    //boxes
                    Form(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 64,
                          width: 64,
                          child: Container(

                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(30)
                            ),
                            child: TextField(
                              autofocus: true,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(

                                      borderSide: BorderSide.none
                                  )
                              ),
                              onChanged: (value) {
                                if(value.length==1){
                                  FocusScope.of(context).nextFocus();
                                }
                              },

                              style:TextStyle(

                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,

                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 64,
                          width: 64,
                          child: Container(

                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(30)
                            ),
                            child: TextField(

                              decoration: InputDecoration(
                                  border: OutlineInputBorder(

                                      borderSide: BorderSide.none
                                  )
                              ),
                              onChanged: (value) {
                                if(value.length==1){
                                  FocusScope.of(context).nextFocus();
                                }
                              },

                              style:TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,

                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 64,
                          width: 64,
                          child: Container(

                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(30)
                            ),
                            child: TextField(

                              decoration: InputDecoration(
                                  border: OutlineInputBorder(

                                      borderSide: BorderSide.none
                                  )
                              ),
                              onChanged: (value) {
                                if(value.length==1){
                                  FocusScope.of(context).nextFocus();
                                }
                              },

                              style:TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,

                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 64,
                          width: 64,
                          child: Container(

                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(30)
                            ),
                            child: TextField(

                              decoration: InputDecoration(
                                  border: OutlineInputBorder(

                                      borderSide: BorderSide.none
                                  )
                              ),
                              onChanged: (value) {
                                if(value.length==1){
                                  FocusScope.of(context).nextFocus();
                                }
                              },

                              style:TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,

                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 64,
                          width: 64,
                          child: Container(

                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(30)
                            ),
                            child: TextField(

                              decoration: InputDecoration(
                                  border: OutlineInputBorder(

                                      borderSide: BorderSide.none
                                  )
                              ),
                              onChanged: (value) {
                                if(value.length==1){
                                  FocusScope.of(context).nextFocus();
                                }
                              },

                              style:TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,

                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly
                              ],
                            ),
                          ),
                        ),
                      ],
                    )),
                    SizedBox(
                      height: 35,
                    ),
                    myButton("Submit", orange, () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Location(),));
                    })
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
