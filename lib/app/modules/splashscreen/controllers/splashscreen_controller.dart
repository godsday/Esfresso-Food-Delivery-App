import 'package:esfresso/app/modules/onboardScreen/views/onboard_screen_view.dart';
import 'package:esfresso/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashscreenController extends GetxController {
  //TODO: Implement SplashscreenController

  
  @override
  void onInit() async {
    super.onInit();
    await naviagetoSignUp();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future naviagetoSignUp() async {
    await Future.delayed(Duration(milliseconds: 2400));
    Get.off(()=>OnboardScreenView(),transition: Transition.rightToLeftWithFade,duration: Duration(milliseconds: 1500));
  }
}
