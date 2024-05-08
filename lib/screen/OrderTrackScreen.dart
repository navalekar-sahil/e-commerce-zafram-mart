import 'package:flutter/material.dart';
import 'package:zafram_mart/component/color.dart';
import 'package:zafram_mart/component/my_widgtes.dart';
import 'package:zafram_mart/screen/addToCartScreen.dart';
import 'package:zafram_mart/screen/homeScreen.dart';
import 'package:zafram_mart/screen/orderDetails.dart'; // Adjust import path as needed

class OrderTrack extends StatefulWidget {
  const OrderTrack({Key? key}) : super(key: key);

  @override
  State<OrderTrack> createState() => _OrderTrackState();
}

class _OrderTrackState extends State<OrderTrack>
    with SingleTickerProviderStateMixin {
  late TabController tabcontroller;

  @override
  void initState() {
    super.initState();
    tabcontroller =
        TabController(length: 2, vsync: this); // Add vsync: this here
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 70,
        backgroundColor: appbarColor, // Make sure appbarColor is defined
        title: Text(
          "My Orders",
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'montserrat',
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: myCart(),
          ),
        ],
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Container(
              height: 41,
              // color: Color(0xFF68A3D2),
              child: TabBar(tabs: [
                Tab(
                  child: Container(
                    child: Text(
                      "Order",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black
                      ),
                    ),
                  ),
                ),
                Tab(
                  child: Text("Refund",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black
                      )),
                )
              ]),
            ),
            //tabbar view
            Expanded(
              child: TabBarView(
                children: [orderScreen(), refundScreen()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class orderScreen extends StatelessWidget {
  const orderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> order = [
      {
        "id": 1,
        "name": "banana banan abananab ananaba nanabanana",
        "delivery": "Delivery expected by May 06",
        "imagePath": "assets/images/vegi3.png",
        'price': 600.00,
        "orderId": "spq2345678"
      },
      {
        "id": 2,
        "name": "laptop ryzen 5",
        "delivery": "canceled by May 06",
        "imagePath": "assets/images/sell2.jpg",
        'price': 500.00,
        "orderId": "spq2345678"
      },
    ];
    return ListView.builder(
      itemCount: order.length > 0
          ? order.length
          : 1, // If list is empty, show only 1 item for the button
      itemBuilder: (context, index) {
        if (order.isEmpty) {
          // If offer list is empty, show the Explore More button
          return Container(

            margin: EdgeInsets.symmetric(horizontal: 25),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                          color: orange.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(150)),
                      child: Center(
                          child: Image.asset(
                        "assets/images/emptybag.png",
                      ))),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "We're waiting for your first order",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "No order placed yet. Shop from our categories and grab the best deals on your order",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 100),
                      child: myButton("Explore Categories", Colors.orange, () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home(),));
                      }),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          // If offer list is not empty, show the list of ListTiles
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OrderDetails(
                        name: order[index]['name'],
                        price: order[index]['price'],
                        orderId: order[index]['orderId'],
                        ImagePath: order[index]['imagePath']),
                  ));
            },
            child: Column(

              children: [
                Container(
                  height: 100,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Center(
                    child: ListTile(
                      leading: Image.asset(
                        order[index]["imagePath"],
                        width: 80,
                        fit: BoxFit.cover,
                      ),
                      title: Text(
                        order[index]['delivery'],
                        style: TextStyle(color: Colors.black), // Text color
                      ),
                      subtitle: Text(
                        order[index]['name'],
                        style: TextStyle(color: Colors.grey), // Text color
                      ),
                      trailing: Icon(
                        Icons.keyboard_arrow_right_sharp,
                        color: Colors.black, // Icon color
                      ),
                    ),
                  ),
                ),
                Divider()
              ],
            ),
          );
        }
      },
    );
  }
}

class refundScreen extends StatelessWidget {
  const refundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> deliverd = [
      {
        "id": 1,
        "name": "banana banan abananab ananaba nanabanana",
        "delivery": "Refund on fri Apr 26",
        "imagePath": "assets/images/vegi3.png"
      },
      {
        "id": 2,
        "name": "laptop ryzen 5",
        "delivery": "Refund on feb 26",
        "imagePath": "assets/images/sell2.jpg"
      },
    ];
    return ListView.builder(
      itemCount: deliverd.length,
      itemBuilder: (context, index) {
        return Container(
          // height: 100,
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Center(
            child: Column(
              children: [

                ListTile(
                  leading: Image.asset(
                    deliverd[index]["imagePath"],
                    width: 80,
                    fit: BoxFit.cover,
                  ),
                  title: Text(
                    deliverd[index]['delivery'],
                    style: TextStyle(color: Colors.black), // Text color
                  ),
                  subtitle: Text(
                    deliverd[index]['name'],
                    style: TextStyle(color: Colors.grey), // Text color
                  ),
                  // trailing: Icon(
                  //   Icons.keyboard_arrow_right_sharp,
                  //   color: Colors.black, // Icon color
                  // ),
                ),
                Divider()
              ],
            ),
          ),
        );
      },
    );
  }
}
