import 'package:get/get.dart';

import '../controllers/promo_screen_controller.dart';

class PromoScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PromoScreenController>(
      () => PromoScreenController(),
    );
  }
}
