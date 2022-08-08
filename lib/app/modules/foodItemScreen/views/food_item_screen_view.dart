import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/food_item_screen_controller.dart';

class FoodItemScreenView extends GetView<FoodItemScreenController> {
  const FoodItemScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FoodItemScreenView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'FoodItemScreenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
