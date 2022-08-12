
import 'package:esfresso/app/constants/constants.dart';
import 'package:esfresso/app/modules/foodItemScreen/controllers/food_item_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArithemticButtons extends StatelessWidget {
  final foodItemController = Get.put(FoodItemScreenController());

  IconData icons;
  bool index;
  ArithemticButtons({Key? key, required this.icons, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (index == true) {
          foodItemController.decrement();
        } else {
          foodItemController.increment();
        }
      },
      child: Container(
        alignment: Alignment.center,
        width: 30,
        height: 30,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: maincolor),
            color: index == true ? Colors.white : maincolor),
        child: Center(child: Icon(icons, color: index == true ? maincolor : Colors.white)),
      ),
    );
  }
}