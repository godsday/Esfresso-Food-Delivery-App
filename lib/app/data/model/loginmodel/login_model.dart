
import 'dart:convert';

String loginEmailModel(LoginEmailModel loginEmail)=>json.encode(loginEmail.toJson());
class LoginEmailModel{
  final String email;
   LoginEmailModel(this.email);
  Map<String,dynamic>toJson()=>{
    "email":email,
    };
}

String loginMobileModel(LoginMobileModel loginMob)=>json.encode(loginMob.toJson());
class LoginMobileModel{

  final int mobileNumber;
 

  LoginMobileModel(this.mobileNumber);

  Map<String,dynamic>toJson()=>{
    "mobileNumber":mobileNumber
  };
}