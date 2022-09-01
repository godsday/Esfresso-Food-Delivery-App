
import 'dart:convert';

String loginVerificationEmailModel(LoginVerificationEmailModel submit)=>json.encode(submit.toJson());
class LoginVerificationEmailModel{

   final String email;
   final int otp;

  LoginVerificationEmailModel(this.email, this.otp); 

  Map<String,dynamic>toJson()=>{
    "email":email,
    "otp":otp,
    
  };
}
String loginVerificationMobModel(LoginVerifivactionMobModel submit)=>json.encode(submit.toJson());
class LoginVerifivactionMobModel{

  final int mobileNumber;
  final int otp;

  LoginVerifivactionMobModel(this.mobileNumber, this.otp);

  Map<String,dynamic>toJson()=>{
    "otp":otp,
    "data":mobileNumber

  };

}