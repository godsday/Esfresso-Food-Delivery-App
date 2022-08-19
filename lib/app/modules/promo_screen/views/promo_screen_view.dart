import 'package:esfresso/app/constants/constants.dart';
import 'package:esfresso/app/constants/itemList.dart';
import 'package:esfresso/app/widgets/backButtonWidget.dart';
import 'package:esfresso/app/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/promo_screen_controller.dart';

class PromoScreenView extends GetView<PromoScreenController> {
   PromoScreenView({Key? key}) : super(key: key);
 final  promoScreenController = PromoScreenController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('PromoScreenView'),
      //   centerTitle: true,
      // ),
      body: SafeArea(
          child: Padding(
        padding:  EdgeInsets.all(18.0.w),
        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.only(right: 140.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BackButtonCust(),
                  TextCustomStyle(
                      textData: "Offers",
                      textSize: 27.0.sp,
                      textWeight: FontWeight.bold,
                      fontFamily: "Acme",),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: offers.length,
                itemBuilder: (context,index) {
                  return Column(
                    children: [
                      GetBuilder<PromoScreenController>(
                        builder: (context) {
                          return Container(
                              width: 550.w,
                              height: 150.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(27),
                                color: Colors.black12,
                                image:  DecorationImage(
                                    image: AssetImage(offers[index]['image']),
                                    fit: BoxFit.fill),
                              ),
                              child: Padding(
                                padding:  EdgeInsets.all(18.0.w),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        TextCustomStyle(
                                          textData: offers[index]['offertext'],
                                          textSize: 20.0.sp,
                                          textWeight: FontWeight.bold,
                                          textColor: Colors.brown,
                                          fontFamily: 'Satisfy',
                                        ),
                                        ElevatedButton(
                                          style:ElevatedButton.styleFrom(
                                            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                            fixedSize: Size(90.w, 10.h),
                                            minimumSize: Size(90.w, 30.h),
                                            primary: Colors.white
                                          ),
                                            onPressed: () {
                                              promoScreenController.couponApply(offers[index]['index']);
                                              print(promoScreenController.value);
                                            },
                                            child: TextCustomStyle(
                                                textData:promoScreenController.value,
                                                textSize: 13.0.sp,
                                                textWeight: FontWeight.bold,textColor: maincolor,))
                                      ],
                                    ),
                                  ],
                                ),
                              ));
                        }
                      ),
                          SizedBox(height: 20,)
                    ],
                  );
                }
              ),
            )
          ],
        ),
      )),
    );
  }
}
