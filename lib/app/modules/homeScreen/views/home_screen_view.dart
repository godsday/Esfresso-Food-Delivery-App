// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:esfresso/app/constants/constants.dart';
import 'package:esfresso/app/constants/itemList.dart';
import 'package:esfresso/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_screen_controller.dart';

class HomeScreenView extends GetView<HomeScreenController> {
  HomeScreenView({Key? key}) : super(key: key);
  final searchController = TextEditingController();
  bool selected = false;
  Color activeColor = maincolor;
  Color inActiveColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
       
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
            //alignment:WrapAlignment.center,
            runAlignment: WrapAlignment.center,
            children: [
              const Text(
                "Deliver to\n Beach Road Calicut",
                style: TextStyle(color: Colors.blueGrey, fontSize: 15),
              ),
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
                        return Row(mainAxisSize: MainAxisSize.min, children: [
                          GestureDetector(
                            onTap: () {
                              selected = true;
                              //print(itemName[index]);
                              print("Clickedd");
                              print(index);
                            },
                            child: Container(
                              width: 80,
                              height: 130,
                              decoration: BoxDecoration(
                                color: selected == true
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
                                          color: selected == true
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
                      },
                    ),
                  ),
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
                  const SizedBox(height: 5),
                  SizedBox(
                    height: 300,
                    child: ListView.builder(
                        ////////////////////////////////////////////rest
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.RESTAURANT_SCREEN);
                                },
                                child: Container(
                                  width: 260,
                                  height: 420,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white),
                                  child: Column(
                                    // mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Stack(
                                        children: [
                                          Container(
                                            width: 250,
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
                                                SizedBox(
                                                    height: 20,
                                                    width: 20,
                                                    child: Image.asset(
                                                      'assets/images/timer.png',
                                                      fit: BoxFit.cover,
                                                    )),
                                                const Text("10-20 mins"),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: const [
                                                MiniContainer(value: "BURGER"),
                                                MiniContainer(value: "CHICKEN"),
                                                MiniContainer(
                                                    value: "FAST FOOD"),
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              )
                            ],
                          );
                        }),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Popular Items",
                    style: TextStyle(
                        color: Color.fromARGB(179, 18, 18, 18),
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  GridView.count(
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                    childAspectRatio: 1,
                    children: List.generate(popularList.length, (index) {
                      return GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.FOOD_ITEM_SCREEN,
                              arguments: popularList[index]);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(10)),
                         // height: 300,
                          child: Column(
                            //  mainAxisSize: MainAxisSize.max,
                            children: [
                              Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Container(
                                    width: 200,
                                    height: 150,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                popularList[index]['image']),
                                            fit: BoxFit.fill)
                                        // color: Colors.amber
                                        ),
                                  ),
                                  Container(
                                    width: 60,
                                    height: 20,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: Colors.white),
                                  )
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    popularList[index]['name'],
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                   Text("data")
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    }),
                  )
                ],
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
