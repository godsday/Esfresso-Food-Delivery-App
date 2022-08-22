import 'package:esfresso/app/constants/constants.dart';
import 'package:esfresso/app/routes/app_pages.dart';
import 'package:esfresso/app/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../widgets/textfield_custom_widget.dart';
import '../controllers/signup_screen_controller.dart';

class SignupScreenView extends GetView<SignupScreenController> {
  SignupScreenView({Key? key}) : super(key: key);
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileNumberController = TextEditingController();
  final otpController = TextEditingController();
  final signupScreenController = SignupScreenController();
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(28.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                TextCustomStyle(
                  textData: "Sign up",
                  textSize: 30.0.sp,
                  textWeight: FontWeight.w900,
                  fontFamily: "Acme",
                ),
                SizedBox(height: 15.h),
                SizedBox(
                  height: 230.h,
                  width: 400.w,
                  child: Image.asset(
                    'assets/images/signUp.webp',
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 15.h),
                Form(
                    key: _formkey,
                    child: Column(children: [
                      CustomTextField(
                          validator: (value) {
                            if (value == "") {
                              return "Please Enter FullName";
                            }
                          },
                          icon: Icons.person,
                          type: TextInputType.name,
                          controller: fullNameController,
                          labeltext: "Full Name"),
                      SizedBox(height: 30.h),
                      CustomTextField(
                        validator: (value) {
                          bool emailValid = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(emailController.text);
                          if (emailValid == false) {
                            return "Check your Email";
                          }
                        },
                        icon: Icons.email,
                        type: TextInputType.emailAddress,
                        controller: emailController,
                        labeltext: "Email",
                      ),
                      SizedBox(height: 30.h),
                      CustomTextField(
                          validator: (value) {
                            String patttern = r'(^(?:[+0]9)?[0-9]{10}$)';
                            RegExp regExp = RegExp(patttern);
                            if (value == '') {
                              return 'Please enter mobile number';
                            } else if (!regExp.hasMatch(value!)) {
                              return 'Please enter valid mobile number';
                            }
                            return null;
                          },
                          icon: Icons.phone_android,
                          type: TextInputType.number,
                          controller: mobileNumberController,
                          labeltext: "Mobile Number"),
                      SizedBox(height: 40.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              if (_formkey.currentState!.validate()) {
                                signupScreenController.signup(
                                    fullNameController.text.toString(),
                                    emailController.text.toString(),
                                    mobileNumberController.text.toString());
                              }
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
                    ])),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Wrap(children: [
                      const Text("Already have an account?",
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

