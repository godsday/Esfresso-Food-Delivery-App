import 'package:dio/dio.dart';
import 'package:esfresso/app/data/model/loginVerificationModel/login_otpverfication_model.dart';
import 'package:esfresso/app/data/model/loginmodel/login_model.dart';
import 'package:esfresso/app/data/model/resendotpmodel/resend_otp_model.dart';
import 'package:esfresso/app/data/model/signupmodel/signup_model.dart';
import 'package:esfresso/app/modules/loginScreen/controllers/login_screen_controller.dart';
import 'package:esfresso/app/modules/signupScreen/controllers/signup_screen_controller.dart';
import 'package:esfresso/app/routes/app_pages.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../constants/constants.dart';
import '../data/model/signupSubmitOtpModel/submit_otp_model.dart';

abstract class ApiServices {
  Future signup(SignupModel user);
  Future verifyOtp(SubmitOtpModel submit);
  Future resendOtp(ResendOtpModel resend);
  Future login(LoginEmailModel email, LoginMobileModel mobile);
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
      if (response.statusCode == 200) {
        Fluttertoast.showToast(msg: "Successful");
        return await Get.toNamed(Routes.HOME_SCREEN);
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        return Fluttertoast.showToast(msg: "User Already Exist");
      }
    }
  }

  @override
  Future resendOtp(ResendOtpModel resend) async {
    var response = await _dio.post(
        "http://${Constants.baseURL}:2000/resend-otp",
        data: resend.toJson());
    try {
      if (response.statusCode == 200) {
        return Fluttertoast.showToast(msg: "Successfull Send");
      }
    } on DioError catch (e) {
      if (e.error) {
        return Fluttertoast.showToast(msg: "Something Went Wrong");
      }
    }
  }

  @override
  Future login(LoginEmailModel email, LoginMobileModel mobile) async {
    final loginController = Get.put(LoginScreenController());

    try {
      if (loginController.checkData.value == true) {
        var response = await _dio.post(
            "http://${Constants.baseURL}:2000/send-emailotp",
            data: email.toJson());
        // {"email": emailormobile});
        if (response.statusCode == 200) {
          loginController.visbleOTP.value = true;
          loginController.visbleButton.value = false;
        }
      } else {
        var response = await _dio.post(
            "http://${Constants.baseURL}:2000/login-mobile",
            data: mobile.toJson()
            // {"mobileNumber": emailormobile}
            );
        if (response.statusCode == 200) {
          loginController.visbleOTP.value = true;
          loginController.visbleButton.value = false;
        }
      }
    } on DioError catch (e) {
      if (e.response!.statusCode == 401) {
        return Fluttertoast.showToast(msg: "Not registered");
      }
    }
  }

//Login otp verification with mobile and email
  verifyLoginOtp(LoginVerificationEmailModel loginEmail,
      LoginVerifivactionMobModel loginMob) async {
    final loginController = Get.put(LoginScreenController());

    try {
      if (loginController.checkData.value == true) {
        var response = await _dio.post(
            "http://${Constants.baseURL}:2000/submit-emailotp",
            data: loginEmail.toJson());

        if (response.statusCode == 200) {
          Get.toNamed(Routes.HOME_SCREEN);
        }
      } else {
        var response = await _dio.post(
            "http://${Constants.baseURL}:2000/submit-loginotp",
            data: loginMob.toJson()
       
            );
        if (response.statusCode == 200) {
          Get.toNamed(Routes.HOME_SCREEN);
        }
      }
    } on DioError catch (e) {
      print(e.toString());
      if (e.response!.statusCode == 401) {
        return Fluttertoast.showToast(msg: "Check Code");
      } else if (e.response!.statusCode == 401) {
        return Fluttertoast.showToast(msg: "Code expired");
      } else {
        return Fluttertoast.showToast(msg: "Something Wrong");
      }
    }
  }
}
