import 'package:esfresso/app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize:const Size(410, 840),
      builder: (BuildContext context,Widget?child) {
        return GetMaterialApp(
          title: "Esfresso",
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primarySwatch: Colors.red,primaryColor: maincolor),
        );
      }
    ),
  );
}
