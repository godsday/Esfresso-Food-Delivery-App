import 'package:dio/dio.dart';
import 'package:esfresso/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SignupScreenController extends GetxController {
  //TODO: Implement SignupScreenController

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

  var _dio = Dio();

  signup(String name, String email, String mobileNumber) async {
    try {
      final response = await _dio.post("http://172.16.1.205:2000/signup",
          data: {"Name": name, "Email": email, "MobileNumber": mobileNumber});
      Get.toNamed(Routes.OTP_SCREEN,arguments:{name, email , mobileNumber});
      print(response);
      return response;
    } catch (e) {
      print(e.toString());
    }
  }
}
