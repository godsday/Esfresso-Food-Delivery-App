import 'package:esfresso/app/constants/constants.dart';
import 'package:esfresso/app/modules/signupScreen/views/signup_screen_view.dart';
import 'package:esfresso/app/routes/app_pages.dart';
import 'package:esfresso/app/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/login_screen_controller.dart';

class LoginScreenView extends GetView<LoginScreenController> {
  LoginScreenView({Key? key}) : super(key: key);
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //
                  TextCustomStyle(textData: "Login", textSize: 34.0.sp, textWeight: FontWeight.bold,fontFamily: "Acme",textColor: maincolor,),
                  
                ],
              ),
               SizedBox(height: 300.h,width: 500.w,
              child: Image.asset("assets/images/login.jpg"),),
              SizedBox(height: 30.h),
              CustomTextField(
                  screen: "login",
                  errorMassage: "errorMassage",
                  icon: Icons.email,
                  type: TextInputType.emailAddress,
                  controller: emailController,
                  labeltext: "Email"),
              SizedBox(height: 30),
             
              CustomTextField(
                screen: "login",
                errorMassage: "errorMassage",
                icon: Icons.key,
                type: TextInputType.streetAddress,
                controller: passwordController,
                labeltext: "Password",
                val: true,
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        " forget password?",
                        style: TextStyle(color: maincolor),
                      )),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  // Get.toNamed();
                },
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(190, 45),
                    primary: maincolor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
                child: const Text(
                  "LOG IN",
                  style: TextStyle(),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Wrap(children: [
                    const Text("Don't have an account?",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12)),
                    GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.SIGNUP_SCREEN);
                        },
                        child: Text(" Sign up",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                                color: maincolor)))
                  ]),
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
