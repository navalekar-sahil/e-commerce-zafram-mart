import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zafram_mart/component/color.dart';

import '../screen/searchScreen.dart';
import 'offerList_widgtes.dart';

//my button
Widget myButton(String text, Color color, VoidCallback onPressed,
    {Icon? icon}) {
  return Container(
    height: 55,
    width: double.infinity,
    // margin: EdgeInsets.symmetric(horizontal: 25),
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            icon,
            SizedBox(width: 25), // Add space between icon and text
          ],
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              fontFamily: 'montserrat',
            ),
          ),
        ],
      ),
    ),
  );
}

//TextField with flag and country code
Widget countryCode_TextField() {
  return Container(
    width: double.infinity,
    height: 55,
    // margin: EdgeInsets.symmetric(horizontal: 25),
    decoration: BoxDecoration(
      border: Border.all(width: 1, color: Colors.grey),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Row(
      children: [
        Container(
          height: 25,
          width: 35,
          margin: EdgeInsets.only(left: 8),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.asset(
              "assets/images/indflag.png",
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          // height: 100,
          width: 51,
          child: TextField(
            readOnly: true,
            decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                hintText: "+ 91",
                border: OutlineInputBorder(borderSide: BorderSide.none)),
          ),
        ),
        Text(
          "|",
          style: TextStyle(
              fontSize: 35, fontWeight: FontWeight.bold, color: Colors.grey),
        ),
        Expanded(
            child: TextField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            hintText: "Phone Number",
            border: OutlineInputBorder(borderSide: BorderSide.none),
          ),
        ))
      ],
    ),
  );
}

//floating action Button
Widget floatingButton(VoidCallback onpressed) {
  return FloatingActionButton(
    onPressed: onpressed,
    backgroundColor: Colors.orange,
    child: Text(
      ">",
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  );
}

//Normal textfield
Widget mytextField({
  required TextEditingController controller,
  String? hintText,
  bool obscureText = false,
  Widget? suffixIcon,
}) {
  return TextField(
    controller: controller,
    obscureText: obscureText,
    decoration: InputDecoration(
      hintText: hintText,
      filled: true,
      fillColor: Colors.transparent,
      suffixIcon: suffixIcon,
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: blue, width: 2),
          borderRadius: BorderRadius.circular(10.0)),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
  );
}

//search bar
Widget mySearchBar({
  required TextEditingController controller,
  required Color color,
  Color textColor = Colors.white, // Optional parameter for text color
}) {
  // List of text strings
  List<String> searchHints = ['grocery', 'fashion', 'mobile', 'laptop'];

  // Stream controller to emit text values
  StreamController<String> _textStreamController = StreamController<String>();

  // Timer to automate text transition
  late Timer _timer;

  // Function to start emitting text values at regular intervals
  void startTextTransition() {
    int currentIndex = 0;
    _timer = Timer.periodic(Duration(seconds: 2), (timer) {
      currentIndex = (currentIndex + 1) % searchHints.length;
      _textStreamController.add(searchHints[currentIndex]);
    });
  }

  // Start text transition when the widget is initialized
  WidgetsBinding.instance!.addPostFrameCallback((_) {
    startTextTransition();
  });

  return Container(
    height: 45,
    child: StreamBuilder<String>(
      stream: _textStreamController.stream,
      initialData: searchHints[0], // Initial text
      builder: (context, snapshot) {
        return InkWell(
          child: TextField(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Search(),));
            },
            controller: controller,
            obscureText: false,
            readOnly: true,
            decoration: InputDecoration(
              hintText: snapshot.data,
              filled: true,
              fillColor: color,

              prefixIcon: Icon(Icons.search, color: Colors.white),
              suffixIcon: Icon(
                Icons.mic,
                color: Colors.white,
                size: 20,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 8.0),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: BorderSide.none, // Remove border
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: BorderSide.none, // Remove border
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: BorderSide.none, // Remove border
              ),
              hintStyle: TextStyle(color: textColor), // Text color
            ),
          ),
        );
      },
    ),
  );
}

//product details description
Widget description(String title, String description) {
  return Column(
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 160,
            child: Text(
              "$title : ",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black,
              ),
              maxLines: 3,
            ),
          ),
          SizedBox(width: 15), // Fixed space between title and description
          Expanded(
            child: Text(
              description,
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey[800],
              ),
            ),
          ),
        ],
      ),
      SizedBox(height: 6,)
    ],
  );
}




Widget accountTextfield({
  required TextEditingController controller,
  String? hintText,

}) {
  return TextField(
    controller: controller,
    decoration: InputDecoration(
      hintText: hintText,
      // prefixIcon: Icon(Icons.person, color: themeColor),
    ),
    keyboardType: TextInputType.name,
  );

}


//snack-bar
void showSnackBar(BuildContext context, String message, Color color) {
  final scaffoldMessenger = ScaffoldMessenger.of(context);
  scaffoldMessenger.showSnackBar(
    SnackBar(
      content: Text(message),
      duration: const Duration(milliseconds: 2000),
      backgroundColor: color,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
    ),
  );
}


Widget myCart(){
  return Stack(
    children: [
      Container(
        height: 70,
        width: 50,
        child: Icon(
          Icons.shopping_cart,
          size: 29,
        ),
      ),
      Positioned(
        top: 14,
        right: 6,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(10),
          ),
          constraints: BoxConstraints(
            minWidth: 20,
            minHeight: 20,
          ),
          child: Center(
            child: Text(
              '${data.length}', // Replace '5' with the actual number
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    ],
  );
}
