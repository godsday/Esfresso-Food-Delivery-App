

import 'package:esfresso/app/constants/constants.dart';
import 'package:esfresso/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            height: 650.h,
            decoration: const BoxDecoration(
              borderRadius: const BorderRadius.only(bottomLeft:Radius.circular(30),bottomRight:Radius.circular(30)),
              color: Colors.white
            ),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                   SizedBox(height: 20.h,),
                  SizedBox(
                  // ignore: prefer_const_constructors
                  child: Text("Order your\nDelicious food",
                  textAlign: TextAlign.center,
                  style:
                  //Theme.of(context).textTheme.headlineSmall!..merge(TextStyle(fontSize: 30))
                  TextStyle(
                    fontSize:30.sp,fontWeight: FontWeight.bold,
                    
                   ),
                  ),
                ),
                // Container(
                //   width:300,
                //   height: 400,
                 
                //   decoration: const BoxDecoration(
                    
                //   image: DecorationImage(image:AssetImage("assets/images/deliveryman.png"),fit: BoxFit.cover)
                //   ),
                //   //R child: Image.asset("assets/images/deliveryman.png",fit: BoxFit.fitWidth,),
                // )
                 SizedBox(height: 14.8.h,),
                SizedBox(
                  width: width,
                  height: 510.9.h,
                  child: Image.asset("assets/images/deliveryman.png",fit: BoxFit.fill)),
              ]),
            ),
          ),
           SizedBox(height: 34.h,),
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
