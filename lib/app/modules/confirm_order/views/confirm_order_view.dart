import 'package:esfresso/app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../widgets/backButtonWidget.dart';
import '../../../widgets/custom_text_widget.dart';
import '../controllers/confirm_order_controller.dart';

class ConfirmOrderView extends GetView<ConfirmOrderController> {
  const ConfirmOrderView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.only(left:15.0.w,right: 130.w,top: 20.h),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                   const BackButtonCust(),
                    TextCustomStyle(
                        textData: "Confirm Order",
                        textSize: 27.0.sp,
                        textWeight: FontWeight.bold,
                        fontFamily: "Acme",),
          ],
        ),
            ),
            Container(
              width: 400.w,
              height: 300.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: maincolor
              ),
            )
        ] 
      ),
      )
    );
  }
}
