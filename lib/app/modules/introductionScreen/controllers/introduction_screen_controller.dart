import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class IntroductionScreenController extends GetxController with GetTickerProviderStateMixin{
  late AnimationController controller;
  @override
  void onInit() {
     controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 60))
          ..repeat();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }




}




  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     backgroundColor: Colors.black,
  //     body: Stack(
  //       children: [
  //         Center(
  //           child: AnimatedBuilder(
  //             animation: _controller,
  //             builder: (_, child) {
  //               return Transform.rotate(
  //                 angle: _controller.value * 2 * math.pi,
  //                 child: child,
  //               );
  //             },
  //             child: Image.asset(
  //               'assets/moon.jpg',
  //             ),
  //           ),
  //         ),
  //         Center(
  //           child: Container(
  //             decoration: BoxDecoration(
  //               shape: BoxShape.circle,
  //               gradient: LinearGradient(
  //                 begin: Alignment.topRight,
  //                 end: Alignment.bottomLeft,
  //                 colors: [
  //                   Colors.white.withOpacity(1),
  //                   Colors.white.withOpacity(.1),
  //                   Colors.white.withOpacity(.05),
  //                   Colors.black.withOpacity(.05),
  //                   Colors.black.withOpacity(.1),
  //                   Colors.black.withOpacity(.2),
  //                   Colors.black.withOpacity(.3),
  //                   Colors.black.withOpacity(.4),
  //                   Colors.black.withOpacity(.5),
  //                   Colors.black.withOpacity(.6),
  //                   Colors.black.withOpacity(.7),
  //                   Colors.black.withOpacity(.8),
  //                   Colors.black.withOpacity(.9),
  //                   Colors.black.withOpacity(.9),
  //                   Colors.black.withOpacity(1),
  //                   Colors.black.withOpacity(1),
  //                 ],
  //               ),
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }