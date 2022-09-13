import 'package:esfresso/app/constants/constants.dart';
import 'package:esfresso/app/routes/app_pages.dart';
import 'package:esfresso/app/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/introduction_screen_controller.dart';

class IntroductionScreenView extends GetView<IntroductionScreenController> {
  const IntroductionScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              ClipPath(
                clipper: CurveClipper(),
                child: Container(
                  width: width,
                  height: height / 2,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(70.0),
                          bottomRight: Radius.circular(35.0)),
                      color: maincolor),
                ),
              ),
              Positioned(
                  top: 131.h,
                  child: TextCustomStyle(
                    textData:
                        "Your favouraite foods delivered \n  fast at your door.",
                    textSize: 18.0.sp,
                    textWeight: FontWeight.bold,
                    textAlign: TextAlign.center,
                    textColor: Colors.white,
                  )),
              Positioned(
                  right: 30.w,
                  top: 40.h,
                  child: ElevatedButton(
                      onPressed: () {
                        Get.offNamed(Routes.SIGNUP_SCREEN);
                      },
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(85.h, 1.w),
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30))),
                      child: TextCustomStyle(
                        textData: "Sign Up",
                        textSize: 15.0.sp,
                        textWeight: FontWeight.bold,
                        fontFamily: "Acme",
                        textColor: maincolor,
                      ))),
              Positioned(
                bottom: -189.h,
                child: Image(
                  height: 400.h,
                  width: 300.w,
                  image: const AssetImage("assets/images/pizza.png"),
                  fit: BoxFit.cover,
                ),
              )
            ],
          ),
          SizedBox(
            height: 120.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 30.w,
              ),
              Container(
                width: 80.w,
                height: 2.h,
                color: Colors.black,
              ),
              const Text(
                "Sign up with",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              Container(
                width: 80,
                height: 2,
                color: Colors.black,
              ),
              SizedBox(
                width: 30.w,
              ),
            ],
          ),
          SizedBox(
            height: 30.h,
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                fixedSize: Size(140.h, 45.w),
                primary: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.sp))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(width: 30, height: 25, "assets/images/google.png"),
                const Text(
                  "Google",
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.HOME_SCREEN);
              },
              style: ElevatedButton.styleFrom(
                  fixedSize: Size(290.w, 55.h),
                  primary: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30))),
              child: TextCustomStyle(
                textData: "Get Started",
                textSize: 24.0.sp,
                textWeight: FontWeight.bold,
                textColor: blackColor,
              )),
          SizedBox(
            height: 30.h,
          ),
          Wrap(children: [
            Text("Already have an account?",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
            GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.LOGIN_SCREEN);
                },
                child: TextCustomStyle(
                  textData: "Sign In",
                  textSize: 15.0.sp,
                  textWeight: FontWeight.bold,
                  textColor: maincolor,
                  fontFamily: "Acme",
                ))
          ])
        ],
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height / 1.2);
    path.quadraticBezierTo(size.width, size.height, size.width, size.height);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
// class Curve1Clipper extends CustomClipper<Path> {
//   @override
//   getClip(Size size) {
//     Path path = Path();
//     path.lineTo(0, size.height / 1.17);
//     path.quadraticBezierTo(size.width, size.height, size.width, size.height);
//     path.lineTo(size.width, 0);
//     return path;
//   }

//   @override
//   bool shouldReclip(covariant CustomClipper oldClipper) {
//     return true;
//   }
// }
class CurveClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height / 1.3);
    path.quadraticBezierTo(
        size.width / 1.8, size.height, size.width, size.height / 1.3);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }
}
