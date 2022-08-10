import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CartScreenController extends GetxController {
  //TODO: Implement CartScreenController

    dynamic cartDatas =Get.arguments;
  // checkdata(){
  //    if(cartDatas==null){
  //     return Container();
  // }

  // }
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
}
