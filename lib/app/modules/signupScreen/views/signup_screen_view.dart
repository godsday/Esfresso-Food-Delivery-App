// ignore_for_file: prefer_const_constructors

import 'package:dio/dio.dart';
import 'package:esfresso/app/constants/constants.dart';
import 'package:esfresso/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/signup_screen_controller.dart';

class SignupScreenView extends GetView<SignupScreenController> {
  SignupScreenView({Key? key}) : super(key: key);
  final fullNameController = TextEditingController();

  final emailController = TextEditingController();
  final mobileNumberController = TextEditingController();
  final otpController = TextEditingController();
  var _dio=Dio();

signup(String name, String email,String mobileNumber)async{
 
try {
 final  response=await _dio.post("http://192.168.0.27:2000/signup",data: {
  "Name":name,
  "Email":email,
  "MobileNumber":mobileNumber
 }
  );
  print(response);
  return response;
  
  

} catch (e) {
  print(e.toString());
}

}
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30),

                Text(
                  "Sign up",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 34,
                      color: maincolor),
                ),
                SizedBox(height: 60),
                CustomTextField(
                    errorMassage: "errorMassage",
                    icon: Icons.person,
                    type: TextInputType.name,
                    controller: fullNameController,
                    labeltext: "Full Name"),
                SizedBox(height: 40),

                CustomTextField(
                    errorMassage: "errorMassage",
                    icon: Icons.email,
                    type: TextInputType.emailAddress,
                    controller: emailController,
                    labeltext: "Email"),
                SizedBox(height: 40),
                CustomTextField(
                    errorMassage: "errorMassage",
                    icon: Icons.phone_android,
                    type: TextInputType.number,
                    controller: mobileNumberController,
                    labeltext: "Mobile Number"),
                SizedBox(height: 40),
                //  CustomTextField(errorMassage: "errorMassage", icon: Icons.key, type: TextInputType.emailAddress, controller: otpController, labeltext: "OTP"),
                // SizedBox(height: 40),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        signup(fullNameController.text.toString(),emailController.text.toString(),mobileNumberController.text.toString());
                      },
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(190, 45),
                          primary: maincolor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30))),
                      child: const Text(
                        "SIGN UP",
                        style: TextStyle(),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Wrap(children: [
                      Text("Already have an account?",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12)),
                      GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.LOGIN_SCREEN);
                          },
                          child: Text(" Log in",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: maincolor)))
                    ]),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType type;
  final String labeltext;
  final IconData icon;
  final String errorMassage;
  final bool val;
// final Function validator;
  const CustomTextField(
      {Key? key,
      //required this.validator,
      this.val = false,
      required this.errorMassage,
      required this.icon,
      required this.type,
      required this.controller,
      required this.labeltext})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      autofocus: false,
      decoration: InputDecoration(
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          labelText: labeltext),
      keyboardType: type,
      obscureText: val,
      textInputAction: TextInputAction.next,
      onSaved: (value) {
        controller.text = value!;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return errorMassage;
        }
        // if(!RegExp(regExp!).hasMatch(value)){
        //   return ("please Enter valid email");
        // }
        return null;
      },
    );
  }
}
