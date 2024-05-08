import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'bottomNavigationBar.dart';

class ShimmerScreen extends StatefulWidget {
  const ShimmerScreen({super.key});

  @override
  State<ShimmerScreen> createState() => _ShimmerState();
}

class _ShimmerState extends State<ShimmerScreen> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 1), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => BottomBar()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        toolbarHeight: 70,
        title: skeleton(30, 140),
        actions: [
          Padding(
            padding: const EdgeInsets.all(19.0),
            child: skeleton(20, 25),
          ),
          Padding(
            padding: const EdgeInsets.all(19.0),
            child: skeleton(20, 25),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 5,),
              //location
              Row(
                children: [
                  skeleton(15, 20),
                  SizedBox(
                    width: 10,
                  ),
                  skeleton(15, 110)
                ],
              ),
              SizedBox(
                height: 20,
              ),

              //category
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      skeleton(40, 40),
                      SizedBox(
                        height: 10,
                      ),
                      skeleton(10, 40)
                    ],
                  ),
                  Column(
                    children: [
                      skeleton(40, 40),
                      SizedBox(
                        height: 10,
                      ),
                      skeleton(10, 40)
                    ],
                  ),
                  Column(
                    children: [
                      skeleton(40, 40),
                      SizedBox(
                        height: 10,
                      ),
                      skeleton(10, 40)
                    ],
                  ),
                  Column(
                    children: [
                      skeleton(40, 40),
                      SizedBox(
                        height: 10,
                      ),
                      skeleton(10, 40)
                    ],
                  ),
                  Column(
                    children: [
                      skeleton(40, 40),
                      SizedBox(
                        height: 10,
                      ),
                      skeleton(10, 40)
                    ],
                  ),
                  Column(
                    children: [
                      skeleton(40, 40),
                      SizedBox(
                        height: 10,
                      ),
                      skeleton(10, 40)
                    ],
                  ),
                ],
              ),

              SizedBox(
                height: 15,
              ),

              //carousel
              skeleton(175, double.infinity),

              SizedBox(
                height: 13,
              ),

              //best deals for you title
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [skeleton(20, 160), skeleton(20, 50)],
              ),

              SizedBox(
                height: 13,
              ),

              //items
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                itemContainer(),
                SizedBox(
                  width: 7,
                ),
                itemContainer(),
              ]),
              SizedBox(
                height: 7,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                itemContainer(),
                SizedBox(
                  width: 7,
                ),
                itemContainer(),
              ]),
              SizedBox(
                height: 15,
              ),

              // bottom navigation bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Icon(Icons.home,color: Colors.grey[300],),
                      SizedBox(
                        height: 7,
                      ),
                      skeleton(10, 40)
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.dashboard_outlined,color: Colors.grey[300],),
                      SizedBox(
                        height: 7,
                      ),
                      skeleton(10, 40)
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.shopping_bag,color: Colors.grey[300],),
                      SizedBox(
                        height: 7,
                      ),
                      skeleton(10, 40)
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.account_circle_outlined,color: Colors.grey[300],),
                      SizedBox(
                        height: 7,
                      ),
                      skeleton(10, 40)
                    ],
                  ),
                ],
              ),
              SizedBox(height: 5,)
            ],
          ),
        ),
      ),
    );
  }

  Widget skeleton(double height, double width) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[200]!,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(10)
        ),
      ),
    );
  }

  Widget itemContainer() {
    return Container(
      height: 160,
      width: 175,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(height: 3),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: skeleton(100, 170),
          ),
          SizedBox(height: 3),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0,bottom: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    skeleton(10, 80),
                    SizedBox(
                      height: 5,
                    ),
                    skeleton(10, 50),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0,bottom: 8.0),
                child: skeleton(15, 40),
              )
            ],
          )
        ],
      ),
    );
  }
}
