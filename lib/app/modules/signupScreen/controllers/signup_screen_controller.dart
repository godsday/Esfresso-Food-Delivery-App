import 'package:esfresso/app/data/model/signupmodel/signup_model.dart';
import 'package:esfresso/app/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreenController extends GetxController {
 
  final fullNameController = TextEditingController();
  final mobileNumberController = TextEditingController();
  final emailController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  RxBool loading = false.obs;

  signUpFunction(String name, String email, String mobilenumber) {
    if (formkey.currentState!.validate()) {
      int number = int.parse(mobilenumber);

      ApiCalling.instance
          .signup(SignupModel(name: name, email: email, mobilenumber: number));
    }
  }

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

}
