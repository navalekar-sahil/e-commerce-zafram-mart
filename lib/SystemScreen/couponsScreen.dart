import 'package:flutter/material.dart';
import 'package:zafram_mart/component/color.dart';

import '../component/my_widgtes.dart';
import '../screen/addToCartScreen.dart';

class Coupons extends StatefulWidget {
  const Coupons({super.key});

  @override
  State<Coupons> createState() => _CouponsState();
}

class _CouponsState extends State<Coupons> {
  List coupons = [
    {
      "imagepath": "assets/category/electronic.png",
      "discount": "20-30",
      "discription": "For first time user",
      "rating": "4",
      "category": "electronic",
      "validity": "5"
    },
    {
      "imagepath": "assets/category/buiety.png",
      "discount": "10-50",
      "discription": "Flat discount for every purchase",
      "rating": "4.6",
      "category": "buiety",
      "validity": "15"
    },
    {
      "imagepath": "assets/category/jewellery.png",
      "discount": "5-8",
      "discription": "For Diwali",
      "rating": "5",
      "category": "jewellery",
      "validity": "10"
    },
    {
      "imagepath": "assets/category/sofa.png",
      "discount": "15-40",
      "discription": "For first 10 users",
      "rating": "5",
      "category": "furniture",
      "validity": "12"
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pink,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: appbarColor,
        toolbarHeight: 70,
        // centerTitle: true,
        title: Text(
          "Coupons",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'montserrat',
            // color: Colors.grey[600]
          ),
        ),
        actions: [
          myCart()
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 15,
            ),
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  "assets/carosoleImage/sell2.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Coupons",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: bgappbar,
                fontFamily: 'montserrat',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(

                itemCount: coupons.length,
                itemBuilder: (context, index) {
                  return Container(
                      height: 100,
                      margin: EdgeInsets.symmetric(vertical: 5),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: appbarColor, width: 1.5)),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          ClipOval(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.asset(
                                "${coupons[index]["imagepath"]}",
                                // fit: BoxFit.cover, // Ensure the image covers the circular area
                                width: 70, // Adjust the width as needed
                                height: 70, // Adjust the height as needed
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${coupons[index]["discount"]}% OFF",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 18),
                              ),
                              Text(
                                "${coupons[index]["discription"]}",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Colors.grey),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    width: 55,
                                    height: 25,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.yellow.withOpacity(0.2),
                                    ),
                                    child: Center(
                                        child: Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Colors.yellow[600],
                                        ),
                                        SizedBox(
                                          width: 4,
                                        ),
                                        Text(
                                          "${coupons[index]["rating"]}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600),
                                        )
                                      ],
                                    )),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    // width: 50,
                                    height: 25,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: skyBlue,
                                    ),

                                    child: Center(
                                        child: Text(
                                      "  ${coupons[index]["category"]}  ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600),
                                    )),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    width: 70,
                                    height: 25,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: orange.withOpacity(0.3),
                                    ),
                                    child: Center(
                                        child: Text(
                                      "${coupons[index]["validity"]} Days",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
