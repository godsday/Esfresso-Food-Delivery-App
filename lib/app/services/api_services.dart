import 'package:dio/dio.dart';
import 'package:esfresso/app/data/model/resendotpmodel/resend_otp_model.dart';
import 'package:esfresso/app/data/model/signupmodel/signup_model.dart';
import 'package:esfresso/app/data/model/submitotpmodel/submit_otp_model.dart';
import 'package:esfresso/app/modules/signupScreen/controllers/signup_screen_controller.dart';
import 'package:esfresso/app/routes/app_pages.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../constants/constants.dart';

abstract class ApiServices {
  Future signup(SignupModel user);
  Future verifyOtp(SubmitOtpModel submit);
  Future resendOtp(ResendOtpModel resend);
}

class ApiCalling implements ApiServices {
  ApiCalling._internal();
  static ApiCalling instance = ApiCalling._internal();
  factory ApiCalling() {
    return instance;
  }
  final _dio = Dio();
  @override
  Future signup(SignupModel user) async {
    final signupController = Get.put(SignupScreenController());
    try {
      final response = await _dio
          .post("http://${Constants.baseURL}:2000/signup", data: user.toJson());
      signupController.loading.value = true;
      if (response.statusCode == 200) {
        Get.toNamed(Routes.OTP_SCREEN, arguments: {
          "Name": user.name,
          "Email": user.email,
          "MobileNumber": user.mobilenumber
        });
      }
      return response;
    } on DioError catch (e) {
      signupController.loading.value = false;
      if (e.response!.statusCode == 409) {
        return Fluttertoast.showToast(msg: "User Already Exist");
      }
    }
  }
  @override
  Future verifyOtp(SubmitOtpModel submit) async {
     
    var response = await _dio.post(
          "http://${Constants.baseURL}:2000/submit-otp",
          data: submit.toJson());
    try {
      if(response.statusCode==200){
       Fluttertoast.showToast(msg: "Successful");
       return await Get.toNamed(Routes.HOME_SCREEN);
      }
         
    }  on DioError catch(e) {
     
      if(e.response?.statusCode==401){
        return Fluttertoast.showToast(msg:"User Already Exist");
      }
    }
  }

  @override
  Future resendOtp(ResendOtpModel resend)async{
     var response =await _dio.post("http://${Constants.baseURL}:2000/resend-otp",
     data:resend.toJson());
    try{
    
    //  {
    //   "data":
     
     
    }on DioError catch(e){
      print(e.response?.statusCode);
    }
  }
}
