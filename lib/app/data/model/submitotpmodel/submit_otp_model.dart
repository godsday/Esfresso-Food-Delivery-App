

import 'dart:convert';

String submitOtpModelTojson(SubmitOtpModel data)=>json.encode(data.toJson());
class SubmitOtpModel{
  

final int otp;
final Map<String,dynamic> data;

  SubmitOtpModel(this.otp, this.data);

  Map<String,dynamic>toJson()=>{
    "otp":otp,
    "data":data
  };
}