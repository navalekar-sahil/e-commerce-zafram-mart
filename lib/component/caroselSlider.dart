import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:zafram_mart/screen/categoryItemListScreen.dart';

import 'color.dart';

class caroselSlider extends StatefulWidget {
  final List<String> imglist;
  final double aspectretio;
   caroselSlider(
      {Key? key, required this.imglist, required this.aspectretio});

  @override
  State<caroselSlider> createState() => _caroselSliderState();
}

class _caroselSliderState extends State<caroselSlider> {
  final CarouselController caroselContrller = CarouselController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          items: widget.imglist
              .map((item) => InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryItem(),));
            },
                child: Image.asset(
                  item,
                  fit: BoxFit.cover,
                  width: double.infinity - 100,
                ),
              ))
              .toList(),
          carouselController: caroselContrller,
          options: CarouselOptions(
            scrollPhysics: const BouncingScrollPhysics(),
            autoPlay: true,
            aspectRatio: widget.aspectretio,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          // top: 180,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.imglist.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => caroselContrller.animateToPage(entry.key),
                child: Container(
                  width: currentIndex == entry.key ? 19 : 8,
                  height: 10.0,
                  margin: EdgeInsets.symmetric(horizontal: 3.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        20), // Circular border radius set to 20
                    color: currentIndex == entry.key ? orange : Colors.white,
                  ),
                ),
              );
            }).toList(),
          ),
        )
      ],
    );
  }
}
