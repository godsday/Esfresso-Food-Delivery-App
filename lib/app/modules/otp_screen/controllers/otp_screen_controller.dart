import 'dart:math';

import 'package:dio/dio.dart';
import 'package:esfresso/app/constants/constants.dart';
import 'package:esfresso/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpScreenController extends GetxController {

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
 final data = {
      "Name": Get.arguments["Name"],
      "Email": Get.arguments["Email"],
      "MobileNumber": Get.arguments["MobileNumber"]
    };
  final _dio = Dio();
  verifyOtp(pin) async {
   
    try {
      var response = await _dio.post(
          "http://${Constants.baseURL}:2000/submitOtp",
          data: {"OTP": pin, "data": data});
      Get.snackbar(
        "Success",
        "Ready to go",
        snackPosition: SnackPosition.BOTTOM,
      );
      print(response);
      Get.toNamed(Routes.HOME_SCREEN);
    }  on DioError catch(e) {
      print(e.response?.statusCode);
      if(e.response?.statusCode==401){
        return print("invalid");
      }
    }
  }

  resendOtp()async{
    try{
     final response =await _dio.post("http://${Constants.baseURL}:2000/resendOtp",
     data:{
      "MobileNumber":Get.arguments["MobileNumber"]
     }
     );
     print(response);
    }on DioError catch(e){
      print(e.response?.statusCode);

    }
  }
}
