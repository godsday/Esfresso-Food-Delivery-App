import 'package:esfresso/app/constants/constants.dart';
import 'package:esfresso/app/modules/otp_screen/controllers/otp_screen_controller.dart';
import 'package:esfresso/app/modules/signupScreen/views/signup_screen_view.dart';
import 'package:esfresso/app/routes/app_pages.dart';
import 'package:esfresso/app/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import '../../../widgets/textfield_custom_widget.dart';
import '../controllers/login_screen_controller.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreenView extends GetView<LoginScreenController> {
  LoginScreenView({Key? key}) : super(key: key);
  final loginScreenController = Get.put(LoginScreenController());
  final _otpController = OtpFieldController();
  final _formkey = GlobalKey<FormState>();
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
                  TextCustomStyle(
                    textData: "Login",
                    textSize: 34.0.sp,
                    textWeight: FontWeight.bold,
                    fontFamily: "Acme",
                    textColor: maincolor,
                  ),
                ],
              ),
              SizedBox(
                height: 300.h,
                width: 500.w,
                child: Image.asset("assets/images/login.jpg"),
              ),
              SizedBox(height: 30.h),
              
               
                    Form(
                      key: _formkey,
                      child: Column(children: [
                         Obx(() => 
                            CustomTextField(
                              
                              hinttext: "Email or MobileNumber",
                                controller:
                                    loginScreenController.emailMobileController,
                                validator: (value) {
                                  // loginScreenController.loginTextFieldValidation(value);
                                  if (loginScreenController.checkData.value == true) {
                                    bool emailValid = RegExp(
                                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                        .hasMatch(loginScreenController
                                            .emailMobileController.text);
                                    if (value == "") {
                                      return "Please enter Email";
                                    } else if (emailValid == false) {
                                      return "Check your Email";
                                    }
                                    return null;
                                  } else {
                                    String patttern = r'(^(?:[+0]9)?[0-9]{10}$)';
                                    RegExp regExp = RegExp(patttern);
                                    if (value == '') {
                                      return 'Please enter mobile number';
                                    } else if (!regExp.hasMatch(value!)) {
                                      return 'Please enter valid mobile number';
                                    }
                                  }
                                },
                                onChanged: (value) {
                                  loginScreenController.checkEmailOrNumber(value);
                                },
                                icon: loginScreenController.checkData.isTrue
                                    ? Icons.email
                                    : Icons.mobile_friendly,
                                type: TextInputType.emailAddress,
                                ),
                         ),
                        
                        SizedBox(
                          height: 20.h,
                        ),
                        Obx(() => 
                           Visibility(
                            visible: !loginScreenController.visbleOTP.value,
                              child: Column(
                          
                            children: [
                              Padding(
                                padding:  EdgeInsets.only(right:118.0.w,top: 30.h),
                                child: TextCustomStyle(
                                  
                                  textAlign: TextAlign.start,
                                  textData: "Enter Your OTP",
                                  textSize: 17.0.sp,
                                  textWeight: FontWeight.w400,
                                  textColor: maincolor,
                                  
                                ),
                              ),
                              SizedBox(
                                height: 100.h,
                                width: 250.w,
                                child: OTPTextField(
                                  //width: 70,
                                  fieldWidth: 50,
                                  fieldStyle: FieldStyle.box,
                                  textFieldAlignment: MainAxisAlignment.spaceAround,
                                  controller: _otpController,
                                  length: 4,
                                  onCompleted: (pin){
                                    loginScreenController.verifyLoginOtp(pin,loginScreenController.emailMobileController.text);
                                  },
                                ),
                              ),
                            ],
                          )),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Obx(() => 
                           Visibility(
                            visible:loginScreenController.visbleButton.value,
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formkey.currentState!.validate()) {
                                  loginScreenController.login(
                                      loginScreenController.login(loginScreenController
                                          .emailMobileController.text
                                          .toString()));
                                  print("clicked");
                                  // loginScreenController(loginScreenController.emailMobileController.text.toString());
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  fixedSize: const Size(190, 45),
                                  primary: maincolor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30))),
                              child:  TextCustomStyle(textData: "SEND OTP", textSize: 16.0.sp, textWeight: FontWeight.normal),
                              
                            ),
                          ),
                        ),
                      ])),
                
              
              SizedBox(
                height: 30.h,
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
