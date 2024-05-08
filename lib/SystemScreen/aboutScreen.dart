import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zafram_mart/component/my_widgtes.dart';
import 'package:zafram_mart/screen/searchScreen.dart';

import '../component/color.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchBar=TextEditingController();
    return Scaffold(
      // backgroundColor: pink, // Replace with your desired color
      appBar: AppBar(
        elevation: 0,
        backgroundColor: appbarColor, // Replace with your desired color
        toolbarHeight: 70,
        title:  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            "About",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'montserrat',
              // color: Colors.grey[600]
            ),
          ),
        ),
        actions: [
          myCart()
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 35,
              color: skyBlue,
              child: const Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Icon(
                    Icons.location_pin,
                    size: 20,
                  ),
                  Text(
                    "Mumbra, Thane",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'montserrat'),
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    size: 20,
                  ),
                ],
              ),
            ),
            Container(
              margin:EdgeInsets.symmetric(horizontal: 16) ,
              child: Column(
                children: [
                  SizedBox(height: 10,),
                  Text("About ZafranMart",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 15,fontFamily: 'montserrat',),),
                  SizedBox(height: 10,),
                  Text("Mumbai's Favorite Shopping plateform",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 15,fontFamily: 'montserrat',),),
                  SizedBox(height: 10,),
                  Text("\t\t\t\t\t\tIn today's whirlwind world, convenience reigns supreme. Juggling work, family, social commitments, and a healthy lifestyle leaves little room for battling crowded grocery stores. Zafran Mart steps in, offering a transformative approach – convenient, reliable, and tailored to your specific needs.\n\n\t\t\t\t\t\tImagine a virtual supermarket overflowing with vibrant produce, a well-stocked pantry section, and dedicated aisles for organics and specialty finds. Zafran Mart brings this vision to life through its extensive selection, catering to all dietary preferences. Need gluten-free options, lactose-free alternatives, or organic produce? We have got you covered. Craving your favorite brand or a unique spice? Look no further. Our user-friendly app simplifies browsing, allowing you to search by keyword, explore categories, or discover new items through curated recommendations. It even remembers your past purchases for effortless reordering, saving you valuable time and mental energy.Life doesn't follow a rigid schedule. Zafran Mart understands this, offering flexible delivery options to fit your needs. Whether you require same-day groceries for a last-minute dinner party or prefer weekend delivery, we have you covered. Our app allows you to choose a specific delivery slot, ensuring fresh groceries arrive securely, chilled or frozen as needed. No more wilted greens or melted ice cream – just the freshest ingredients ready for culinary adventures.\n",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14,fontFamily: 'montserrat',),)
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
