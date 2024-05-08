import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:zafram_mart/SystemScreen/DeliveryAddressScreen.dart';
import 'package:zafram_mart/SystemScreen/couponsScreen.dart';
import 'package:zafram_mart/SystemScreen/helpScreen.dart';
import 'package:zafram_mart/SystemScreen/notificationScreen.dart';
import 'package:zafram_mart/SystemScreen/settingsScreen.dart';
import 'package:zafram_mart/authentication/forgotPasswordScreen.dart';
import 'package:zafram_mart/authentication/loginScreen.dart';
import 'package:zafram_mart/authentication/signUpScreen.dart';
import 'package:zafram_mart/component/color.dart';
import 'package:zafram_mart/component/my_widgtes.dart';
import 'package:zafram_mart/screen/OrderTrackScreen.dart';
import 'package:zafram_mart/SystemScreen/aboutScreen.dart';
import 'package:zafram_mart/screen/addToCartScreen.dart';
import 'package:zafram_mart/screen/myAccountScreen.dart';

import 'favoriteScreen.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: pink,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: appbarColor,
        toolbarHeight: 70,
        // centerTitle: true,
        title: Text(
          "My Account",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'montserrat',
            // color: Colors.grey[600]
          ),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddToCard(),
                      ));
                },
                child: myCart()),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyAccount(
                          name: "sahil navalekar",
                          email: "sahil.navalekar@gmail.com",
                          mobile: "1237854090",
                          dob: "2024-04-25"),
                    ));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  CircleAvatar(
                    backgroundColor: appbarColor,
                    radius: 30,
                    child: ClipOval(
                      child: Image.asset(
                        "assets/images/profile.png",
                        fit: BoxFit.cover,
                        width: 60,
                        height: 60,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Sahil navalekar",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'montserrat',
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        "sahil.navalekar@gmail.com",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'montserrat',
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        "+91 78945756",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'montserrat',
                        ),
                      ),
                      // SizedBox(height: 15,),
                    ],
                  ),
                  Expanded(child: Container()),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Icon(Icons.arrow_right),
                  )
                ],
              ),
            ),

            Divider(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 60,
                  width: 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.withOpacity(0.2)),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OrderTrack(),
                          ));
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.bookmark_border,
                          color: appbarColor,
                        ),
                        Text(
                          "Order",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 60,
                  width: 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.withOpacity(0.2)),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Favorite(),
                          ));
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.favorite_border_outlined,
                          color: appbarColor,
                        ),
                        Text(
                          "Favorite",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 60,
                  width: 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.withOpacity(0.2)),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Coupons(),));
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.percent,
                          color: appbarColor,
                        ),
                        Text(
                          "Coupons",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 60,
                  width: 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.withOpacity(0.2)),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HelpPage(),));
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.help_center_outlined,
                          color: appbarColor,
                        ),
                        Text(
                          "Help",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Divider(height: 30),

            //delivery address
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => DeliveryAddressScreen(),));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 17),
                        child: Icon(
                          Icons.location_on_outlined,
                          color: appbarColor,
                        ),
                      ),
                      const Text(
                        "Saved Address",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontFamily: 'montserrat',
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Icon(Icons.keyboard_arrow_right_sharp),
                  )
                ],
              ),
            ),

            Divider(
              height: 25,
            ),


            InkWell(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 17),
                        child: Icon(
                          Icons.code,
                          color: appbarColor,
                        ),
                      ),
                      Text(
                        "Promo Code",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontFamily: 'montserrat',
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Icon(Icons.keyboard_arrow_right_sharp),
                  )
                ],
              ),
            ),

            Divider(height: 25),

            //notification
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => NotificatoPage(),));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 17),
                        child: Icon(
                          Icons.notifications_none_outlined,
                          color: appbarColor,
                        ),
                      ),
                      Text(
                        "Notification",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontFamily: 'montserrat',
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Icon(Icons.keyboard_arrow_right_sharp),
                  )
                ],
              ),
            ),
            Divider(height: 25),

            //settings
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPassword(),));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 17),
                        child: Icon(
                          Icons.password,
                          color: appbarColor,
                        ),
                      ),
                      Text(
                        "Change password",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontFamily: 'montserrat',
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Icon(Icons.keyboard_arrow_right_sharp),
                  )
                ],
              ),
            ),

            Divider(height: 25),

            //about
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => About(),));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 17),
                        child: Icon(
                          Icons.details,
                          color: appbarColor,
                        ),
                      ),
                      Text(
                        "About",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontFamily: 'montserrat',
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Icon(Icons.keyboard_arrow_right_sharp),
                  )
                ],
              ),
            ),
            Divider(height: 25),

            InkWell(
              onTap: () {
                _showLogOutBottomSheet(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 17),
                        child: Icon(
                          Icons.logout,
                          color: appbarColor,
                        ),
                      ),
                      Text(
                        "Logout",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontFamily: 'montserrat',
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Icon(Icons.keyboard_arrow_right_sharp),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            // Container(
            //     margin: EdgeInsets.symmetric(horizontal: 20),
            //     child: myButton("Logout", orange, () {},
            //         icon: Icon(Icons.logout))
            // ),
          ],
        ),
      ),
    );
  }


  //for logout
  void _showLogOutBottomSheet(BuildContext context) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
      ),
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, setState) {
            return Container(
              height: 300,
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Wish to Log Out?",
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'montserrat',
                              fontWeight: FontWeight.w800),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.close,
                            color: appbarColor,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const Text(
                      "You might miss out deals and offers made just for you, do you still want to exite?",
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'montserrat',
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    myButton("Log Out", appbarColor, () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login(),));
                    }),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 55,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(19),
                          ),
                          elevation: 0.4, // Set the elevation to 0
                          side: BorderSide(
                            color: Colors
                                .black12, // Change the color of the border here
                            width: 0.7, // Adjust the width of the border here
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "cancel",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: appbarColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'montserrat',
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
