import 'package:get/get.dart';

import '../controllers/food_item_screen_controller.dart';

class FoodItemScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FoodItemScreenController>(
      () => FoodItemScreenController(),
    );
  }
}
