import 'package:get/get.dart';

class FoodItemScreenController extends GetxController {
  //TODO: Implement FoodItemScreenController

  dynamic datas =Get.arguments;
  

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
    void decrement() {
      if(count>0){
        count.value--;
      }
    } 
}
