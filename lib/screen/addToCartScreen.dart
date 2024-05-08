import 'package:flutter/material.dart';
import 'package:zafram_mart/SystemScreen/DeliveryAddressScreen.dart';
import 'package:zafram_mart/SystemScreen/couponsScreen.dart';
import 'package:zafram_mart/component/color.dart';
import 'package:zafram_mart/component/my_widgtes.dart';
import 'package:zafram_mart/screen/orderSummary.dart';
import 'package:zafram_mart/screen/paymentScreen.dart';
import 'package:zafram_mart/screen/productDetailsScreen.dart';
import 'package:zafram_mart/screen/searchScreen.dart';

import '../component/offerList_widgtes.dart';
import 'bottomNavigationBar.dart';

class AddToCard extends StatefulWidget {
  const AddToCard({Key? key}) : super(key: key);

  @override
  State<AddToCard> createState() => _AddToCardState();
}

class _AddToCardState extends State<AddToCard> {



  Map<int, int> counters = {}; // Map to store counters for each item
  double totalAmount = 0.0;
  double shipingAmount = 0.0;
  @override
  void initState() {
    super.initState();
    // Initialize counters for each item to 0
    setState(() {
      for (int i = 0; i < data.length; i++) {
        counters[i] = 1;
      }
      calculateTotalAmount();
    });
  }

  void _incrementCounter(int index) {
    setState(() {
      counters[index] = (counters[index] ?? 0) + 1;
      calculateTotalAmount(); // Calculate total amount after incrementing
    });
  }

  void _decrementCounter(int index) {
    setState(() {
      if (counters[index]! > 0) {
        counters[index] = counters[index]! - 1;
        calculateTotalAmount(); // Calculate total amount after decrementing
      }
    });
  }

// Calculate total amount
  void calculateTotalAmount() {
    double total = 0.0;
    double shipping = 0.0; // Initialize shipping outside the loop
    for (int i = 0; i < data.length; i++) {
      double price = data[i]['price']; // Parse as double directly
      int quantity = counters[i] ?? 0; // Get quantity from counters map
      total += quantity * price; // Multiply quantity by price to get subtotal
      shipping += data[i]['shipping']; // Accumulate shipping costs
    }
    // Add shipping to the total
    total += shipping;
    setState(() {
      totalAmount = total;
      shipingAmount = shipping; // Update shipping amount
    });
  }

