import 'package:get/get.dart';

import '../controllers/signup_screen_controller.dart';

class SignupScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupScreenController>(
      () => SignupScreenController(),
    );
  }
}
