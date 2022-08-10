import 'package:get/get.dart';

import '../controllers/cart_screen_controller.dart';

class CartScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CartScreenController>(
      () => CartScreenController(),
    );
  }
}
