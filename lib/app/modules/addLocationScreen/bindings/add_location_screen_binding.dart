import 'package:get/get.dart';

import '../controllers/add_location_screen_controller.dart';

class AddLocationScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddLocationScreenController>(
      () => AddLocationScreenController(),
    );
  }
}
