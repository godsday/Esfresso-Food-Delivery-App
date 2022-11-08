import 'dart:async';

import 'package:esfresso/app/constants/itemList.dart';
import 'package:esfresso/app/modules/addLocationScreen/views/add_location_screen_view.dart';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class OnboardScreenController extends GetxController with GetTickerProviderStateMixin {

  late AnimationController buttonAnimationController;



  @override
  void onInit() {

    buttonAnimationController= AnimationController(vsync: this,duration: const Duration(milliseconds:1500 ),)  
    ..addStatusListener((status) {
      if(status==AnimationStatus.forward){

      }
      if(status==AnimationStatus.completed){

Timer(const Duration(milliseconds: 500), () {

      
        
      },);
      }
      
    });
    buttonAnimationController.forward();
    super.onInit();
  }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  @override
  void onClose() {
    buttonAnimationController.dispose();
    super.onClose();
  }

  Offset begin=const Offset(0,-3);

  Offset end=Offset.zero;


  changeButtonDirection()async{

  
     
      //  buttonAnimationController.reset();
     buttonAnimationController.reverse();
    await Future.delayed(const Duration(milliseconds: 500));
    
Get.off(()=>const AddLocationScreenView(),transition: Transition.fadeIn,duration: const Duration(milliseconds: 1200));

 update();


  }

}
