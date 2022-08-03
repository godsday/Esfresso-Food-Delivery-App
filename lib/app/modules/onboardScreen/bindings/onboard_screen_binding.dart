import 'package:get/get.dart';

import '../controllers/onboard_screen_controller.dart';

class OnboardScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnboardScreenController>(
      () => OnboardScreenController(),
    );
  }
}
