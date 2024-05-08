import 'package:flutter/material.dart';
import 'package:zafram_mart/component/color.dart';
import 'package:zafram_mart/component/offerList_widgtes.dart';

import 'categoryItemListScreen.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController _searchController = TextEditingController();
  bool _isSearching = false; // Declare _isSearching here

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
  List category = [
    {
      "name": "Oil",
      "imagepath": "assets/images2/Aashirrvad Oli.png"
    },
    {"name": "Dairy & Bakery", "imagepath": "assets/images2/Amul Gold.png"},


    {"name": "Fruits & Vegetables", "imagepath": "assets/images/fruit.png"},
    {"name": "Home Care", "imagepath": "assets/images/home.png"},
    {"name": "Flour", "imagepath": "assets/images2/chakki Atta.png"},
    {"name": "Snacks & Branded Food", "imagepath": "assets/images2/Parle-G-1kg.png"},
    {
      "name": "Cold Drink",
      "imagepath": "assets/images2/Sprite 1L.png"
    },
    {"name": "Fashion", "imagepath": "assets/images/fation.png"},
  ];

  @override
  Widget build(BuildContext context) {
    TextEditingController search = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: appbarColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Container(
            height: 45,
            child: TextField(
              autofocus: true,
              autocorrect: true,
              style: TextStyle(color: Colors.white),
              onTap: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) => Search(),));
              },
              controller: _searchController,
              obscureText: false,
              decoration: InputDecoration(
                hintText: "search",
                filled: true,
                fillColor: Colors.white30,
                prefixIcon: Icon(Icons.search, color: Colors.white),
                suffixIcon: Icon(
                  Icons.mic,
                  color: Colors.white,
                  size: 20,
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 8.0),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide.none, // Remove border
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide.none, // Remove border
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide.none, // Remove border
                ),
                hintStyle: TextStyle(color: Colors.white), // Text color
              ),
            ),
          ),
        ),

        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.symmetric(horizontal: 10.0),
        //     child: Icon(Icons.document_scanner),
        //   ),
        // ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text("Popular categories",style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                ),
              ],
            ),
            SizedBox(height: 10,),
            categories(context,category),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Offer of the day",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                      )),
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
            SizedBox(height: 10,),
            offerList(offer),
          ],
        ),
      ),
    );
  }
}
