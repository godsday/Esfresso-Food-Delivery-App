

import 'package:esfresso/app/constants/constants.dart';
import 'package:esfresso/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../addLocationScreen/views/add_location_screen_view.dart';
import '../controllers/onboard_screen_controller.dart';

class OnboardScreenView extends GetView<OnboardScreenController> {
   OnboardScreenView({Key? key}) : super(key: key);
  final onboardController=Get.put(OnboardScreenController());
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
            decoration:  BoxDecoration(
              borderRadius: const BorderRadius.only(bottomLeft:Radius.circular(30),bottomRight:Radius.circular(30)),
              color: Colors.grey.withOpacity(0.7)
            ),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                   SizedBox(height: 50.h,),
                  SizedBox(
                  // ignore: prefer_const_constructors
                  child: Text("Order your\nDelicious food",
                  textAlign: TextAlign.center,
                  style:
                  //Theme.of(context).textTheme.headlineSmall!..merge(TextStyle(fontSize: 30))
                  TextStyle(
                    fontFamily: "Acme",
                    fontSize:38.sp,fontWeight: FontWeight.bold,
                    
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
                 SizedBox(height: 58.9.h,),
                SizedBox(
                  width: width,
                  height: 410.9.h,
                  child: Image.asset("assets/images/frst.png",fit: BoxFit.fill)),
              ]),
            ),
          ),
           SizedBox(height: 64.h,),
          GetBuilder<OnboardScreenController>(
            builder: (context) {
              return SlideTransition(
                position: Tween<Offset>(begin:const Offset(4,0),end:Offset.zero).animate(CurvedAnimation(parent: onboardController.buttonAnimationController, curve: Curves.elasticIn)),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(50, 50),
                    backgroundColor: Colors.grey.withOpacity(0.7),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                    
                  ),
                  onPressed: (){
                    onboardController.changeButtonDirection();
               
                  },child :const Icon( Icons.arrow_forward_ios_outlined,color: Colors.black,)),
              );
            }
          )
        ],
      ),
      
    );
  }
}
