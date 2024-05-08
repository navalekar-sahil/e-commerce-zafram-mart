import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:zafram_mart/component/color.dart';
import 'package:zafram_mart/component/my_widgtes.dart';
import 'package:zafram_mart/screen/bottomNavigationBar.dart';

class OrderAccepted extends StatefulWidget {
  const OrderAccepted({super.key});

  @override
  State<OrderAccepted> createState() => _OrderAcceptedState();
}

class _OrderAcceptedState extends State<OrderAccepted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: LottieBuilder.asset("assets/images/orderDone.json"),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              "Your Order has been\naccepted",
              style: TextStyle(fontWeight: FontWeight.w500,fontFamily: 'montserrat', fontSize: 26),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Your items has been placcd and is on\nit’s way to being processed",
              style: TextStyle(fontWeight: FontWeight.w400,fontFamily: 'montserrat', fontSize: 16),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 40,
            ),
            myButton("Track Order", orange, () {}),
            SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BottomBar(),
                    ));
              },
              child: Text(
                "Back to Home",
                style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'montserrat', fontSize: 17),
              ),
            )
          ],
        ),
      ),
    );
  }
}
