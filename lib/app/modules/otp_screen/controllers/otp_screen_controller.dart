import 'package:dio/dio.dart';
import 'package:get/get.dart';

class OtpScreenController extends GetxController {
  //TODO: Implement OtpScreenController

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
final  _dio =Dio();
  verifyOtp(pin)async{
    
    try{
var response = await _dio. post("http://172.16.1.205:2000/signup",
data: {
  "OTP":pin,
  "Name":Get.arguments[];

}
);

    }catch(e){
   print(e);

    }
  }
}
