import 'package:flutter/material.dart';

import '../component/color.dart';
import '../component/my_widgtes.dart';
import '../screen/addToCartScreen.dart';
import '../screen/homeScreen.dart';
import '../screen/orderDetails.dart';

class NotificatoPage extends StatelessWidget {

  List notification=[];

  TextEditingController searchBar=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: pink, // Replace with your desired color
      appBar: AppBar(
        elevation: 1,
        backgroundColor: appbarColor,
        toolbarHeight: 70,
        // centerTitle: true,
        title: Text(
          "Notification",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'montserrat',
            // color: Colors.grey[600]
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: myCart()
          )

        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: notification.length > 0
                  ? notification.length
                  : 1, // If list is empty, show only 1 item for the button
              itemBuilder: (context, index) {
                if (notification.isEmpty) {
                  // If offer list is empty, show the Explore More button
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 25),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 160,
                          ),
                          Container(
                              height: 200,
                              width: 200,
                              decoration: BoxDecoration(
                                  color: orange.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(150)),
                              child: Center(
                                  child: Image.asset(
                                    "assets/images/notification.png",
                                  ))),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "No new notification",
                            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "You will notified with alert and latest offers over here",
                            style: TextStyle(
                              fontSize: 14,
                            ),
                            textAlign: TextAlign.center,
                          ),

                        ],
                      ),
                    ),
                  );
                } else {
                  // If offer list is not empty, show the list of ListTiles
                  return Container();
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
