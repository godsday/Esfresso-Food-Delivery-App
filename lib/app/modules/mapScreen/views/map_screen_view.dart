import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/map_screen_controller.dart';

class MapScreenView extends GetView<MapScreenController> {
  const MapScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
  
      body: SafeArea(
    child: Text("data"),
        ),
      
    );
  }
}
