import 'package:esfresso/app/constants/constants.dart';
import 'package:esfresso/app/modules/signupScreen/controllers/signup_screen_controller.dart';
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
  final otpScreenController = OtpScreenController();
  final signupController = Get.put(SignupScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 50.h,
            ),
            Center(
              child: Container(
                height: 400.h,
                width: 350.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextCustomStyle(
                      textData: "Verication Code",
                      textSize: 35.0,
                      textWeight: FontWeight.bold,
                      fontFamily: "Acme",
                      textColor: maincolor,
                    ),
                    // SizedBox(height: 30.h,),
                    TextCustomStyle(
                      textData: "Please type the verification code\n Here",
                      textSize: 20.0.sp,
                      textWeight: FontWeight.normal,
                      textAlign: TextAlign.center,
                      textColor: Colors.blueGrey,
                    ),
                    // SizedBox(height:10.h,),
                    OTPTextField(
                      controller: otpController,
                      length: 4,
                      width: 500.w,
                      fieldWidth: 60,
                      style: const TextStyle(fontSize: 45),
                      textFieldAlignment: MainAxisAlignment.spaceEvenly,
                      fieldStyle: FieldStyle.box,
                      onChanged: (pin) {},
                      onCompleted: (pin) {
                        otpScreenController.verifyOtpTo(pin);
                      },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 50.0.sp,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextCustomStyle(
                        textData: "Didn't Receive it?",
                        textSize: 18.0.sp,
                        textWeight: FontWeight.w400),
                    TextButton(
                        onPressed: () {
                          otpScreenController.resendOtpTo();
                          otpController.clear();
                        },
                        child: TextCustomStyle(
                            fontFamily: "Acme",
                            textData: "Resend code",
                            textSize: 18.0.sp,
                            textWeight: FontWeight.w400)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextCustomStyle(
                        textData: "Didn't enter right number?",
                        textSize: 18.0.sp,
                        textWeight: FontWeight.w400),
                    TextButton(
                        onPressed: () {
                          signupController.loading.value = false;
                          Get.back();
                        },
                        child: TextCustomStyle(
                            fontFamily: "Acme",
                            textData: "Change number",
                            textSize: 18.0.sp,
                            textWeight: FontWeight.w400)),
                  ],
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
