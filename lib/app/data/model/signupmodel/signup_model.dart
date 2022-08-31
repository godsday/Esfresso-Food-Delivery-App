import 'dart:convert';

String signupModelToJson(SignupModel data) => json.encode(data.toJson());

class SignupModel {
  final String name;
  final String email;
  final int mobilenumber;

  SignupModel(
      {required this.name, required this.email, required this.mobilenumber});

  Map<String, dynamic> toJson() =>
      {"name": name, "email": email, "mobileNumber": mobilenumber};
}