  void _removeItem(int index) {
    setState(() {
      data.removeAt(index); // Remove the item from the list
      calculateTotalAmount(); // Recalculate the total amount
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: pink,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: appbarColor,
        toolbarHeight: 70,
        // centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            "My Cart",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'montserrat',
              // color: Colors.grey[600]
            ),
          ),
        ),
        // iconTheme: IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Search(),
                  ));
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //=================saving amount and total amount bar======================
            Container(
              // margin: EdgeInsets.only(top: 4),
              color: Colors.white,

              height: 40,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 10.0, left: 10.0),
                    child: Text(
                      "Saving Amount : 0.00",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'montserrat',
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            for (int index = 0; index < data.length; index++)
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductDetails(
                                name: data[index]["product_name"],
                                price: "${data[index]["price"]}",
                                quantity: data[index]["Quantity"],
                                images: data[index]["image_path"],
                              )));
                },
                child: Container(
                  // height: 130,
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 7),
                  decoration: BoxDecoration(
                      // borderRadius: BorderRadius.circular(10),
                      // color: Colors.white
                      ),
                  padding: EdgeInsets.all(4),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Column(
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
                                        data[index]["image_path"][0]),
                                    // fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 8,
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
                                          data[index]['product_name'],
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'montserrat',
                                              fontSize: 15,
                                              overflow: TextOverflow.ellipsis),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 14),
                                        child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              data.removeAt(index);
                                            });
                                          },
                                          child: InkWell(
                                            onTap: () {
                                              _removeItem(index);
                                            },
                                            child: Container(
                                              height: 25,
                                              width: 25,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                  color: orange),
                                              child: const Center(
                                                child: Text(
                                                  "X",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: 'montserrat',
                                                      color: Colors.white,
                                                      fontSize: 18),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    "${data[index]['Quantity']} Kg",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'montserrat',
                                    ),
                                  ),

                                  //===================Rating================================

                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            "₹ ${data[index]['price']}",
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'montserrat',
                                              fontSize: 16,
                                              // color: Colors.green,
                                            ),
                                          ),
                                        ],
                                      ),

                                      //=============item counter========
                                      Container(
                                        width: 90,
                                        height: 30,
                                        // margin: EdgeInsets.only(right: 10),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: Colors.grey[200]),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            InkWell(
                                              onTap: () =>
                                                  _decrementCounter(index),
                                              child: Text(
                                                ' - ',
                                                style: TextStyle(
                                                    fontSize: 25,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),

                                            Container(
                                              height: 35,
                                              width: 40,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(17),
                                                border: Border.all(
                                                  color: Colors.black
                                                      .withOpacity(0.1),
                                                  width: 1.0,
                                                ),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  '${counters[index]}',
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    fontFamily: 'montserrat',
                                                  ),
                                                ),
                                              ),
                                            ),
                                            // SizedBox(width: 1,),
                                            InkWell(
                                              onTap: () =>
                                                  _incrementCounter(index),
                                              child: Text(
                                                ' +  ',
                                                style: TextStyle(fontSize: 20),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    data[index]['shipping'] == 0.00
                                        ? "Free Shipping"
                                        : "Shipping Charge: ₹${data[index]['shipping']}",
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontFamily: 'montserrat',
                                      color: data[index]['shipping'] == 0.00
                                          ? appbarColor
                                          : orange,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Divider()
                      ],
                    ),
                  ),
                ),
              ),

            SizedBox(height: 30,),
            Container(
              height: 160,
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Price Details",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
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
                        "₹ ${totalAmount.toStringAsFixed(2)}",
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
                        "₹0.00",
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
                        "₹ ${shipingAmount.toStringAsFixed(2)}",
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
                        "₹ ${totalAmount.toStringAsFixed(2)}",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 15),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15.0),
        child: data.isEmpty
            ? myButton("Continue Shopping", Colors.orange, () {
                // _showBottomSheet(context);
          Navigator.push(context, MaterialPageRoute(builder: (context) => BottomBar(),));
                setState(() {});
              })
            : myButton("Processed Payment", orange, () {
                // _showBottomSheet(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OrderSummary(
                          products: data,
                          totalPrice: totalAmount.toString(),
                          Discount: "0.00",
                          shipping_Amount: shipingAmount),
                    ));
                setState(() {});
              }),
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    bool isPaymentExpanded = false;

    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
      ),
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, setState) {
            return GestureDetector(
              onTap: () {
                // Close the bottom sheet if the expanded area is not tapped
                if (isPaymentExpanded) {
                  setState(() {
                    isPaymentExpanded = false;
                  });
                }
              },
              child: Container(
                height: 320,
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Checkout",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontFamily: 'montserrat',
                              fontSize: 18,
                            ),
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.close),
                          ),
                        ],
                      ),
                      Divider(
                        height: 07,
                        color: Colors.transparent,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DeliveryAddressScreen(),
                              ));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Delivery",
                              style: optionStyle(),
                            ),
                            Row(
                              children: [
                                Text(
                                  "Mumbara, Thane",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'montserrat',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Icon(Icons.arrow_right),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Divider(height: 17, color: Colors.transparent),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Coupons(),
                              ));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Promo Code",
                              style: optionStyle(),
                            ),
                            Row(
                              children: [
                                Text(
                                  "Pick Discount",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'montserrat',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Icon(Icons.arrow_right),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Divider(height: 17, color: Colors.transparent),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total amount",
                            style: optionStyle(),
                          ),
                          Row(
                            children: [
                              Text(
                                "₹${totalAmount}",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontFamily: 'montserrat',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "By placing an order you agree to our\nTerms And Conditions",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 13,
                          fontFamily: 'montserrat',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      myButton("Place Order", orange, () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  Payment(amount: totalAmount),
                            ));
                        // Navigator.pushReplacement(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => OrderAccepted(),
                        //     ));
                      }),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  TextStyle optionStyle() {
    return TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w700,
      fontFamily: 'montserrat',
      // color: Colors.grey[700],
    );
  }


}
