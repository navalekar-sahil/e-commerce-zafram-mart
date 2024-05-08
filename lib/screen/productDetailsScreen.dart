import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:zafram_mart/component/color.dart';
import 'package:zafram_mart/component/my_widgtes.dart';
import 'package:zafram_mart/screen/bottomNavigationBar.dart';
import 'package:zafram_mart/screen/paymentScreen.dart';
import '../SystemScreen/DeliveryAddressScreen.dart';
import '../SystemScreen/couponsScreen.dart';
import '../component/offerList_widgtes.dart';
import 'addToCartScreen.dart';
import 'categoryItemListScreen.dart';

class ProductDetails extends StatefulWidget {
  final List<String> images;
  final String name;
  final String price;
  final String quantity;

  const ProductDetails({
    Key? key,
    required this.name,
    required this.price,
    required this.quantity,
    required this.images,
  }) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
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

  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;
  bool isExpanded = false;
  int counters = 1;


  bool isFavorite = false;
  double totalAmount = 0.0;

  void _incrementCounter() {
    setState(() {
      counters++;
      totalAmount = (double.tryParse(widget.price)! * counters);
    });
  }

  void _decrementCounter() {
    setState(() {
      if (counters > 0) {
        counters--;
        if (counters == 0) {
          counters = 1;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController searchbar = TextEditingController();
    return Scaffold(
      // backgroundColor: pink,
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        // elevation: 0,
        backgroundColor: appbarColor,
        toolbarHeight: 70,
        title: Container(
            height: 40,
            child: mySearchBar(
              controller: searchbar,
              color: Colors.white30,
            )),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddToCard(),
                    ));
              },
              child: myCart()
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              width: 290,
              child: Text(
                "${widget.name}",
                style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    overflow: TextOverflow.ellipsis,
                    fontFamily: 'montserrat',
                    fontSize: 18),
                maxLines: 2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17.0),
              child: Text(
                "${widget.quantity}",
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    overflow: TextOverflow.ellipsis,
                    fontFamily: 'montserrat',
                    fontSize: 14),
                maxLines: 2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Rating(rating: 5),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                         setState(() {
                           isFavorite?isFavorite=false:isFavorite=true;
                         });
                        },
                        child: isFavorite? Icon(Icons.favorite_border_outlined,
                            size: 26):Icon(Icons.favorite,color: Colors.red,
                            size: 26)
                        ,
                      ),
                      IconButton(
                        onPressed: () {
                          Share.share(
                              'check out my website https://example.com',
                              subject: 'Look what I made!');
                        },
                        icon: Icon(Icons.share, size: 23),
                      ),
                    ],
                  )
                ],
              ),
            ),
            //=========================================image view===============================================
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    // color: productBgColor,
                  ),
                  child: Stack(
                    children: [
                      CarouselSlider(
                        items: widget.images.map((item) {
                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Stack(
                              children: [
                                Container(
                                  child: Image.asset(
                                    item,
                                    height: 320,
                                    width: double.infinity,
                                  ),
                                ),
                                Positioned(
                                  top: 15,
                                  left: 15,
                                  child: Container(
                                    height: 30,
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      shape: BoxShape.rectangle,
                                      color: Colors
                                          .red, // Customize color as needed
                                    ),
                                    child: const Center(
                                      child: Text(
                                        " 15% ", // Customize discount percentage
                                        style: TextStyle(
                                          color: Colors
                                              .white, // Customize text color
                                          fontSize: 15, // Customize font size
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                        carouselController: carouselController,
                        options: CarouselOptions(
                          scrollPhysics: const BouncingScrollPhysics(),
                          autoPlay: widget.images.length > 1,
                          aspectRatio: 1.3,
                          viewportFraction: 1,
                          onPageChanged: (index, reason) {
                            setState(() {
                              currentIndex = index;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 15,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: widget.images.asMap().entries.map((entry) {
                      return GestureDetector(
                        onTap: () =>
                            carouselController.animateToPage(entry.key),
                        child: Container(
                          width: currentIndex == entry.key ? 17 : 7,
                          height: 7,
                          margin: const EdgeInsets.symmetric(horizontal: 3),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: currentIndex == entry.key ? orange : blue,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 15,
                ),
                Row(
                  children: [
                    const SizedBox(width: 10),
                    Text(
                      "₹${widget.price}",
                      style: const TextStyle(
                        fontSize: 20,
                        fontFamily: 'montserrat',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Spacer(),

                //counter
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    width: 90,
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                            onTap: _decrementCounter,
                            child: Text(
                              "-",
                              style: TextStyle(
                                  fontSize: 39, fontWeight: FontWeight.w500),
                            )),
                        // const SizedBox(width: 1.5),
                        Container(
                          height: 30,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.black.withOpacity(0.1),
                              width: 1.0,
                            ),
                          ),
                          child: Center(
                              child: Text('$counters',
                                  style: const TextStyle(fontSize: 15))),
                        ),
                        InkWell(
                            onTap: _incrementCounter, child: Icon(Icons.add)),
                      ],
                    ),
                  ),
                ),






              ],
            ),
            SizedBox(
              height: 6,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, bottom: 10),
              child: RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: 'M.R.P: ',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'montserrat',
                          color: Colors.black),
                    ),
                    TextSpan(
                      text: '₹350',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'montserrat',
                        color: Colors.black,
                        decoration: TextDecoration.lineThrough,
                      ), // Change color to your desired color
                    ),
                    TextSpan(
                      text: ' (Incl. of all taxes)',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'montserrat',
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),

            Divider(),

            ExpansionTile(
              title: const Text('Description',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'montserrat',
                      fontSize: 16)),
              trailing: Icon(
                isExpanded
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down,
              ),
              onExpansionChanged: (expanded) {
                setState(() {
                  isExpanded = expanded;
                });
              },
              children: [
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Fortune Sunlite Refined Sunflower Oil is one of the most commonly used ingredients in an Indian household. This Oil is ideal for your cooking needs. Use sunflower oil for roast potatoes, Yorkshire puddings, stir-frying vegetables or even in bakes as a replacement for butter. Buy Fortune Sunlite Refined Sunflower Oil online now!",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'montserrat',
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Disclaimer",
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'montserrat',
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "Despite our attempts to provide you with the most accurate information possible, the actual packaging, ingredients and colour of the product may sometimes vary. Please read the label, directions and warnings carefully before use.",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'montserrat',
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            //======================================product Information==================================================
            const Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                "Product Information ",
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'montserrat',
                    fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AnimatedSize(
                      duration: const Duration(milliseconds: 300),
                      child: ConstrainedBox(
                        constraints: isExpanded
                            ? const BoxConstraints()
                            : const BoxConstraints(maxHeight: 150),
                        child: SingleChildScrollView(
                          physics:
                              NeverScrollableScrollPhysics(), // This line disables scrolling when not expanded
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "General Information",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.blueGrey,
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              description("Brand", "Fortune"),
                              description("Manufacture", "fortune"),
                              description(
                                "Sold By",
                                "Zafran mart",
                              ),
                              description(
                                "Zafran Mart Customer Care Email",
                                "zafran.mart@gmail.com",
                              ),
                              description(
                                "Manufacturer Address",
                                "Zafran mart Mumbra,Thane,",
                              ),
                              description(
                                "Manufacturer Email",
                                "fartune@gmail.com",
                              ),
                              description(
                                "Zafran Mart Customer Care Phone",
                                "123 4567 890",
                              ),
                              description(
                                "Country of Origin",
                                "India",
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Product Details",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.blueGrey),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              description(
                                "Net Quantity",
                                "1 L",
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    isExpanded
                        ? TextButton(
                            onPressed: () => setState(() => isExpanded = false),
                            child: Container(
                              height: 30,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border:
                                    Border.all(color: Colors.grey, width: 1),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Center(
                                child: const Text('Less Details',
                                    style: TextStyle(
                                        fontFamily: 'montserrat',
                                        color: Colors.blueAccent,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14)),
                              ),
                            ),
                          )
                        : TextButton(
                            onPressed: () => setState(() => isExpanded = true),
                            child: Container(
                              height: 30,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border:
                                    Border.all(color: Colors.grey, width: 1),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Center(
                                child: const Text('More Details',
                                    style: TextStyle(
                                        fontFamily: 'montserrat',
                                        color: Colors.blueAccent,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14)),
                              ),
                            )),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 10),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Article ID :",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'montserrat',
                          fontSize: 16)),
                  SizedBox(width: 10),
                  Text(
                    "490000052",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'montserrat',
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18),

            Container(
              height: 45,
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: myButton("Add To Cart", Colors.orangeAccent, () {
                showSnackBar(
                    context, "Item Successfully Added to cart", Colors.green);
              }),
            ),
            SizedBox(
              height: 10,
            ),

            Container(
              height: 45,
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: myButton("Buy Now", orange, () {
                _showBottomSheet(context);
              }),
            ),

            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Similar Products",
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
            offerList(offer),

            const SizedBox(height: 18),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Frequently Bought Together",
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
            offerList(offer),
          ],
        ),
      ),

      // bottomNavigationBar: Container(
      //   padding: const EdgeInsets.all(8),
      //   color: Colors.white,
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: [
      //       Expanded(
      //         child: ElevatedButton(
      //           onPressed: () {
      //             showSnackBar(context, "Item Added to cart successfully", Colors.green);
      //           },
      //           style: ElevatedButton.styleFrom(backgroundColor: orange),
      //           child: const Text(
      //             'Add to Cart',
      //             style: TextStyle(
      //                 fontFamily: 'montserrat', fontWeight: FontWeight.w600),
      //           ),
      //         ),
      //       ),
      //       const SizedBox(width: 16),
      //       Expanded(
      //         child: ElevatedButton(
      //           onPressed: () {
      //             _showBottomSheet(context);
      //           },
      //           style: ElevatedButton.styleFrom(
      //             backgroundColor: Colors.green,
      //           ),
      //           child: const Text(
      //             'Buy Now',
      //             style: TextStyle(
      //                 fontFamily: 'montserrat', fontWeight: FontWeight.w600),
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
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
                                "₹${(widget.price * counters)}",
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

Widget offerList(List<Map<String, dynamic>> offer) {
  return Container(
    height: 220,
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
                          height: 100,
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
                    height: 36,
                    child: Text(
                      offer[index]['name'],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        overflow: TextOverflow.ellipsis,
                      ),
                      maxLines: 2,
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
                      GestureDetector(
                        onTap: () {
                          showSnackBar(context,
                              "Item Added to cart successfully", Colors.green);
                        },
                        child: Container(
                          height: 38,
                          width: 38,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: orange,
                          ),
                          child: Center(
                            child: Text("Add",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700),)
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
  );
}
