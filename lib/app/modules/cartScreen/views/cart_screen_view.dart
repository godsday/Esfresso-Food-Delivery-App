import 'package:esfresso/app/constants/constants.dart';
import 'package:esfresso/app/modules/foodItemScreen/controllers/food_item_screen_controller.dart';
import 'package:esfresso/app/widgets/arithmeticButtons.dart';
import 'package:esfresso/app/widgets/backButtonWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/cart_screen_controller.dart';

class CartScreenView extends GetView<CartScreenController> {
  CartScreenView({Key? key}) : super(key: key);
  final cartScreenController = Get.put(CartScreenController());
  final foodItemScreenController = Get.put(FoodItemScreenController());
  final promoController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    //  cartScreenController.checkdata();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text('Cart'),
        centerTitle: true,
        elevation: 0,
        leading: BackButtonCust(),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 150.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      width: 100.w,
                      height: 110.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: AssetImage(
                                  cartScreenController.cartDatas['image']),
                              fit: BoxFit.cover))),
                  SizedBox(
                    width: 30.w,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cartScreenController.cartDatas['name'] ?? "not found",
                        style: TextStyle(
                            fontSize: 19, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        "Spicy Chicken,beef",
                        style: TextStyle(fontSize: 12, color: Colors.blueGrey),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(" 15.30",
                          style: TextStyle(
                              color: maincolor,
                              fontWeight: FontWeight.bold,
                              fontSize: 20)),
                    ],
                  ),
                  SizedBox(
                    width: 30.w,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 10.w,
                      ),
                      ArithemticButtons(icons: Icons.add, index: false),
                      //

                      Obx(() => Text('${foodItemScreenController.count}',
                          style: TextStyle(
                              fontSize: 19, fontWeight: FontWeight.bold))),
                      //

                      ArithemticButtons(icons: Icons.minimize, index: true),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextField(
                    controller: promoController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30)),
                        hintText: "promo code",
                        suffix: TextButton(
                            style:TextButton.styleFrom(
                              backgroundColor: maincolor,
                             shape: StadiumBorder(),
                            fixedSize: Size(80, 35 )
                            ),
                            onPressed: () {},
                            child: Text("data"))
                        // suffix: Container(
                        //   width: 010.w,
                        //   height: 20.h,
                        //   decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(30),
                        //     color: maincolor,

                        //   ),

                        // ),

                        //suffixText: "Apply"
                        ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () {}, child: Text('Available Promo'))
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CheckoutList(texts: 'Subtotal', price: '200.0'),
                  Divider(),
                  CheckoutList(texts: 'Tax and fees', price: '5.30'),
                  Divider(),
                  CheckoutList(texts: 'Delivery charge', price: '40'),
                  Divider(),
                  CheckoutList(texts: 'Total', price: '300.0'),
                ],
              ),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(), fixedSize: Size(250, 55)),
                onPressed: () {},
                child: Text("CHECKOUT"))
          ],
        ),
      ),
    );
  }
}

class CheckoutList extends StatelessWidget {
  final String texts;
  final String price;
  CheckoutList({Key? key, required this.texts, required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(texts),
        Text(price),
      ],
    );
  }
}
