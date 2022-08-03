import 'package:esfresso/app/constants/constants.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/onboard_screen_controller.dart';

class OnboardScreenView extends GetView<OnboardScreenController> {
  const OnboardScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
   final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: maincolor,
    
      body: Column(
        children: [
          Container(
            width:width,
            height: height/1.23,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white
            ),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20,),
                SizedBox(
                  // ignore: prefer_const_constructors
                  child: Text("     Order your \n\ Delicious food",style: TextStyle(
                    fontSize: 30,fontWeight: FontWeight.bold,
                  ),),
                )
              ]),
            ),
          )
        ],
      ),
      
    );
  }
}
