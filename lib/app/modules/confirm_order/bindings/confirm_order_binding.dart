import 'package:get/get.dart';

import '../controllers/confirm_order_controller.dart';

class ConfirmOrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConfirmOrderController>(
      () => ConfirmOrderController(),
    );
  }
}
