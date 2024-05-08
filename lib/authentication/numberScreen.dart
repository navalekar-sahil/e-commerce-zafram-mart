import 'package:flutter/material.dart';
import 'package:zafram_mart/component/color.dart';
import 'package:zafram_mart/component/my_widgtes.dart';

class MobileNumber extends StatelessWidget {
  const MobileNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     extendBodyBehindAppBar: true,
      appBar: AppBar(
        
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
       children: [
         Container(
           color: pink,
           width: double.infinity,
           height: double.infinity,
           child: Container(
             margin: EdgeInsets.symmetric(horizontal: 25),
             child: Column(
               // mainAxisAlignment: MainAxisAlignment.center,
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [

                 SizedBox(height: 140,),
                 Text("Enter your mobile number",style: TextStyle(fontStyle: FontStyle.italic,fontFamily: 'montserrat',fontWeight: FontWeight.w400,fontSize: 26),),
                 SizedBox(height: 30,),
                 Text("Mobile number",style: TextStyle(fontStyle: FontStyle.italic,fontFamily: 'montserrat',fontWeight: FontWeight.w400,fontSize: 16),),
                 SizedBox(height: 15,),
                 countryCode_TextField()
               ],
             ),
           ),
         )
       ],
      ),
      floatingActionButton: floatingButton(() { }),
    );
  }
}
