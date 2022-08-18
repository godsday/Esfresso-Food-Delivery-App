import 'package:esfresso/app/widgets/backButtonWidget.dart';
import 'package:esfresso/app/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/promo_screen_controller.dart';

class PromoScreenView extends GetView<PromoScreenController> {
  const PromoScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('PromoScreenView'),
      //   centerTitle: true,
      // ),
      body: SafeArea(
        child:Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right:140),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BackButtonCust(),
                    TextCustomStyle(textData: "Offers", textSize: 27.0, textWeight: FontWeight.bold)
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Container(
                width: 550.w,
                height: 150.h,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(27),
                 color: Colors.black12,
                  image:const DecorationImage(image:AssetImage("assets/images/offerimg/offerbg.png"),fit: BoxFit.fill),
                ),
               
                
              )
            ],
          ),
        )
      ),
    );
  }
}
