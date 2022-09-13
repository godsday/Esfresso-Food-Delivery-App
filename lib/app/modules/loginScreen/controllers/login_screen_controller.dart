

import 'package:dio/dio.dart';
import 'package:esfresso/app/data/model/loginVerificationModel/login_otpverfication_model.dart';
import 'package:esfresso/app/data/model/loginmodel/login_model.dart';
import 'package:esfresso/app/routes/app_pages.dart';
import 'package:esfresso/app/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../constants/constants.dart';

class LoginScreenController extends GetxController {
   final formkey = GlobalKey<FormState>();


  RxBool checkData = true.obs;
  final emailMobileController = TextEditingController();

  checkEmailOrNumber(value) {
    try {
      if (int.tryParse(value) == null) {
        // print(int.tryParse(value));
        checkData.value = true;
      } else {
        // print('number $value');
        checkData.value = false;
      }
    } catch (e) {
      print("object");
      print(e);
    }
  }

  
  RxBool visbleOTP = false.obs;
  RxBool visbleButton = true.obs;

 loginTo(emailormobile){
  int number =0;
  if(checkData.value==false){
   number = int.parse(emailormobile.toString()); 
  }
  ApiCalling.instance.login(LoginEmailModel(emailormobile),LoginMobileModel(number));
 }
 
 


verifyLoginOtpto(String pin ,String emailormob){
  
  int numberOtp=0;
  if(checkData.value==false){
   numberOtp = int.parse(emailormob);
  }
  int otp = int.parse(pin);

ApiCalling.instance.verifyLoginOtp(LoginVerificationEmailModel(emailormob,otp),LoginVerifivactionMobModel(numberOtp, otp)); 
}


}




  

// loginTextFieldValidation(value) {
  //   if (checkData.value == true) {
  //     bool emailValid = RegExp(
  //             r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
  //         .hasMatch(emailMobileController.text);
  //     if (value == "") {
  //       return "Please enter Email";
  //     } else if (emailValid == false) {
  //       return "Check your Email";
  //     }
  //     return null;
  //   } else {
  //     String patttern = r'(^(?:[+0]9)?[0-9]{10}$)';
  //     RegExp regExp = RegExp(patttern);
  //     if (value == '') {
  //       return 'Please enter mobile number';
  //     } else if (!regExp.hasMatch(value!)) {
  //       return 'Please enter valid mobile number';
  //     }
  //   }
  // }