import 'package:esfresso/app/constants/constants.dart';
import 'package:esfresso/app/modules/cartScreen/views/cart_screen_view.dart';
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
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
               SizedBox(height: 440.h,),
              Stack(
                alignment: AlignmentDirectional.bottomCenter,
                clipBehavior: Clip.none,
                children: [
                
                  Container(
                    width: 400.w,
                    height: 280.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: maincolor
                    ),
                  ),
                    SizedBox(height: 280.h,
                  width:440.w,
                  child: Image.asset("assets/images/Pattern.png",fit: BoxFit.fill,),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom:88.0,right:35,left:35 ),
                    child: Column(
                      children: [
                     CheckoutList(texts: 'Subtotal', price: '200.0'),
                    Divider(),
                    CheckoutList(texts: 'Tax and fees', price: '5.30'),
                    Divider(),
                    CheckoutList(texts: 'Delivery charge', price: '40'),
                    Divider(),
                    CheckoutList(texts: 'Total', price: '300.0'),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom:10.0),
                    child: ElevatedButton(style: ElevatedButton.styleFrom(
                      fixedSize: Size(340.w, 55.h),
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
                    ),
                      onPressed: (){
                        print("place order");
                      }, child: TextCustomStyle(textData: "Place Your Order", textSize: 20.0.sp, textWeight: FontWeight.bold,textColor: maincolor,fontFamily: "Acme",)),
                  )
                ],
              )
          ] 
      ),
        ),
      )
    );
  }
}
