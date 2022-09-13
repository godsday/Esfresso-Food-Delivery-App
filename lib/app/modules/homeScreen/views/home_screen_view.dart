

// ignore_for_file: prefer_const_constructors

import 'package:esfresso/app/constants/constants.dart';
import 'package:esfresso/app/constants/itemList.dart';
import 'package:esfresso/app/routes/app_pages.dart';
import 'package:esfresso/app/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_screen_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreenView extends GetView<HomeScreenController> {
  HomeScreenView({Key? key}) : super(key: key);
  final searchController = TextEditingController();
  bool selected = false;
  Color activeColor = maincolor;
  Color inActiveColor = Colors.white;
  final homeCtrlr=HomeScreenController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
       
          toolbarHeight: 90,
          leading: Padding(
            padding: const EdgeInsets.all(18.0),
            child: GestureDetector(
              onTap: () {
                print("Clicked");
                const Drawer();
              },
              child: Container(
                width: 40,
                height: 10,
                decoration: const BoxDecoration(
                    // boxShadow: [ BoxShadow(
                    // color: Colors.grey
                    // )]
                    ),
                child: const Icon(
                  Icons.list_rounded,
                  color: Colors.blueGrey,
                ),
              ),
            ),
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
          // title: Title(color: Colors.black26, child: Wrap(children:[ Text("Deliver to "),Icon(Icons.keyboard_arrow_down)])),
          title: Wrap(
           crossAxisAlignment: WrapCrossAlignment.center,
       
            runAlignment: WrapAlignment.center,
            children: [
               TextCustomStyle(textData: "Deliver to\n Beach Road Calicut", textSize: 16.0.sp, textWeight: FontWeight.w400,textColor: Colors.blueGrey,textAlign: TextAlign.center,),

              const Icon(
                Icons.keyboard_arrow_down,
                color: Colors.blueGrey,
              )
            ],
          ),

          actions: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Container(
                width: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    //color: Colors.amber
                    image: const DecorationImage(
                        image: AssetImage(
                          "assets/images/profilepic.png",
                        ),
                        fit: BoxFit.fill)),
              ),
            )
          ],
          elevation: 0,
        ),
         drawer: Drawer(

          backgroundColor: Colors.amber,
         ),

        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "What would you like \n to order",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    // mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 300,
                        height: 40,
                        child: TextField(
                          controller: searchController,
                          decoration: InputDecoration(
                            hintText: "Find for food or restaurant...",
                            hintStyle: TextStyle(
                                fontSize: 13, color: Colors.blueGrey.shade300),
                            prefixIcon: const Icon(Icons.search),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(14),
                            boxShadow: const [
                              BoxShadow(color: Colors.grey, blurRadius: 2)
                            ]
                            // color: Colors.amber
                            //image: DecorationImage(image: AssetImage("assets/images/filtericon.png",),fit: BoxFit.fill)
                            ),
                        child: Icon(
                          Icons.dns_outlined,
                          color: maincolor,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 150,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        // String data = items[index]['image'];
                        // String nameData = items[index]['itemName'];
                        return GetBuilder<HomeScreenController>(
                          builder: (controller) {
                            return Row(mainAxisSize: MainAxisSize.min, children: [
                              GestureDetector(
                                onTap: () {
                                  controller.itemSelectionChange(items[index]['index']);

                                  // selected = true;
                                  // //print(itemName[index]);
                                  // print("Clickedd");
                                  // print(index);
                                  
                                },
                                child: Container(
                                      width: 80,
                                      height: 130,
                                      decoration: BoxDecoration(
                                        color:controller.cIndex == items[index]['index']
                                            ? activeColor
                                            : inActiveColor,
                                        borderRadius: BorderRadius.circular(40),
                                      ),
                                      child: Column(
                                        //mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          CircleAvatar(
                                            radius: 33,
                                            backgroundImage:
                                                AssetImage(items[index]['image']),
                                          ),
                                          Text(items[index]['itemName'],
                                              style: TextStyle(
                                                  color: controller.cIndex == items[index]['index']
                                                      ? inActiveColor
                                                      : Colors.black,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold)),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          )
                                        ],
                                      ),
                                  
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              )
                            ]);
                          }
                        );
                      },
                    ),
                  ),
              
                  const SizedBox(height: 20),
                  const Text(
                    "Popular Items",
                    style: TextStyle(
                        color: Color.fromARGB(179, 18, 18, 18),
                        fontWeight: FontWeight.bold,fontSize: 20),
                  ),
                   SizedBox(height: 20.h),
                  SizedBox(
                    height: 250.h,
                    child: ListView.builder(
                      physics: ClampingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      // crossAxisCount: 2,
                      // mainAxisSpacing: 15,
                      // crossAxisSpacing: 15,
                      // childAspectRatio: 1,
                      itemCount:popularList.length,
                      itemBuilder:(context, index) {
                        return GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.FOOD_ITEM_SCREEN,
                                arguments: popularList[index]);
                          },
                          child: Row(
                            children: [
                              SizedBox(
                                // decoration: BoxDecoration(
                                //    // color: Colors.amber,
                                //     borderRadius: BorderRadius.circular(10)),
                               // height: 20.h,
                                child:Column(
                                  //  mainAxisSize: MainAxisSize.max,
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 160,
                                      height: 190,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(30),
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  popularList[index]['image']),
                                              fit: BoxFit.fill)
                                          // color: Colors.amber
                                          ),
                                    ),
                                    
                                    Text(
                                      popularList[index]['name'],
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                     Row(
                                      mainAxisAlignment:MainAxisAlignment.spaceAround,
                                       children: [
                                         Icon(Icons.star_rate_sharp,size: 16,color: Colors.yellow.shade900,),
                                         Text('${popularList[index]['rating']} .',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
                                         SizedBox(width: 10.w,
                                         ),
                                      //   Text(".",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
                                          SizedBox(width: 10.w,
                                         ),
                                         Text('${popularList[index]['delivertime']} mins',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 16),)
                                       ],
                                     )
                                  
                                  ],
                                ),
                              ),
                              SizedBox(width: 15.w,)
                            ],
                          ),
                        );
                      }),
                  ),
                  SizedBox(height: 20.h,),

                  Divider(thickness: 2,),
