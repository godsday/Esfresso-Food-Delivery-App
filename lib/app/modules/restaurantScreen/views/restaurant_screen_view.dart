import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/restaurant_screen_controller.dart';

class RestaurantScreenView extends GetView<RestaurantScreenController> {
  const RestaurantScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RestaurantScreenView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'RestaurantScreenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
