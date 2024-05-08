
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:zafram_mart/screen/categoryItemListScreen.dart';
import '../screen/productDetailsScreen.dart';
import 'color.dart';
import 'my_widgtes.dart';

List<Map<String, dynamic>> data = [
  {
    "id": 01,
    "image_path": [
      "assets/images2/CowGhee.png",
      "assets/images2/Cow Ghee big pack.png"
    ],
    "product_name": "Cow Ghee big pack",
    "Quantity": "1.5",
    "price": 670.00,
    "shipping": 0.00
  },
  {
    "id": 02,
    "image_path": ["assets/images2/Sprite.png"],
    "product_name": "Sprite 1L",
    "Quantity": "1.5",
    "price": 40.00,
    "shipping": 30.00
  },
  {
    "id": 03,
    "image_path": ["assets/images2/Rice.png", "assets/images2/Rice.png"],
    "product_name": "Queen Rice 1 Kg",
    "Quantity": "1.5",
    "price": 210.00,
    "shipping": 35.00
  },
];




Widget offerList(List<Map<String, dynamic>> offer) {

  return SizedBox(
    height: 300,
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
            width: 180,
            height: 200,
            margin: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              // color: Colors.white,
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
                      SizedBox(height: 5),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.end,
                      //   children: [
                      //     Icon(
                      //       Icons.favorite_border_outlined,
                      //       size: 23,
                      //     )
                      //   ],
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              height: 150,
                              width: 100,
                              child: Image.asset(
                                offer[index]['imagePath'],
                                // fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                      // Rest of your widget content...
                      SizedBox(
                        height: 8,
                      ),
                      Row(
//                     // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 150,
                            height: 30,
                            child: Text(
                              offer[index]['name'],
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                overflow: TextOverflow
                                    .ellipsis, // Apply ellipsis for overflow
                                // fontFamily: 'montserrat',
                              ),
                              maxLines: 2, // Set maximum lines to 2
                              softWrap:
                                  true, // Allow text to wrap within the given width
                            ),
                          ),

                          // Text(
                          //   offer[index]['quantity'],
                          //   style: TextStyle(
                          //     fontSize: 14,
                          //     fontFamily: 'montserrat',
                          //   ),
                          // ),
                        ],
                      ),
                      Text(
                        "₹${offer[index]['price']}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          fontFamily: 'montserrat',
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "₹1067.00",
                            style: TextStyle(
                              // fontWeight: FontWeight.bold,
                              fontSize: 14,
                              fontFamily: 'montserrat',
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Container(
                            height: 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: Colors.green.withOpacity(0.5),
                            ),
                            child: Center(
                              child: const Text(" 75% Off  ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
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
                              width: 140,
                              height: 40,
                              child: myButton("Add", orange, () {
                                showSnackBar(context, "Item Added to cart Successfully !", Colors.green);                              })))
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

class Rating extends StatefulWidget {
  final double rating;

  const Rating({Key? key, required this.rating}) : super(key: key);

  @override
  State<Rating> createState() => _RatingState();
}

class _RatingState extends State<Rating> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RatingBar.builder(
          initialRating: widget.rating.toDouble(),
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemSize: 20,
          itemBuilder: (context, _) => Icon(
            Icons.star,
            color: CupertinoColors.activeGreen,
          ),
          onRatingUpdate: (double rating) {
            // Do something with the updated rating if needed
          },
        ),
        SizedBox(width: 5),
      ],
    );
  }
}

//categories listView main
Widget categories(BuildContext context,List category) {
  return Container(
    height: 90,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: List.generate(category.length, (index) {
        return Container(
          width: 80, // Set a fixed width for each item
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoryItem(),
                ),
              );
            },
            child: Column(
              children: [
                ClipRect(
                  child: Container(
                    width: 60, // Adjust width as needed
                    height: 50,
                    decoration: BoxDecoration(
                      color: pink,
                      borderRadius: BorderRadius.circular(10)
                    ),// Adjust height as needed
                    child: Image.asset(
                      category[index]["imagepath"],
                      // fit: BoxFit.cover, // Adjust the fit as needed
                    ),
                  ),
                ),

                SizedBox(
                  height: 5,
                ), // Adjust spacing between CircleAvatar and Text
                Text(
                  category[index]["name"],
                  style: TextStyle(
                    fontSize: 12.5,
                    fontWeight: FontWeight.w500,
                    fontFamily: "monsterrat",
                  ),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        );
      }),
    ),
  )
  ;
}
