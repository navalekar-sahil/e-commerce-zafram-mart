import 'package:flutter/material.dart';
import 'package:zafram_mart/authentication/loginScreen.dart';
import 'package:zafram_mart/authentication/signUpScreen.dart';
import 'package:zafram_mart/component/color.dart';
import 'package:zafram_mart/component/my_widgtes.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  List<String> location = [
    'Mumbai',
    'Ratnagiri',
    'banglore',
  ];
  String _selectedLocation = 'Mumbai';

  List<String> area = [
    'Mumbra',
    'kalva',
    'thane',
    'diva',
  ];
  String _selectedArea = 'Mumbra';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: pink,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        // iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 100,
            ),
            Image.asset("assets/images/location.png"),
            SizedBox(
              height: 20,
            ),
            Text(
              "Select Your Location",
              style: TextStyle(
                  fontWeight: FontWeight.w700,fontFamily: 'montserrat',
                  fontSize: 24,
                  color: Colors.black87),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Switch on your location to stay in tune with \nwhat’s happening in your area",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w500,fontFamily: 'montserrat',
                  fontSize: 16,
                  color: Colors.grey),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Text(
                  "Your Zone",
                  style: TextStyle(
                      fontSize: 16,
                      // color: Colors.grey[700],
                      fontFamily: 'montserrat',
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
            //dropdown
            DropdownButtonFormField<String>(

              value: _selectedLocation,
              onChanged: (value) {
                setState(() {
                  _selectedLocation = value!;
                });
              },
              items: location
                  .map((option) => DropdownMenuItem<String>(
                        value: option,
                        child: Text(option,style: TextStyle(fontFamily: 'montserrat'),),
                      ))
                  .toList(),
              // dropdownColor: Colors.grey[300],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text("Your Area",
                    style: TextStyle(
                        fontSize: 16,fontFamily: 'montserrat',
                        // color: Colors.grey[700],
                        fontWeight: FontWeight.w700))
              ],
            ),
            DropdownButtonFormField<String>(
              value: _selectedArea,
              onChanged: (value) {
                setState(() {
                  _selectedArea = value!;
                });
              },
              items: area
                  .map((option) => DropdownMenuItem<String>(
                        value: option,
                        child: Text(option,style: TextStyle(fontFamily: 'montserrat'),),
                      ))
                  .toList(),
            ),
            SizedBox(
              height: 30,
            ),
            myButton("Submit", orange, () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SignUp();
              },));
            }),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
