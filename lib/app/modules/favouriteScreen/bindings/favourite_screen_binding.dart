import 'package:get/get.dart';

import '../controllers/favourite_screen_controller.dart';

class FavouriteScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FavouriteScreenController>(
      () => FavouriteScreenController(),
    );
  }
}
