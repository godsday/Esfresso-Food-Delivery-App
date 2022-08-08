import 'package:get/get.dart';

import '../controllers/restaurant_screen_controller.dart';

class RestaurantScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RestaurantScreenController>(
      () => RestaurantScreenController(),
    );
  }
}
