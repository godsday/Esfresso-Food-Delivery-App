
import 'dart:convert';

String resendOtpModelTojson(ResendOtpModel resend) =>json.encode(resend.toJson()); 
class ResendOtpModel{

  final int mobileNumber;

  ResendOtpModel(this.mobileNumber);

  Map<String,dynamic>toJson()=>{
    "data":mobileNumber
  };
  
}