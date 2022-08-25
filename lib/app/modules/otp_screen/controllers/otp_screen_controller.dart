

import 'package:dio/dio.dart';
import 'package:esfresso/app/constants/constants.dart';
import 'package:esfresso/app/routes/app_pages.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class OtpScreenController extends GetxController {

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
   bool hasError=true;
  final error ="Invalid OTP".obs; 
 final data = {
      "Name": Get.arguments["Name"],
      "Email": Get.arguments["Email"],
      "MobileNumber": Get.arguments["MobileNumber"]
    };
  final _dio = Dio();
  verifyOtp(pin) async {
   
    try {
      var response = await _dio.post(
          "http://${Constants.baseURL}:2000/submitOtp",
          data: {"OTP": pin, "data": data});
      Get.snackbar(
        "Success",
        "Ready to go",
        snackPosition: SnackPosition.BOTTOM,
      );
      
      
      Get.toNamed(Routes.HOME_SCREEN);
    }  on DioError catch(e) {
     
      if(e.response?.statusCode==401){
        return Fluttertoast.showToast(msg:"User Already Exist");
      }
    }
  }

  resendOtp()async{
    try{
     final response =await _dio.post("http://${Constants.baseURL}:2000/resendOtp",
     data:{
      "data":Get.arguments["MobileNumber"]
     }
     );
     
    }on DioError catch(e){
      print(e.response?.statusCode);

    }
  }
}
