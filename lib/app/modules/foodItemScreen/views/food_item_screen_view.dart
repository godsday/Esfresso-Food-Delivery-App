// ignore_for_file: prefer_const_constructors

import 'package:esfresso/app/constants/constants.dart';
import 'package:esfresso/app/routes/app_pages.dart';
import 'package:esfresso/app/widgets/arithmeticButtons.dart';
import 'package:esfresso/app/widgets/backButtonWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controllers/food_item_screen_controller.dart';

class FoodItemScreenView extends GetView<FoodItemScreenController> {
  
  FoodItemScreenView({Key? key,}) : super(key: key);
  final foodItemController = Get.put(FoodItemScreenController());

  @override
  Widget build(BuildContext context) {
  dynamic cartData = foodItemController.datas;

    print(foodItemController.datas['name']);
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        Stack(
          children: [ 
            Container(
              height: 300,
              decoration: BoxDecoration(
                //color: Colors.amber
                  image: DecorationImage(image: AssetImage(foodItemController.datas['image']),fit: BoxFit.cover)
                  ),
            ),
            Positioned(
              top: 15.h,
              left: 15.w,
              child: BackButtonCust(),
            ),
            
            Container(
              height: 30,
              
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                foodItemController.datas['name'],
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow.shade800,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text("4.5",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "See Review",
                    style: TextStyle(color: maincolor),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.end,
                    children: [
                      Text("₹",
                          style: TextStyle(
                              color: maincolor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                      Text("190.0",
                          style: TextStyle(
                              color: maincolor,
                              fontSize: 27,
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                  SizedBox(
                    width: 150,
                  ),
                  ArithemticButtons(
                    icons: Icons.minimize,
                    index: true,
                  ),
                  Obx(() => Text("${foodItemController.count}",
                      style: TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold))),
                  ArithemticButtons(
                    icons: Icons.add,
                    index: false,
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                  "Brown the beef bettr.Lean ground beef - I like to use 85% lean angus.Garlic - use fresh chopped.Spices - chilli powder,cumin,onion powder.",
                  style: TextStyle(
                      fontSize: 20, color: Colors.blueGrey, height: 1.4))
            ],
          ),
        ),
        SizedBox(
          height: 40,
        ),
        ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
                fixedSize: Size(170, 55),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28))),
            onPressed: () {
              Get.toNamed(Routes.CART_SCREEN,arguments:cartData);
            },
            icon: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Icon(
                  Icons.shopping_bag_outlined,
                  color: maincolor,
                )),
            label: Text("ADD TO CART"))
      ],
    )));
  }
}


