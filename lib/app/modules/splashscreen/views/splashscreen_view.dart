

import 'package:esfresso/app/constants/constants.dart';
import 'package:esfresso/app/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/splashscreen_controller.dart';

class SplashscreenView extends GetView<SplashscreenController> {
    final splashscreenController = Get.put(SplashscreenController());

   SplashscreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: maincolor,
      body:  Center(
        child:TextCustomStyle(
          fontStyle: FontStyle.italic,
           textData:"Splash",textSize:50.0.sp,textWeight:FontWeight.bold ,fontFamily:"Lobster",textColor:Colors.white ,
          ),
    ),
    );
  }
}
