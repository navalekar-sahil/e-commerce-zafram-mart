import 'dart:core';

import 'package:flutter/material.dart';
import 'package:zafram_mart/SystemScreen/DeliveryAddressScreen.dart';
import 'package:zafram_mart/component/my_widgtes.dart';
import 'package:zafram_mart/component/offerList_widgtes.dart';
import 'package:zafram_mart/screen/paymentScreen.dart';

import '../component/color.dart';

class OrderSummary extends StatefulWidget {
  final   List<Map<String, dynamic>> products;

  final String totalPrice;
  final String Discount;
  final double shipping_Amount;
   OrderSummary({
    Key? key,
    required this.products, required this.totalPrice, required this.Discount, required this.shipping_Amount,
  }) : super(key: key);

  @override
  State<OrderSummary> createState() => _OrderSummaryState();
}

class _OrderSummaryState extends State<OrderSummary> {

  late  double? totalPrice =0.00;
  @override
  void initState() {
    totalPrice=double.tryParse(widget.totalPrice);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: appbarColor,
        toolbarHeight: 70,
        // centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            "Order Summary",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'montserrat',
              // color: Colors.grey[600]
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            Container(
              color: Colors.white,

              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              // margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              height: 130,

              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Deliver To:",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 18),
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => DeliveryAddressScreen(),));
                          },
                          child: Text(
                            "Change",
                            style: TextStyle(
                                color: Colors.blueAccent,
                                fontSize: 17,
                                fontWeight: FontWeight.w700),
                          ),
                        )
                      ],
                    ),
                    Text(
                      "Sahil Navalekar",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,fontFamily: 'montserrat', fontSize: 17),
                    ),
                    Container(
                      width: 360,
                      child: Text(
                        "416602, Bhandup west, Mumbai, Tembipada",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 15,fontFamily: 'montserrat',overflow: TextOverflow.ellipsis),
                          maxLines: 2,
                      ),
                    ),
                    Text(
                      "812 3457 789",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,fontFamily: 'montserrat', fontSize: 15),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10,),

            //products
            for (int index = 0; index < widget.products.length; index++)
            Container(
              // height: 130,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 7),
              decoration: BoxDecoration(

                // borderRadius: BorderRadius.circular(10),
                color: Colors.white
              ),
              padding: EdgeInsets.all(4),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //===================================item image===========================================
                        Center(
                          child: Container(
                            width: 85,
                            height: 90,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              // color: Colors.grey[300],
                              image: DecorationImage(
                                image: AssetImage(
                                    widget.products[index]["image_path"][0]),
                                // fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 6,
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 180,
                                    child: Text(
                                      widget.products[index]['product_name'],
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'montserrat',
                                          fontSize: 15,
                                          overflow: TextOverflow.ellipsis),
                                    ),
                                  ),

                                ],
                              ),
                              SizedBox(height: 4),

                              Text(
                                "${widget.products[index]['Quantity']} ",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'montserrat',
                                ),
                              ),
                              Rating(rating: 5),
                              SizedBox(height: 4),
                              //===================Rating================================

                              Row(
                                children: [
                                  Text("300",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,decoration: TextDecoration.lineThrough),),
                                  Text(
                                    " ₹${widget.products[index]['price']}",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'montserrat',
                                      fontSize: 16,
                                      // color: Colors.green,
                                    ),
                                  ),
                                ],
                              ),

                            ],
                          ),
                        ),
                      ],
                    ),
                   Row(
                     children: [
                       Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 8.0),
                         child: Text("Delivery By May 5,sun  ",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14.5),),
                       ),
                       Text(widget.products[index]['shipping'] == 0.00
                           ? "Free Shipping"
                           : "Shipping Charge: ₹${widget.products[index]['shipping']}",
                         style: TextStyle(
                           fontSize: 14,
                           fontWeight: FontWeight.w500,
                           fontFamily: 'montserrat',
                           color: widget.products[index]['shipping'] == 0.00
                               ? Colors.green[500]
                               : orange,
                         ),),
                     ],
                   ),
                    Divider(height: 15,thickness: 1,),

                  ],
                ),
              ),
            ),
            SizedBox(height: 15,),
            Container(
              // height: 190,
              color: Colors.white,
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5,),
                  Text(
                    "Price Details",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total Item",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 14),
                      ),
                      Text(
                        "${widget.products.length}",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 14),
                      )
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total Price ",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 14),
                      ),
                      Text(
                        "₹${widget.totalPrice}",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 14),
                      )
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Discount",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 14),
                      ),
                      Text(
                        "₹${widget.Discount}",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 14),
                      )
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Delivery Charges",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 14),
                      ),
                      Text(
                        "₹${widget.shipping_Amount}",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 14),
                      )
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total Amount",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 17),
                      ),
                      Text(
                        "₹${widget.totalPrice}",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 15),
                      ),

                    ],
                  ),
                  SizedBox(height: 5,)
                ],
              ),
            ),
            // SizedBox(height: 20,),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding:const EdgeInsets.all(15.0),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(width: 8,),
            Text("₹${widget.totalPrice}",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 24),),
            Spacer(),
            Container(
              width: 150,
                height: 45,
                child: myButton("Continue", orange, () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            Payment(amount: double.parse(widget.totalPrice),),
                      ));
                }))
          ],
        ),
      ),
    );
  }
}
