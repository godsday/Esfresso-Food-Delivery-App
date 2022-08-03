

import 'package:esfresso/app/constants/constants.dart';
import 'package:flutter/material.dart';

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
        child:const  Text(
            'Splashs',
            style: TextStyle(fontSize: 20),
          ),
      ),
    );
  }
}