SizedBox(height: 20.h,),
      Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Featured Restaurants",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                      Text(
                        "View All >",
                        style: TextStyle(color: maincolor),
                      )
                    ],
                  ),
                   SizedBox(height: 15.h),
                  SizedBox(
                    height: 300,
                    child: ListView.builder(
                        ////////////////////////////////////////////rest
                        physics:NeverScrollableScrollPhysics(),
                       primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.RESTAURANT_SCREEN);
                                },
                                child: Container(
                                  width: 500.w,
                   
                                  height: 220,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white),
                                  child: Row(
                                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    // mainAxisSize: MainAxisSize.min,
                                    // crossAxisAlignment:
                                    //     CrossAxisAlignment.start,
                                    children: [
                                      Stack(
                                        children: [
                                          Container(
                                            width: 150,
                                            height: 200,
                                            decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      "assets/images/fooditem.png"),
                                                  fit: BoxFit.cover),
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(20),
                                                  topRight:
                                                      Radius.circular(20)),
                                            ),
                                          ),
                                          Positioned(
                                            top: 15,
                                            left: 10,
                                            child: Container(
                                              width: 45,
                                              height: 25,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  color: Colors.white),
                                              child: Wrap(
                                                children: [
                                                  const Text(
                                                    "4.5",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Icon(
                                                    Icons.star,
                                                    color:
                                                        Colors.yellow.shade900,
                                                    size: 15,
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                              top: 15,
                                              right: 10,
                                              child: Container(
                                                width: 30,
                                                height: 30,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            70),
                                                    color: Colors.white),
                                                child: const Icon(
                                                  Icons.favorite_border,
                                                  size: 16,
                                                ),
                                              )),
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10, right: 10, top: 10),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  "McDonald's",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.bold),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.spaceEvenly,
                                                  children: [
                                                    SizedBox(
                                                        height: 20,
                                                        width: 25,
                                                        child: Image.asset(
                                                          'assets/images/bike.png',
                                                          fit: BoxFit.cover,
                                                        )),
                                                    const Text("Free delivery"),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                  
                                                  ],
                                                ),
                                                SizedBox(height: 10.h,),
                                                Row(
                                                  children: [
                                                    Icon(Icons.star_rate_rounded,color: Colors.yellow.shade900,),
                                                    Text("3.0"),
                                                      SizedBox(
                                                        height: 20,
                                                        width: 20,
                                                        child: Image.asset(
                                                          'assets/images/timer.png',
                                                          fit: BoxFit.cover,
                                                        )),
                                                    const Text("20 mins"),
                                                  ],
                                                ),
                                                 SizedBox(
                                                  height: 10.h,
                                                ),
                                                Row(
                                              
                                                  children: const [
                                                    MiniContainer(value: "BURGER"),
                                                    SizedBox(width: 20,),
                                                    MiniContainer(value: "CHICKEN"),
                                                    // MiniContainer(
                                                    //     value: "FAST FOOD"),
                                                  ],
                                                ),
                                                SizedBox(height:10),
                                                Text("Place . 5.0 km")
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height : 15,
                              )
                            ],
                          );
                        }),
                  ),


                ]
              ),
            ),
          ),
        ));
  }
}

class MiniContainer extends StatelessWidget {
  final String value;
  const MiniContainer({Key? key, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 75,
      height: 27,
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(4),
        color: const Color.fromARGB(255, 236, 227, 227),
      ),
      child: Text(value),
    );
  }
}
