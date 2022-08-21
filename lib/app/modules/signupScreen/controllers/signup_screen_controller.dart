import 'package:dio/dio.dart';
import 'package:esfresso/app/constants/constants.dart';
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
      final response = await _dio.post("http://${Constants.baseURL}:2000/signup",
      data: {"Name": name, "Email": email, "MobileNumber": mobileNumber});
      Get.toNamed(Routes.OTP_SCREEN,arguments:{"Name":name,"Email":email,"MobileNumber":mobileNumber});
      print(response);
      // if (response.statusCode==409) {
      //   Get.snackbar("User Already Exist", "");
      //   return;
      // }
      return response;
    } on DioError catch (e){
      // if(DioErrorType.response==409)
        // print("object");
        Get.snackbar("User Already","");
    }
   
  }
  
}
