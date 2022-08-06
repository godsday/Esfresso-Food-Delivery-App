
import 'package:esfresso/app/constants/constants.dart';
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
          automaticallyImplyLeading: false,
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
                decoration:
                    const BoxDecoration(boxShadow: [const BoxShadow(color: Colors.grey)]),
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
        //  drawer: Drawer(

        //   //backgroundColor: Colors.amber,
        //  ),

        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "What would you like \n to order",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
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
                          boxShadow: [
                            const BoxShadow(color: Colors.grey, blurRadius: 2)
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
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                        GestureDetector(
                          onTap: (){
                          selected=true;
                           

                         print("Clickedd");

                          },
                          child: Container(
                            width: 80,
                            height: 130,
                            decoration: BoxDecoration(
                              color:selected==true? activeColor:inActiveColor,
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const CircleAvatar(
                                  radius: 33,
                                  backgroundImage:
                                      AssetImage("assets/images/profilepic.png"),
                                ),
                                Text("Burger $index",
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
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
                        SizedBox( width: 20,)
                      ]);
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Featured Restaurants",style: TextStyle(fontWeight: FontWeight.bold)),
                    Text("View All >",style: TextStyle(color: maincolor),)
                  ],
                ),
                SizedBox(height: 5,),
              Expanded( child: Container(
                 width: 250,
                      height: 400,
                      decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(20),
                         color: Colors.amber),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: 250,
                          height: 150,
                          decoration: BoxDecoration(
                            image: DecorationImage(image: AssetImage("assets/images/fooditem.png"),fit: BoxFit.cover),
                             borderRadius: BorderRadius.circular(20),
                             

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
                               borderRadius: BorderRadius.circular(20),
                               color: Colors.white),
                               child: Row(
                                 children: [
                                   Text("4.5",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                                   Icon(Icons.star,color: Colors.yellow.shade900,size: 15,)
                                 ],
                               ),
                          ),
                        ),
                        Positioned(
                          top: 15,
                          right: 10,
                          child: Container(
                           
                            width: 30,
                            height:30,
                             alignment: Alignment.center,
                              decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(70),
                               color: Colors.white),
                               child: Icon(Icons.favorite_border,size: 16,),
                               ))

                      ],
                    ),
                    Text("McDonald's",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                    Row(
                      children: [
                            SizedBox(height: 20,
                            width: 20,
                              child: Image.asset('assets/images/bike.png',fit: BoxFit.cover,)),
                              Text("Free delivery"),
                              SizedBox(width: 10,),
                              SizedBox(height: 20,
                            width: 20,
                              child: Image.asset('assets/images/timer.png',fit: BoxFit.cover,)),
                              Text("10-20 mins"),
                              
                              
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: 100,
                          height: 20,
                          color: Colors.grey,
                        )
                      ],
                    )
                  ],
                  
                ),
                
              ),)
              ],
            ),
          ),
        ));
  }
}
