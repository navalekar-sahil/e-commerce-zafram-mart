// import 'dart:ffi';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:zafram_mart/component/caroselSlider.dart';
import 'package:zafram_mart/component/color.dart';
import 'package:zafram_mart/component/my_widgtes.dart';
import 'package:zafram_mart/component/offerList_widgtes.dart';
import 'package:zafram_mart/screen/accountScreen.dart';
import 'package:zafram_mart/screen/addToCartScreen.dart';
import 'package:zafram_mart/screen/categoryItemListScreen.dart';
import 'package:zafram_mart/screen/productDetailsScreen.dart';
import 'package:zafram_mart/screen/searchScreen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ScrollController _scrollController = ScrollController();
  //Carousel Slider Data
  List<String> imglist = [
    "assets/templete/amul.png",
    "assets/templete/caremal.png",
    // "assets/templete/ktc2.jpg",
    "assets/templete/fashion.png",
    // "assets/templete/womensFashion10.jpg"
    "assets/carosoleImage/sell1.jpg",
  ];

  //carousel 2
  List<String> imglist2 = [
    // "assets/carosoleImage/sell1.jpg",
    "assets/templete/grocery2Banner100.jpg",
    "assets/templete/tide.png"
  ];
  List<String> imglist3 = [
    "assets/templete/amul.png",
    "assets/templete/fashionAdd.jpg",
    "assets/carosoleImage/sell1.jpg",
  ];

  final CarouselController caroselContrller = CarouselController();

  int currentIndex = 0;

  int _currentIndex = 0;
  late bool favorite = true;
  //exclusive offer data
  List<Map<String, dynamic>> offer = [
    {
      "id": 1,
      "category": "Fruits",
      "name": " Oil (Aashirvad Pure Oil)",
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
      "quantity": "500 Gram",
      "price": 54,
      "discount": 20,
      "imagePath": "assets/images2/Amul tax.png"
    },
    {
      "id": 4,
      "category": "Fruits",
      "name": "Amul Kool Milk ",
      "quantity": "200 Gram",
      "price": 78,
      "discount": 20,
      "imagePath": "assets/images2/AmulKool.png"
    },
    {
      "id": 1,
      "category": "Clothing",
      "name": "Arabian Dates ,Good Quality Dates For You ",
      "quantity": "2 kg ",
      "price": 320,
      "discount": 20,
      "size": ["M", "X", "L", "XL", "XXL"],
      "imagePath": "assets/images2/Arabian Dates.png"
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

  List cataegories = [
    {
      "id": 1,
      "name": "Fresh Fruit and Vegetables",
      "imagePath": ["assets/category/fruit.png"]
    },
    {
      "id": 2,
      "name": "Cooking Oil and Ghee",
      "imagePath": ["assets/images2/Aashirrvad Oli.png"]
    },
    {
      "id": 3,
      "name": "Tide makes your cloth smooth",
      "imagePath": ['assets/images2/Tide.png']
    },
  ];

  List category = [
    {"name": "Oil", "imagepath": "assets/images2/Aashirrvad Oli.png"},
    {"name": "Dairy & Bakery", "imagepath": "assets/images2/Amul Gold.png"},
    {"name": "Fruits & Vegetables", "imagepath": "assets/images/fruit.png"},
    {"name": "Home Care", "imagepath": "assets/images/home.png"},
    {"name": "Flour", "imagepath": "assets/images2/chakki Atta.png"},
    {
      "name": "Snacks & Branded Food",
      "imagepath": "assets/images2/Parle-G-1kg.png"
    },
    {"name": "Cold Drink", "imagepath": "assets/images2/Sprite 1L.png"},
    {"name": "Fashion", "imagepath": "assets/images/fation.png"},
  ];

  List fashionList = [
    {
      'id': 1,
      "imagepath": "assets/images2/Aashirrvad Oli.png",
      "name": "Flour"
    },
    {
      'id': 2,
      "imagepath": "assets/images2/CowGhee.png",
      "name": "Pure Cow Ghee"
    },
    {'id': 3, "imagepath": "assets/images2/Tide.png", "name": "Detergent"},
    {
      'id': 4,
      "imagepath": "assets/templete/mensfashion.jpg",
      "name": "mens cloths"
    },
    {
      'id': 5,
      "imagepath": "assets/templete/womensFashion01.png",
      "name": "women's fashion"
    },
    {'id': 6, "imagepath": "assets/images2/Sprite.png", "name": "Cold Drink"},
    {
      'id': 1,
      "imagepath": "assets/images2/Dates.png",
      "name": "Big sell on Dates"
    },
    {'id': 2, "imagepath": "assets/images2/EveryDay.png", "name": "EveryDay"},
    {
      'id': 3,
      "imagepath": "assets/images2/Fortune Oil.png",
      "name": "Fortune Oil & Ghee"
    },
  ];

  //searchbar controller
  TextEditingController searchBar = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: pink,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: appbarColor,
        toolbarHeight: 70,
        title: Container(
            width: 165,
            // height: 300,
            // color: Colors.white,
            margin: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            child: Image.asset("assets/images/zafranlogo1.png")),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Search()),
              );
            },
            child: Icon(
              Icons.search,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddToCard(),
                  ));
            },
            child: myCart()
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      //abbar end

      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            //location start
            Container(
              height: 32,
              color: skyBlue,
              child: const Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.location_on_outlined,
                    size: 20,
                  ),
                  Text(
                    "Deliver to Sahil - Mumbra, Thane",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'montserrat'),
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    size: 20,
                  ),
                ],
              ),
            ),
            //location end

            SizedBox(
              height: 13,
            ),

            //=======================category=======================
            categories(context, category),

            //=======================main carousel slider=======================
            caroselSlider(imglist: imglist, aspectretio: 2.12),

            SizedBox(
              height: 20,
            ),

            //=======================best Deal for you=======================
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Best Deals for you",
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'montserrat',
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

            SizedBox(
              height: 10,
            ),

            bestDealsItem(),
            //trending fashion end

            SizedBox(
              height: 10,
            ),

            //=======================today's Deals=======================
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Todays Deals",
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'montserrat',
                          // fontStyle: FontStyle.italic,
                          // color: Colors.grey[700],
                          fontWeight: FontWeight.w700)),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: cataegories.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CategoryItem(),
                          ));
                    },
                    child: Container(
                      width: 300,
                      height: 70,
                      margin: const EdgeInsets.only(right: 10, left: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(
                                10.0), // Adjust the radius as needed
                            child: Image.asset(
                              cataegories[index]["imagePath"][0],
                              height: 70,
                              // width: 100,
                              // fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            width: 190,
                            // height: 32,
                            child: Text(
                              cataegories[index]["name"],
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontFamily: 'montserrat',
                                fontSize: 14,
                                overflow: TextOverflow
                                    .ellipsis, // Apply ellipsis for overflow
                                // fontFamily: 'montserrat',
                              ),
                              maxLines: 2, // Set maximum lines to 2
                              softWrap:
                                  true, // Allow text to wrap within the given width
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            //best deal end

            SizedBox(
              height: 10,
            ),

            //=======================exclusive offer=======================
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Exclusive  Offer",
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
                            fontSize: 16,
                            fontFamily: 'montserrat',
                            color: orange,
                            fontWeight: FontWeight.bold),
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 12,
            ),
            exclusiveOffer(),

            const SizedBox(
              height: 10,
            ),

            //=======================Best Selling=======================
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Best Selling",
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
                            fontSize: 13,
                            fontFamily: 'montserrat',
                            color: orange,
                            fontWeight: FontWeight.bold),
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 230,
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
                            name: "${offer[index]['name']}",
                            price: offer[index]['price'],
                            quantity: offer[index]['quantity'],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      width: 180,
                      // height: 225,
                      margin: EdgeInsets.only(left: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Stack(
                        // Use Stack to position the favorite icon over the image
                        children: [
                          Container(
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
                                        height: 140,
                                        width: 100,
                                        child: Image.asset(
                                          offer[index]['imagePath'],
                                          // fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  width: 150,
                                  height: 33,
                                  child: Text(
                                    offer[index]['name'],
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      fontFamily: "montserrat",
                                      overflow: TextOverflow
                                          .ellipsis, // Apply ellipsis for overflow
                                      // fontFamily: 'montserrat',
                                    ),
                                    maxLines: 2, // Set maximum lines to 2
                                    softWrap:
                                        true, // Allow text to wrap within the given width
                                  ),
                                ),
                                Text(
                                  offer[index]['quantity'],
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'montserrat',
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "₹1067.00",
                                      style: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                        fontFamily: 'montserrat',
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      "₹${offer[index]['price']}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        fontFamily: 'montserrat',
                                      ),
                                    ),
                                  ],
                                ),

                                SizedBox(
                                  height: 7,
                                ),
                                // Center(
                                //     child: Container(
                                //         width: 140,
                                //         height: 40,
                                //         child: myButton("Add", orange, () {})))
                              ],
                            ),
                          ),
                          Positioned(
                            // Positioned widget to position the favorite icon
                            top: 10,
                            right: 10,
                            child: Icon(
                              Icons.favorite_border_outlined,
                              size: 23,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            //best selling item

            SizedBox(
              height: 20,
            ),

            //=======================carousel slider=======================
            Container(
                width: double.infinity,
                child: caroselSlider(imglist: imglist2, aspectretio: 4.0)),

            SizedBox(
              height: 20,
            ),

            //=======================suggested for you=======================
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Suggested for you",
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'montserrat',
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
                            fontSize: 13,
                            fontFamily: 'montserrat',
                            color: orange,
                            fontWeight: FontWeight.bold),
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SuggestedForYou(),
            SizedBox(
              height: 20,
            ),

            //=======================category item=======================
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Categories",
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
                            fontSize: 13,
                            fontFamily: 'montserrat',
                            color: orange,
                            fontWeight: FontWeight.bold),
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),

            //category section
            categoryList(),

            SizedBox(
              height: 20,
            ),

            //=======================Explore Top Fashion Category=======================
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Explore Top Category",
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'montserrat',
                          // fontStyle: FontStyle.italic,
                          // color: Colors.grey[700],
                          fontWeight: FontWeight.w700)),
                ],
              ),
            ),

            SizedBox(
              height: 15,
            ),

            fashionCategory(),

            SizedBox(
              height: 25,
            ),

            //=======================advertising carousel=======================
            Container(
              color: Colors.white,
              width: double.infinity,
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 200.0, // Adjust the height as needed
                  enlargeCenterPage: true, // Enlarge the current image
                  autoPlay: true, // Set to false to disable autoplay
                  aspectRatio: 16 / 9, // Adjust the aspect ratio if desired
                  viewportFraction:
                      0.8, // Adjust the visible portion of each image
                ),
                items: imglist3.map((image) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Center(
                      child: Image.asset(
                        image,
                        fit: BoxFit.cover,
                        height: 200,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(
              height: 20,
            ),

            //=======================Kitchen must have section=======================
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Kitchen Must Haves",
                      style: TextStyle(
                          fontSize: 17,
                          fontFamily: 'montserrat',
                          // fontStyle: FontStyle.italic,
                          // color: Colors.grey[700],
                          fontWeight: FontWeight.w700)),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),

            SizedBox(
              height: 270,
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
                            quantity: offer[index]['quantity'],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      width: 165,
                      height: 160,
                      margin: EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Stack(
                        // Use Stack to position the favorite icon over the image
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        height: 140,
                                        width: 100,
                                        child: Image.asset(
                                          offer[index]['imagePath'],
                                          // fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  width: 150,
                                  height: 34,
                                  child: Text(
                                    offer[index]['name'],
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      overflow: TextOverflow
                                          .ellipsis, // Apply ellipsis for overflow
                                      // fontFamily: 'montserrat',
                                    ),
                                    maxLines: 2, // Set maximum lines to 2
                                    softWrap:
                                        true, // Allow text to wrap within the given width
                                  ),
                                ),
                                Text(
                                  "₹${offer[index]['price']}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    fontFamily: 'montserrat',
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "₹1067.00",
                                      style: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        fontSize: 13,
                                        fontFamily: 'montserrat',
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Container(
                                      height: 17,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(3),
                                          // color: Colors.green.withOpacity(0.5),
                                          color: orange),
                                      child: Center(
                                        child: const Text(" 75% Off  ",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white,
                                              fontFamily: 'montserrat',
                                            )),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Center(
                                    child: Container(
                                        width: 130,
                                        height: 35,
                                        child: myButton("Add", orange, () {
                                          setState(() {
                                            showSnackBar(
                                                context,
                                                "Item Added to cart Successfully !",
                                                Colors.green);
                                            // data.add({
                                            //   "id":08,
                                            //   "image_path": [offer[index]['imagePath']],
                                            //   "product_name": offer[index]['name'],
                                            //   // "Quantity": offer[index]['quantity'],
                                            //   "price":offer[index]['price'],
                                            //   "shipping": 0,
                                            // });
                                          });
                                        })))
                              ],
                            ),
                          ),
                          Positioned(
                            top: 10,
                            right: 10,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  favorite = !favorite;
                                });
                              },
                              child: Icon(
                                favorite
                                    ? Icons.favorite
                                    : Icons.favorite_border_outlined,
                                size: 23,
                                color: favorite ? Colors.red : null,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            SizedBox(
              height: 20,
            ),
            //=======================small carousel for advertising=======================
            Container(
              width: 380,
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 200.0, // Adjust the height as needed
                  enlargeCenterPage: true, // Enlarge the current image
                  autoPlay: true, // Set to false to disable autoplay
                  aspectRatio: 16 / 9, // Adjust the aspect ratio if desired
                  viewportFraction:
                      0.8, // Adjust the visible portion of each image
                ),
                items: imglist3.map((image) {
                  return Container(
                    child: Center(
                      child: Image.asset(image, fit: BoxFit.cover),
                    ),
                  );
                }).toList(),
              ),
            ),

            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 15,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Suggested for you",
                      style: TextStyle(
                          fontSize: 17,
                          fontFamily: 'montserrat',
                          // fontStyle: FontStyle.italic,
                          // color: Colors.grey[700],
                          fontWeight: FontWeight.w700)),
                ],
              ),
            ),

            SizedBox(
              height: 15,
            ),

            SuggestedForYou(),

            SizedBox(
              height: 15,
            ),
            //=======================continue shopping button=======================
            Container(
              width: 360,
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: myButton("Continue Shopping", orange, () {
                // Scroll to the top when the button is pressed
                _scrollController.animateTo(
                  0.0,
                  duration:
                      Duration(milliseconds: 500), // Adjust duration as needed
                  curve: Curves.easeInOut,
                );
              }),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }

  //best deals for you item
  Widget bestDealsItem() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 8,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => CategoryItem(),
              //     ));
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetails(
                      images: [offer[index]['imagePath']],
                      name: offer[index]['name'],
                      price: "${offer[index]['price']}",
                      quantity: offer[index]['quantity']),
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.only(left: 10, top: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                // border: Border.all(color: Colors.grey,width: 0.3)
              ),
              padding: EdgeInsets.symmetric(
                  horizontal: 8), // Add padding for content spacing
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 3,),
                  Stack(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 100,
                            // width: 100,
                            child: Image.asset(
                              offer[index]['imagePath'],
                              // fit: BoxFit.cover, // Ensure the image fits its container
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: Colors.red,
                          ),
                          padding:
                              EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                          child: Text(
                            "${offer[index]['discount']}% OFF",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.5,
                              fontFamily: "montserrat",
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 32,
                    child: Text(
                      offer[index]['name'],
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        fontFamily: "montserrat",
                        overflow: TextOverflow
                            .ellipsis, // Apply ellipsis for overflow
                      ),
                      maxLines: 2, // Set maximum lines to 2
                      softWrap:
                          true, // Allow text to wrap within the given width
                    ),
                  ),
                  Text(
                    "₹${offer[index]['price']}",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'montserrat',
                    ),
                  ),

                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // exclusive offer
  Widget exclusiveOffer() {
    return Container(
      height: 190,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: offer.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CategoryItem(),
                  ));
            },
            child: Container(
              width: 150,
              // height: 300,
              margin: EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            height: 120,
                            // width: 100,
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
                      width: double.infinity, // Ensure text takes full width
                      height: 36,
                      child: Text(
                        offer[index]['name'],
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                          fontFamily: "montserrat",
                          overflow: TextOverflow
                              .ellipsis, // Apply ellipsis for overflow
                        ),
                        maxLines: 2, // Set maximum lines to 2
                        softWrap:
                            true, // Allow text to wrap within the given width
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Container(
                      height: 16,
                      width: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          // color: Colors.green.withOpacity(0.5),
                          color: orange),
                      child: Center(
                        child: const Text(" 75% Off  ",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontFamily: 'montserrat',
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget categoryList() {
    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: offer.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CategoryItem(),
                  ));
            },
            child: Container(
              width: 170,
              margin: EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
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
                            height: 140,
                            // width: 100,
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
                      width: double.infinity, // Ensure text takes full width
                      height: 36,
                      child: Text(
                        offer[index]['name'],
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          fontFamily: "montserrat",
                          overflow: TextOverflow
                              .ellipsis, // Apply ellipsis for overflow
                        ),
                        maxLines: 2, // Set maximum lines to 2
                        softWrap:
                            true, // Allow text to wrap within the given width
                      ),
                    ),
                    // Text(
                    //   offer[index]['quantity'],
                    //   style: TextStyle(fontSize: 14),
                    // ),
                    // SizedBox(height: 6),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Text(
                    //       "₹${offer[index]['price']}",
                    //       style: TextStyle(
                    //           fontWeight: FontWeight.bold,
                    //           fontSize: 17),
                    //     ),
                    //     Container(
                    //       height: 35,
                    //       width: 50,
                    //       child: myButton("add", orange, () {}),
                    //     ),
                    //
                    //   ],
                    // ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget fashionCategory() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      // color: Colors.grey,
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: fashionList.length,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 170, // Display 3 items in a row
          mainAxisSpacing: 10, // Add spacing between rows
          crossAxisSpacing: 10, // Add spacing between columns
        ),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CategoryItem(),
                  ));
            },
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: AssetImage(fashionList[index]['imagepath']),
                  // fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          // height:30,
                          width: 200,
                          child: Text(
                            fashionList[index]['name'],
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                overflow: TextOverflow.ellipsis),
                            maxLines: 3, // Set maximum lines to 2
                            softWrap: true,
                          ),
                        ),
                        SizedBox(height: 4.0),
                        // Text(
                        //   "₹${fashionList[index]['price']}",
                        //   style: TextStyle(
                        //     color: Colors.white,
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget SuggestedForYou() {
    return SizedBox(
      height: 230,
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
                    price: "${offer[index]['price']}",
                    quantity: offer[index]['quantity'],
                  ),
                ),
              );
            },
            child: Container(
              width: 180,
              // height: 225,
              margin: EdgeInsets.only(left: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Stack(
                // Use Stack to position the favorite icon over the image
                children: [
                  Container(
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
                                height: 140,
                                width: 100,
                                child: Image.asset(
                                  offer[index]['imagePath'],
                                  // fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: 150,
                          height: 33,
                          child: Text(
                            offer[index]['name'],
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              fontFamily: "montserrat",
                              overflow: TextOverflow
                                  .ellipsis, // Apply ellipsis for overflow
                              // fontFamily: 'montserrat',
                            ),
                            maxLines: 2, // Set maximum lines to 2
                            softWrap:
                                true, // Allow text to wrap within the given width
                          ),
                        ),
                        Text(
                          offer[index]['quantity'],
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'montserrat',
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "₹1067.00",
                              style: TextStyle(
                                // fontWeight: FontWeight.bold,
                                fontSize: 12,
                                fontFamily: 'montserrat',
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              "₹${offer[index]['price']}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                fontFamily: 'montserrat',
                              ),
                            ),
                          ],
                        ),

                        SizedBox(
                          height: 7,
                        ),
                        // Center(
                        //     child: Container(
                        //         width: 140,
                        //         height: 40,
                        //         child: myButton("Add", orange, () {})))
                      ],
                    ),
                  ),
                  Positioned(
                    // Positioned widget to position the favorite icon
                    top: 10,
                    right: 10,
                    child: Icon(
                      Icons.favorite_border_outlined,
                      size: 23,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
