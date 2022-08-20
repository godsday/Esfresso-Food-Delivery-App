import 'package:esfresso/app/constants/constants.dart';
import 'package:esfresso/app/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

import '../controllers/otp_screen_controller.dart';

class OtpScreenView extends GetView<OtpScreenController> {
  OtpScreenView({Key? key}) : super(key: key);
  OtpFieldController otpController = OtpFieldController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.cleaning_services),
      //   onPressed: () {
      //     print("Floating button was pressed.");
      //     otpController.clear();
      //     // otpController.set(['2', '3', '5', '5', '7']);
      //     // otpController.setValue('3', 0);
      //     // otpController.setFocus(1);
      //   },
      // ),
      body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
              
            children: [
              TextCustomStyle(textData: "Verication Code", textSize: 35.0, textWeight: FontWeight.bold,fontFamily: "Acme",textColor: maincolor,),
              SizedBox(height: 30,),
              TextCustomStyle(textData: "Please type the verification code", textSize: 20.0, textWeight: FontWeight.normal),
              SizedBox(height: 20,),
              Center(
                
                  child: Container(
                    height: 200.h,
                    width: 350.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      // boxShadow: [BoxShadow(
                      //   color: Colors.grey,
                        
                      // )
                      // ]

                    ),
                    child: OTPTextField(
                          length: 4,
                          width: 500.w,
                          fieldWidth: 60,
                          style: TextStyle(fontSize: 45),
                          textFieldAlignment: MainAxisAlignment.spaceEvenly,
                          fieldStyle: FieldStyle.box,
                          // onChanged: (pin){
                          //   print(pin);
                          // },
                          onCompleted: (pin) {
                           print(pin);
                          },
                        ),
                  )),
                  // IconButton(onPressed: (){

                  // }, icon: Icon(Icons.verified_user))
            ],
          )),
    );
  }
}