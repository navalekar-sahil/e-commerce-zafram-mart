import 'package:flutter/material.dart';
import 'package:zafram_mart/SystemScreen/DeliveryAddressScreen.dart';

import '../component/color.dart';
import '../component/my_widgtes.dart';
import '../screen/addToCartScreen.dart';

class AddNewAddress extends StatelessWidget {
  const AddNewAddress({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchbar = TextEditingController();

    TextEditingController name = TextEditingController();
    TextEditingController city = TextEditingController();
    TextEditingController country = TextEditingController();
    TextEditingController state = TextEditingController();
    TextEditingController mobile = TextEditingController();
    TextEditingController zipCode = TextEditingController();
    TextEditingController landmark = TextEditingController();

    return Scaffold(
      backgroundColor: pink,
      // backgroundColor: pink,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: appbarColor,
        toolbarHeight: 70,
        // centerTitle: true,
        title: Text(
          "Delivery Address",
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          myCart()
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                "Full name",
                style: contactStyle(),
              ),
              accountTextfield(controller: name, hintText: "full name"),
              SizedBox(
                height: 10,
              ),
              Text(
                "City",
                style: contactStyle(),
              ),
              accountTextfield(controller: city, hintText: "city"),
              SizedBox(
                height: 10,
              ),
              Text(
                "Country",
                style: contactStyle(),
              ),
              accountTextfield(controller: country, hintText: "country"),
              SizedBox(
                height: 10,
              ),
              Text(
                "State",
                style: contactStyle(),
              ),
              accountTextfield(controller: state, hintText: "state"),
              SizedBox(
                height: 10,
              ),
              Text(
                "Mobile Number",
                style: contactStyle(),
              ),
              accountTextfield(controller: mobile, hintText: "mobiile number"),
              SizedBox(
                height: 10,
              ),
              Text(
                "Zip Code",
                style: contactStyle(),
              ),
              accountTextfield(controller: zipCode, hintText: "zip code"),
              SizedBox(
                height: 10,
              ),
              Text(
                "Landmark",
                style: contactStyle(),
              ),
              accountTextfield(controller: landmark, hintText: "landmark"),
              SizedBox(
                height: 30,
              ),
              myButton("Save Address", orange, () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DeliveryAddressScreen(),
                    ));
              })
            ],
          ),
        ),
      ),
    );
  }

  TextStyle contactStyle() {
    return TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w700,
      fontFamily: 'montserrat',
    );
  }
}
