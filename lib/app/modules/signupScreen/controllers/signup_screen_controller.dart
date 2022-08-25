import 'package:dio/dio.dart';
import 'package:esfresso/app/constants/constants.dart';
import 'package:esfresso/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreenController extends GetxController {
  // @override
  // void onInit() {
  //   super.onInit();
  // }
  // @override
  // void onReady() {
  //   super.onReady();
  // }
  // @override
  // void onClose() {
  //   super.onClose();
  // }
  final emailController = TextEditingController();

  final _dio = Dio();
  // signUpValidationOfEmail(value) {
  //   bool emailValid = RegExp(
  //           r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
  //       .hasMatch(emailController.text);
  //   if (value == "") {
  //     return "Please enter Email";
  //   } else if (emailValid == false) {
  //     return "Check your Email";
  //   }
  //   return null;
  // }

  // signUpValidationOfNumber(value) {
  //   String patttern = r'(^(?:[+0]9)?[0-9]{10}$)';
  //   RegExp regExp = RegExp(patttern);
  //   if (value == '') {
  //     return 'Please enter mobile number';
  //   } else if (!regExp.hasMatch(value!)) {
  //     return 'Please enter valid mobile number';
  //   }
  //   return null;
  // }

  signup(String name, String email, String mobileNumber) async {
    try {
      final response = await _dio.post(
          "http://${Constants.baseURL}:2000/signup",
          data: {"Name": name, "Email": email, "MobileNumber": mobileNumber});
      Get.toNamed(Routes.OTP_SCREEN, arguments: {
        "Name": name,
        "Email": email,
        "MobileNumber": mobileNumber
      });
      print(response);
     
      return response;
    } on DioError catch (e) {
     
     if(e.response!.statusCode==409){
      Get.snackbar("User Already", "", snackPosition: SnackPosition.BOTTOM);
     }
    }
  }
}
