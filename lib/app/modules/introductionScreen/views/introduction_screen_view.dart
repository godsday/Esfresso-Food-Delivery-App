import 'package:esfresso/app/constants/constants.dart';
import 'package:esfresso/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

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
            children:[ ClipPath(
              clipper: CurveClipper(),
              child: Container(
                width: width,
                height: height/2,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(70.0),
                        bottomRight: Radius.circular(35.0)),
                    color: maincolor),
                
                 
                  
                  
                 
              ),
            ),
              const Positioned(
                        top: 131,
                        child: Text(
                          "Your favouraite foods delivered \n              fast at your door.",
                          style:  TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),
                        )),
               Positioned(
                        right: 30,
                        top: 40,
                        child: ElevatedButton(
                          onPressed: () {
                            Get.offNamed(Routes.HOME_SCREEN);
                          },
                         
                          style: ElevatedButton.styleFrom(
                              fixedSize: const Size(10, 1),
                              primary: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30))),
                                   child: const Text(
                            "Skip",
                            style:  TextStyle(color: Colors.black),
                          ),
                        )),
                          const Positioned(
                      bottom: -189,
                      child: Image(
                        height: 400,
                        width: 300,
                        image:
                       AssetImage("assets/images/pizza.png") ,
                        fit: BoxFit.cover,
                      ),
                    )
            
            ],
          
          ),
          SizedBox(height: 120,),
      
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
               SizedBox(width: 30,),
              Container(
                width: 80,
                height: 2,
                color: Colors.black,
              ),
              const Text("Sign up with",style:  TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
                 Container(
                width: 80,
                height: 2,
                color: Colors.black,
              ),
               SizedBox(width: 30,),
            ],
          ),
          SizedBox(height: 30,),
          ElevatedButton(
                          onPressed: () {},
                         
                          style: ElevatedButton.styleFrom(
                              fixedSize: const Size(140, 45),
                              primary: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30))),
                                   child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                     children: [
                                      Image.asset(width:30,height:25,"assets/images/google.png"),
                                       const Text(
                            "Google",
                            style:  TextStyle(color: Colors.black),
                          ),
                                     ],
                                   ),
                         
                        ),
                        SizedBox(height: 30,),
                         ElevatedButton(
                          onPressed: () {
                            Get.toNamed(Routes.SIGNUP_SCREEN);
                          },
                         
                          style: ElevatedButton.styleFrom(
                              fixedSize: const Size(290, 55),
                              primary: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30))),
                                   child: const Text(
                            "Start with email or phone",
                            style:  TextStyle(color: Colors.black),
                          ),
                        ),
                        SizedBox(height: 30,),
                         Wrap(children:[ Text("Already have an account?",style:  TextStyle(fontWeight: FontWeight.bold,fontSize: 13)),GestureDetector(child: Text(" Sign in",style:  TextStyle(fontWeight: FontWeight.bold,fontSize: 14)))])
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
