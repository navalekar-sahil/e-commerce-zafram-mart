import 'package:flutter/material.dart';
import 'package:zafram_mart/screen/addToCartScreen.dart';
import 'package:zafram_mart/screen/productDetailsScreen.dart';
import 'package:zafram_mart/screen/searchScreen.dart';

import '../component/color.dart';
import '../component/my_widgtes.dart';
import 'categoryItemListScreen.dart';

class Favorite extends StatefulWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  List<Map<String, dynamic>> favoriteList = [
    {
      "id": 01,
      "image_path": ["assets/images2/Fortune Oil.png", "assets/images2/Fortune Oil.png"],
      "product_name": "Fortune Oil",
      "Quantity": "1.5",
      "price": "200.00",
      "shipping": 0.00
    },
    {
      "id": 02,
      "image_path": ["assets/images2/Amul Gold.png", "assets/images2/Amul Gold.png"],
      "product_name": "Amul Gold",
      "Quantity": "1.5",
      "price": "200.00",
      "shipping": 0.00
    },
    {
      "id": 03,
      "image_path": ["assets/images2/Arabian Dates.png","assets/images2/Arabian Dates.png"],
      "product_name": "Arabian Dates ,Good Quality Dates For You ",
      "Quantity": "1.5",
      "price": "200.00",
      "shipping": 0.00
    },
    {
      "id": 04,
      "image_path": ["assets/images2/chakki Atta.png","assets/images2/chakki Atta.png"],
      "product_name": "Chakki Atta, Aashirvaad Chakki Atta ",
      "Quantity": "1.5",
      "price": "200.00",
      "shipping": 0.00
    },
  ];
  List<Map<String, dynamic>> offer = [
    {
      "id": 1,
      "category": "Fruits",
      "name": "Oil (Aashirvad Pure Oil)",
      "quantity": "1 L",
      "price": "176",
      "discount": 50,
      "imagePath": "assets/images2/Fortune Oil.png"
    },
    {
      "id": 2,
      "category": "Fruits",
      "name": "Amul Gold Milk 1L ",
      "quantity": "1 L",
      "price": "94",
      "discount": 23,
      "imagePath": "assets/images2/Amul Gold.png"
    },
    {
      "id": 3,
      "category": "Fruits",
      "name": "Amul Pure Milk ",
      "quantity": "500 G",
      "price": 54,
      "discount": 20,
      "imagePath": "assets/images2/Amul tax.png"
    },
    {
      "id": 4,
      "category": "Fruits",
      "name": "Amul Kool Milk ",
      "quantity": "200 G",
      "price": 78,
      "discount": 20,
      "imagePath": "assets/images2/AmulKool.png"
    },
    {
      "id": 1,
      "category": "Clothing",
      "name": "Chakki Atta, Aashirvaad Chakki Atta ",
      "quantity": "5 kg ",
      "price": 310,
      "discount": 40,
      "size": ["M", "X", "L", "XL", "XXL"],
      "imagePath": "assets/images2/chakki Atta.png"
    },
    {
      "id": 2,
      "category": "Clothing",
      "name": "Chana Daal",
      "quantity": "2 Kg",
      "price": 250,
      "discount": 20,
      "imagePath": "assets/images2/chana daal.png"
    },
    {
      "id": 3,
      "category": "Clothing",
      "name": "Cow Ghee Big Pack",
      "quantity": "1 kg ",
      "price": 450,
      "discount": 30,
      "size": ["S", "M", "L"],
      "imagePath": "assets/images2/Cow Ghee big pack.png"
    }
  ];
  @override
  Widget build(BuildContext context) {
    TextEditingController searchBar = TextEditingController();
    return Scaffold(
      backgroundColor: pink,
      // backgroundColor: pink,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: appbarColor,
        toolbarHeight: 70,
        // centerTitle: true,
        title: Text(
          "Favorite",
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'montserrat',
            fontWeight: FontWeight.w600,
          ),
        ),
        // iconTheme: IconThemeData(color: Colors.black),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Search()),
              );
            },
            child: Icon(Icons.search,),
          ),
          myCart()
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(

              height: 35,
              color: skyBlue,
              child: const Row(
                children: [
                  SizedBox(width: 20),
                  Icon(Icons.location_pin, size: 20),
                  Text(
                    "Mumbra, Thane",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'montserrat',
                    ),
                  ),
                  Icon(Icons.arrow_drop_down, size: 20),
                ],
              ),
            ),
            SizedBox(height: 10), // Add some spacing between the row and the content
            SizedBox(
              // height: MediaQuery.of(context).size.height * 0.8, // Adjust the height as needed
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  children: [
                    for (var item in favoriteList)
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetails(
                                images: item['image_path'],
                                name: item['product_name'],
                                price: item['price'],
                                quantity: item['Quantity'],
                              ),
                            ),
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(vertical: 5),
                          margin: EdgeInsets.only(top: 5, left: 8, right: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: Row(
                            children: [
                              Center(
                                child: Container(
                                  width: 85,
                                  height: 90,
                                  margin: EdgeInsets.symmetric(horizontal: 6),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: skyBlue.withOpacity(0.3),
                                    image: DecorationImage(
                                      image: AssetImage(item["image_path"][0]),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width:210,
                                          child: Text(
                                            "${item["product_name"]}",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'montserrat',
                                              fontSize: 15,
                                              overflow: TextOverflow.ellipsis
                                            ),
                                            maxLines: 2,
                                          ),
                                        ),
                                        Spacer(),
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              favoriteList.remove(item);
                                            });
                                          },
                                          child: Icon(
                                            Icons.favorite,
                                            color: Colors.red,
                                            size: 20,
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${item["Quantity"]}",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontFamily: 'montserrat',
                                                fontSize: 14,
                                              ),
                                            ),
                                            item["shipping"]==0.00?Text("Free Shiping", style: TextStyle(
                                              fontWeight: FontWeight.w400,color: Colors.green,
                                              fontFamily: 'montserrat',
                                              fontSize: 14,
                                            ),):Text(
                                              "Shipping: ${item["shipping"]}==0",
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontFamily: 'montserrat',
                                                fontSize: 14,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(right: 2.0),
                                          child: Text(
                                            "₹${item["price"]}",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontFamily: 'montserrat',
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Icon(Icons.keyboard_arrow_right_sharp),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Favorite Items",
                      style: TextStyle(
                          fontSize: 17,
                          fontFamily: 'montserrat',
                          // fontStyle: FontStyle.italic,
                          // color: Colors.grey[700],
                          fontWeight: FontWeight.w700)),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CategoryItem(),
                            ));
                      },
                      child: Text(
                        "See all",
                        style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'montserrat',
                            color: orange,
                            fontWeight: FontWeight.bold),
                      ))
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 220,
              margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: offer.length,
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
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        color: Colors.white60,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 110,
                                    width: 100,
                                    child: Image.asset(
                                      offer[index]['imagePath'],
                                      // fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 6),
                            Container(
                              height: 33,
                              child: Text(
                                offer[index]['name'],
                                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15,overflow: TextOverflow.ellipsis,),maxLines: 2,
                              ),
                            ),
                            Text(
                              offer[index]['quantity'],
                              style: TextStyle(fontSize: 14),
                            ),
                            SizedBox(height: 6),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Rs ${offer[index]['price']}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 17),
                                ),
                                InkWell(
                                  child: Container(
                                    height: 45,
                                    width: 45,
                                    decoration: BoxDecoration(
                                      borderRadius:BorderRadius.circular(10),
                                      color: orange,
                                      // shape: BoxShape.circle,
                                    ),
                                    child: IconButton(
                                      icon: Icon(Icons.add),
                                      color: Colors.white,
                                      onPressed: () {
                                        showSnackBar(context, "Item Added to cart Successfully !", Colors.green);

                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),

    );
  }
}
