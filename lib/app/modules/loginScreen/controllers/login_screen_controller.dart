

import 'package:dio/dio.dart';
import 'package:esfresso/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../constants/constants.dart';

class LoginScreenController extends GetxController {
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
  final _dio = Dio();
  RxBool checkData = true.obs;
  final emailMobileController = TextEditingController();

  checkEmailOrNumber(value) {
    try {
      if (int.tryParse(value) == null) {
        checkData.value = true;
      } else {
        checkData.value = false;
      }
    } catch (e) {
      print(e);
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
  RxBool visbleOTP = false.obs;
  RxBool visbleButton = true.obs;

  login(emailormobile) async {
    try {
      if (checkData.value == true) {
        var response = await _dio.post(
            "http://${Constants.baseURL}:2000/sendEmailOtp",
            data: {"email": emailormobile});
        if (response.statusCode == 200) {
          visbleOTP.value = true;
          visbleButton.value = false;
        }
      } else {
        var response = await _dio.post(
            "http://${Constants.baseURL}:2000/loginMobile",
            data: {"mobileNumber": emailormobile});
        if (response.statusCode == 200) {
          visbleOTP.value = true;
          visbleButton.value = false;
        }
      }
    } on DioError catch (e) {
      print(e.response);
    }
  }

  verifyLoginOtp(pin, emailOrmobilenumber) async {
    try {
      if (checkData.value == true) {
        var response = await _dio.post(
            "http://${Constants.baseURL}:2000/submitEmailOtp",
            data: {"otp": pin, "email": emailOrmobilenumber});
             Get.toNamed(Routes.HOME_SCREEN);
      } else {
        var response = await _dio.post(
            "http://${Constants.baseURL}:2000/submitLoginOtp",
            data: {"data": emailOrmobilenumber, "OTP": pin});
        Get.toNamed(Routes.HOME_SCREEN);
      }
    } on DioError catch (e) {
      print(e.toString());
      if (e.response!.statusCode == 401) {
        return Fluttertoast.showToast(msg: "Check Code");
      }else if(e.response!.statusCode == 401){
        return Fluttertoast.showToast(msg: "Code expired");

      }else{
        return Fluttertoast.showToast(msg: "Something Wrong");
      }
    }
  }
}
