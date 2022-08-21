import 'package:dio/dio.dart';
import 'package:esfresso/app/constants/constants.dart';
import 'package:esfresso/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpScreenController extends GetxController {
  //TODO: Implement OtpScreenController

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
final  _dio =Dio();
  verifyOtp(pin)async{
 final data={
  "Name":Get.arguments["Name"],
  "Email":Get.arguments["Email"],
  "MobileNumber":Get.arguments["MobileNumber"]
  };
    try{
var response = await _dio.post("http://${Constants.baseURL}:2000/submitOtp",
data: {
    "OTP":pin,
   "data" :data
   
}

);
Get.snackbar( "Success","Ready to go",
  snackPosition: SnackPosition.BOTTOM,);
 print(response);
Get.toNamed(Routes.HOME_SCREEN);
 }
 catch(e){
   
print(e);
    }

   
}
}
