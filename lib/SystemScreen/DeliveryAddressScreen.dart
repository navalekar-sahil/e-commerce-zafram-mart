import 'package:flutter/material.dart';
import 'package:zafram_mart/SystemScreen/addNewAddressScreen.dart';

import '../component/color.dart';
import '../component/my_widgtes.dart';
import '../screen/addToCartScreen.dart';

class DeliveryAddressScreen extends StatefulWidget {
  const DeliveryAddressScreen({super.key});

  @override
  State<DeliveryAddressScreen> createState() => _DeliveryAddressScreenState();
}

class _DeliveryAddressScreenState extends State<DeliveryAddressScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController zipCode = TextEditingController();
  TextEditingController landmark = TextEditingController();
  int _selectedAddressIndex = -1;
  List address = [
    {
      "name": "sahil navalekar",
      "city": "mumbra",
      "country": "India",
      "mobile": "1234567890",
      "zipcode": "416602",
      "landmark": "Jama Majjid",
      "_location": "Home"
    },
    {
      "name": "saif shaikh",
      "city": "bhivandi",
      "country": "India",
      "mobile": "1234567890",
      "zipcode": "416602",
      "landmark": "police station",
      "_location": "Office"
    }
  ];
  TextEditingController searchbar = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: pink,
      // backgroundColor: pink,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: appbarColor,
        toolbarHeight: 70,
        // centerTitle: true,
        title: Text(
          "Delivery Address",
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 23),
        ),
        actions: [
          myCart()
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: address.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  height: 140,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey, width: 0.5),
                  ),
                  child: Row(
                    children: [
                      Radio<int>(
                        value: index,
                        activeColor: orange,
                        groupValue: _selectedAddressIndex,
                        onChanged: (int? value) {
                          setState(() {
                            _selectedAddressIndex = value!;
                          });
                        },
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "  ${address[index]["_location"]}",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                ),
                              ),
                              // Spacer(),
                              SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 1 / 2,
                              ),
                              InkWell(
                                onTap: () {
                                  EditAddress();
                                },
                                child: Text(
                                  "Edit",
                                  style: TextStyle(
                                    // color: skyBlue,
                                    color: orange,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                color:orange,
                              ),
                              SizedBox(width: 6),
                              Text(
                                "${address[index]["zipcode"]}, ${address[index]["city"]},${address[index]["landmark"]}",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 17,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.account_circle_outlined,
                                color: orange,
                              ),
                              SizedBox(width: 6),
                              Text(
                                "${address[index]["name"]}",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 17,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.phone_android,
                                color: orange,
                              ),
                              SizedBox(width: 6),
                              Text(
                                "${address[index]["mobile"]},",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 17,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: myButton("Add New Address", orange, () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddNewAddress(),
                  ));
            }),
          )
        ],
      ),
    );
  }
  Future<void> EditAddress(){
    final _formKey = GlobalKey<FormState>();
    return showDialog<void>(
        context: context,
        builder: (context) => AlertDialog(
      content: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          Positioned(
            right: -40,
            top: -40,
            child: InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child:  Container(
                height: 30,
                width: 30,
                decoration:BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.red,
                ),

                child: Icon(Icons.close,size: 20,),
              ),
            ),
          ),
          Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Edit Address",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 19),),
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
                    height:50,
                  ),
                  myButton("Update Address", orange, () {
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
        ],
      ),
    ));
  }

  TextStyle contactStyle() {
    return TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w700,
      fontFamily: 'montserrat',
    );
  }


}
