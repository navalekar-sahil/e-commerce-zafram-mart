import 'package:flutter/material.dart';
import 'package:zafram_mart/screen/addToCartScreen.dart';
import 'package:zafram_mart/screen/productDetailsScreen.dart';

import '../component/color.dart';
import '../component/my_widgtes.dart';

class CategoryItem extends StatefulWidget {
  const CategoryItem({super.key});

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  List<Map<String, dynamic>> offer = [
    {
      "id": 1,
      "category": "Fruits",
      "name": " Oil (Aashirvad Pure Oil)",
      "quantity": "1 L",
      "price": "176",
      "discount": 50,
      "imagePath": "assets/images2/Aashirrvad Oli.png"
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
    },
    {
      "id": 2,
      "category": "Clothing",
      "name": "Sugar (Good Life Sugar)",
      "quantity": "2 Kg",
      "price": 96,
      "discount": "15",
      "imagePath": "assets/images2/Good Life Sugar.png"
    },
    {
      "id": 3,
      "category": "Clothing",
      "name": "Fortune Oil (1L)",
      "quantity": "5 L ",
      "price": 100,
      "discount": 30,
      "size": ["S", "M", "L"],
      "imagePath": "assets/images2/Cow Ghee big pack.png"
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
      "name": "Fortune Oil (5L)",
      "quantity": "5 L ",
      "price": 450,
      "discount": 30,
      "size": ["S", "M", "L"],
      "imagePath": "assets/images2/Foutune Oil.png"
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
      "id": 1,
      "category": "Clothing",
      "name": "Arabian Dates ,Good Quality Dates For You ",
      "quantity": "2 kg ",
      "price": 320,
      "discount": 20,
      "size": ["M", "X", "L", "XL", "XXL"],
      "imagePath": "assets/images2/Arabian Dates.png"
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
              fontSize: 23,
              fontFamily: 'montserrat',
              fontWeight: FontWeight.w600),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddToCard(),
                      ));
                },
                child: myCart()),
          )
        ],
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 220,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.7,
                ),
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
                              quantity: offer[index]['quantity']),
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      // Add padding for content spacing
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        // boxShadow: [
                        //   BoxShadow(
                        //     color: Colors.grey.withOpacity(0.3),
                        //     spreadRadius: 2,
                        //     blurRadius: 5,
                        //     offset: Offset(0, 3), // changes position of shadow
                        //   ),
                        // ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: AssetImage(offer[index]['imagePath']),
                                  // fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                              height:
                                  10), // Adjust spacing between image and text
                          Container(
                            height: 37,
                            child: Text(
                              offer[index]['name'],
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontFamily: 'montserrat',
                                fontSize: 16,
                              ),
                            ),
                          ),
                          SizedBox(
                              height:
                                  5), // Adjust spacing between title and quantity
                          Text(
                            offer[index]['quantity'],
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'montserrat',
                            ),
                          ),
                          SizedBox(
                              height:
                                  5), // Adjust spacing between quantity and price
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Rs ${offer[index]['price']}",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'montserrat',
                                  fontSize: 17,
                                ),
                              ),
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    color: orange,
                                    shape: BoxShape.rectangle,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(child: Text("Add",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,fontSize: 16),))
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: offer.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
