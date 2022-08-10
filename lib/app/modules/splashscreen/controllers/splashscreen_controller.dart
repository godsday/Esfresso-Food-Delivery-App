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
    await Future.delayed(Duration(seconds: 3));
    Get.offNamed(Routes.ONBOARD_SCREEN);
  }
}
