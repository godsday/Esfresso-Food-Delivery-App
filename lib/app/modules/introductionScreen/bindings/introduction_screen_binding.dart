import 'package:get/get.dart';

import '../controllers/introduction_screen_controller.dart';

class IntroductionScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IntroductionScreenController>(
      () => IntroductionScreenController(),
    );
  }
}
