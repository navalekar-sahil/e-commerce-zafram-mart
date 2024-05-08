import 'package:flutter/material.dart';
import 'package:zafram_mart/component/color.dart';
import 'package:zafram_mart/screen/OrderTrackScreen.dart';
import 'package:zafram_mart/screen/accountScreen.dart';
import 'package:zafram_mart/screen/addToCartScreen.dart';
import 'package:zafram_mart/screen/categoriesScreen.dart';
import 'package:zafram_mart/screen/favoriteScreen.dart';
import 'package:zafram_mart/screen/homeScreen.dart';
import 'package:zafram_mart/screen/sidebar.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int myIndex = 0;

  List<Widget> widgetList = const [
    Home(),
    Category(),
    OrderTrack(),
    // Favorite(),
    Account()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: pink,

      body: Center(child: widgetList[myIndex]),

      //bottom bar
      bottomNavigationBar: BottomNavigationBar(
        elevation: 9,
        onTap: (index) {
          setState(() {
            myIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed, // Set type to fixed
        backgroundColor: Colors.white, // Set background color
        selectedItemColor: orange, // Set selected item color
        unselectedItemColor: Colors.black54, // Set unselected item color
        currentIndex: myIndex, // Set the current selected index
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 22),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_outlined, size: 22),
            label: "Category",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag, size: 22),
            label: "order",
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(
          //     Icons.favorite_border_outlined,
          //     size: 22,
          //   ),
          //   label: "Favorite",
          // ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
              size: 22,
            ),
            label: "Favorite",
          ),
        ],
      ),
    );
  }
}
