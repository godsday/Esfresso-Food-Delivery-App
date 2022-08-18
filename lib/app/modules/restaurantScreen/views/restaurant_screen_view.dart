import 'package:esfresso/app/constants/itemList.dart';
import 'package:esfresso/app/widgets/backButtonWidget.dart';
import 'package:esfresso/app/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/restaurant_screen_controller.dart';

class RestaurantScreenView extends GetView<RestaurantScreenController> {
  const RestaurantScreenView({Key? key}) : super(key: key);
  // List<> monthModel;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 186, 207, 224),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 18.0, left: 18),
            child: Row(
              children: [BackButtonCust()],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(28.0),
            child: SizedBox(
              height: 240.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextCustomStyle(
                          textData: "McDonald's",
                          textSize: 35.0.sp,
                          textWeight: FontWeight.bold),
                      Icon(Icons.favorite_border)
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star_rate_rounded,
                        size: 26.sp,
                        color: Colors.yellow.shade900,
                      ),
                      const Text('4.5',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                    ],
                  ),
                  Row(
                    children: [
                      TextCustomStyle(
                          textData: "South Indian,Arabian",
                          textSize: 16.4.sp,
                          textWeight: FontWeight.normal)
                    ],
                  ),
                  Row(
                    children: [
                      TextCustomStyle(
                          textData: "Outlet",
                          textSize: 18.0.sp,
                          textWeight: FontWeight.bold),
                      SizedBox(
                        width: 39.w,
                      ),
                      TextCustomStyle(
                          textData: "Calicut",
                          textSize: 18.0.sp,
                          textWeight: FontWeight.normal)
                    ],
                  ),
                  Row(
                    children: [
                      TextCustomStyle(
                          textData: "40 mins",
                          textSize: 18.0.sp,
                          textWeight: FontWeight.bold),
                      SizedBox(
                        width: 25.w,
                      ),
                      TextCustomStyle(
                          textData: "Delivery to kakkancheri",
                          textSize: 18.0.sp,
                          textWeight: FontWeight.normal)
                    ],
                  ),
                  Divider(),
                  Row(
                    children: [
                      TextCustomStyle(
                          textData: " 0-3 kms ",
                          textSize: 18.0.sp,
                          textWeight: FontWeight.bold),
                      TextCustomStyle(
                          textData: " |20 Delivery fee will apply",
                          textSize: 17.0.sp,
                          textWeight: FontWeight.w400),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: width,
              height: 400.h,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
                      child: Padding(
                        padding:  EdgeInsets.all(10.0),
                        child: ListView(
                          children: [
                            TextCustomStyle(textData: "MENU", textSize: 17.0.sp, textWeight: FontWeight.normal,textColor: Colors.grey.shade400,),
                            SizedBox(height: 10.h,),
                            ListView.builder(
          //scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          itemCount: popularList.length,
          itemBuilder: (BuildContext context, int index) {
            return _buildPlayerModelList(popularList[index]);
          },)
                            // ExpansionTile(title: TextCustomStyle(textData: "recommended", textSize: 20.0, textWeight: FontWeight.bold),
                            //                            )
                            
                          //  Row(
                          //    children: [
                          //      TextCustomStyle(textData:"South Indian", textSize: 26.0.sp, textWeight: FontWeight.bold),
                          //    ],
                          //  )
                          ],
                        ),
                      ),
            ),
          )
        ],
      )),
    );
  
}  Widget _buildPlayerModelList(items) {
  print(items);
    return Card(
      child: ExpansionTile(
        title: Text(
          'Recommended',
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
        ),
        children: <Widget>[
          ListTile(
            title: Text(
              items['name'],
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
          )
        ],
      ),
    );
  }
}

