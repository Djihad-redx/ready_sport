// To parse this JSON data, do
//
//     final registerModel = registerModelFromJson(jsonString);

import 'dart:convert';

RegisterModel registerModelFromJson(String str) => RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
  RegisterModel({
    this.jwt,
    this.message,
  });

  String? jwt;
  String? message;

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
    jwt: json["jwt"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "jwt": jwt,
    "message": message,
  };
}
