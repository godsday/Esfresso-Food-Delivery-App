

import 'package:dio/dio.dart';
import 'package:esfresso/app/constants/constants.dart';
import 'package:esfresso/app/data/model/resendotpmodel/resend_otp_model.dart';
import 'package:esfresso/app/data/model/submitotpmodel/submit_otp_model.dart';
import 'package:esfresso/app/services/api_services.dart';
import 'package:get/get.dart';

class OtpScreenController extends GetxController {
    verifyOtpTo(String pin){
      int otp = int.parse(pin);
        final data = {
      "name": Get.arguments["Name"],
      "email": Get.arguments["Email"],
      "mobileNumber": Get.arguments["MobileNumber"]
    };
      ApiCalling.instance.verifyOtp(SubmitOtpModel(otp, data));
    }

 
resendOtpTo(){
final int number=  Get.arguments["MobileNumber"];
    //  }
ApiCalling.instance.resendOtp(ResendOtpModel(number));
}
 
}
