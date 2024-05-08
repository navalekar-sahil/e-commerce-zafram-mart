import 'package:flutter/material.dart';
import 'package:zafram_mart/screen/myAccountScreen.dart';

import '../component/color.dart';
import '../component/my_widgtes.dart';
import '../screen/addToCartScreen.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: appbarColor,
        toolbarHeight: 70,
        // centerTitle: true,
        title: Text(
          "Setting",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'montserrat',
            // color: Colors.grey[600]
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: myCart()
          )
        ],
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}
