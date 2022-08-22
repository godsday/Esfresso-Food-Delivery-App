import 'package:esfresso/app/constants/constants.dart';
import 'package:esfresso/app/routes/app_pages.dart';
import 'package:esfresso/app/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../controllers/add_location_screen_controller.dart';

class AddLocationScreenView extends GetView<AddLocationScreenController> {
  const AddLocationScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    // backgroundColor: HexColor('#ffefef'),
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
               SizedBox(height: 40.h,),
               SizedBox(child: Image.asset("assets/images/mapImg.jpg")),
               SizedBox(height: 20.h,),
               // ignore: prefer_const_constructors
               TextCustomStyle(textData: "Esfresso Uses Your Location \n   to Sw Nearest Restaurent", textSize: 18.0, textWeight: FontWeight.bold,fontFamily: "Acme",),
               SizedBox(height: 20.h,),
              ElevatedButton(onPressed: (){
                Get.toNamed(Routes.MAP_SCREEN);
              },style: ElevatedButton.styleFrom(primary: maincolor,fixedSize: const Size(270, 42)),
               child: const Text("Use Current Location")),
                ElevatedButton(onPressed: (){
                  Get.toNamed(Routes.INTRODUCTION_SCREEN);
                },style: ElevatedButton.styleFrom(primary:HexColor('#ffefef') ,fixedSize: const Size(270, 42),
                side:BorderSide(color: Colors.blueGrey.shade100)),
               child: const Text("Use Another Location",style:  TextStyle(color: Colors.black),)),
                               SizedBox(height: 20.h,),

            ],
          ),
        )
      )
    );
  }
}
