import 'package:flutter/material.dart';
import 'package:zafram_mart/screen/productDetailsScreen.dart';

import '../component/color.dart';
import '../component/my_widgtes.dart';
import 'addToCartScreen.dart';

class SeeAll extends StatefulWidget {
  const SeeAll({super.key});

  @override
  State<SeeAll> createState() => _SeeAllState();
}

class _SeeAllState extends State<SeeAll> {
  List<Map<String, dynamic>> offer = [
    {
      "id": 1,
      "name": "banana",
      "quantity": "12 pieces",
      "price": "150",
      "imagePath": "assets/images/vegi3.png"
    },
    {
      "id": 2,
      "name": "apple",
      "quantity": "12 pieces",
      "price": "200",
      "imagePath": "assets/images/vegi3.png"
    },
    {
      "id": 3,
      "name": "vegitables",
      "quantity": "12 pieces",
      "price": "190",
      "imagePath": "assets/images/vegi3.png"
    },
    {
      "id": 4,
      "name": "banana",
      "quantity": "12 pieces",
      "price": "60",
      "imagePath": "assets/images/vegi3.png"
    },
    {
      "id": 1,
      "name": "banana",
      "quantity": "12 pieces",
      "price": "150",
      "imagePath": "assets/images/vegi3.png"
    },
    {
      "id": 2,
      "name": "apple",
      "quantity": "12 pieces",
      "price": "200",
      "imagePath": "assets/images/vegi3.png"
    },
    {
      "id": 3,
      "name": "vegitables",
      "quantity": "12 pieces",
      "price": "190",
      "imagePath": "assets/images/vegi3.png"
    },
    {
      "id": 4,
      "name": "banana",
      "quantity": "12 pieces",
      "price": "60",
      "imagePath": "assets/images/vegi3.png"
    },
    {
      "id": 1,
      "name": "banana",
      "quantity": "12 pieces",
      "price": "150",
      "imagePath": "assets/images/vegi3.png"
    },
    {
      "id": 2,
      "name": "apple",
      "quantity": "12 pieces",
      "price": "200",
      "imagePath": "assets/images/vegi3.png"
    },
    {
      "id": 3,
      "name": "vegitables",
      "quantity": "12 pieces",
      "price": "190",
      "imagePath": "assets/images/vegi3.png"
    },
    {
      "id": 4,
      "name": "banana",
      "quantity": "12 pieces",
      "price": "60",
      "imagePath": "assets/images/vegi3.png"
    },
    {
      "id": 1,
      "name": "banana",
      "quantity": "12 pieces",
      "price": "150",
      "imagePath": "assets/images/vegi3.png"
    },
    {
      "id": 2,
      "name": "apple",
      "quantity": "12 pieces",
      "price": "200",
      "imagePath": "assets/images/vegi3.png"
    },
    {
      "id": 3,
      "name": "vegitables",
      "quantity": "12 pieces",
      "price": "190",
      "imagePath": "assets/images/vegi3.png"
    },
    {
      "id": 4,
      "name": "banana",
      "quantity": "12 pieces",
      "price": "60",
      "imagePath": "assets/images/vegi3.png"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pink,
      appBar: AppBar(

        elevation: 0,
        backgroundColor: appbarColor,
        // centerTitle: true,
        toolbarHeight: 70,

        title: Text(
          "Items",
          style: TextStyle(
              fontSize: 23,fontFamily: 'montserrat', fontWeight: FontWeight.w600),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AddToCard(),));
                },
                child: Icon(
                  Icons.shopping_cart,color: Colors.white,
                )),
          )
        ],
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body:Container(
        margin: EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 220),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetails(
                                images: [offer[index]['imagePath']],
                                name: offer[index]['name'],
                                price: offer[index]['price'],
                                quantity: offer[index]['quantity']),
                          ));
                    },
                    child: Container(
                      width: 170,
                      height: 300,
                      margin: EdgeInsets.only(top: 5,left: 5),
                      decoration: BoxDecoration(
                        color: Colors.white60,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 100,
                                    width: 100,
                                    child: Image.asset(
                                      offer[index]['imagePath'],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            // SizedBox(height: 6),
                            Text(
                              offer[index]['name'],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,fontFamily: 'montserrat', fontSize: 17),
                            ),
                            Text(
                              offer[index]['quantity'],
                              style: TextStyle(fontSize: 14,fontFamily: 'montserrat',),
                            ),
                            // SizedBox(height: 6),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Rs ${offer[index]['price']}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,fontFamily: 'montserrat',
                                      fontSize: 17),
                                ),
                                Container(
                                  height: 43,
                                  width: 43,
                                  child: myButton("+", orange, () {}),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                itemCount: offer.length,
              ),
            )
          ],
        ),
      ) ,
    );
  }
}
