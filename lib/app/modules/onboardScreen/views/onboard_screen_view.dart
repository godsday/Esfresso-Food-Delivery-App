import 'dart:ui';

import 'package:esfresso/app/constants/constants.dart';
import 'package:esfresso/app/routes/app_pages.dart';
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
                  const SizedBox(height: 20,),
                const SizedBox(
                  // ignore: prefer_const_constructors
                  child: Text("     Order your \n Delicious food",style: TextStyle(
                    fontSize: 30,fontWeight: FontWeight.bold,
                  ),),
                ),
                // Container(
                //   width:300,
                //   height: 400,
                 
                //   decoration: const BoxDecoration(
                    
                //   image: DecorationImage(image:AssetImage("assets/images/deliveryman.png"),fit: BoxFit.cover)
                //   ),
                //   //R child: Image.asset("assets/images/deliveryman.png",fit: BoxFit.fitWidth,),
                // )
                const SizedBox(height: 14.8,),
                SizedBox(
                  width: width,
                  height: 500,
                  child: Image.asset("assets/images/deliveryman.png",fit: BoxFit.fill)),
              ]),
            ),
          ),
          const SizedBox(height: 34,),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(50, 50),
              primary: Colors.amber,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
              
            ),
            onPressed: (){
              Get.offAllNamed(Routes.ADD_LOCATION_SCREEN);
            },child :const Icon( Icons.arrow_forward_ios_outlined))
        ],
      ),
      
    );
  }
}
