import 'dart:convert';

ChangePasswordError changePasswordErrorFromJson(String str) => ChangePasswordError.fromJson(json.decode(str));

String changePasswordErrorToJson(ChangePasswordError data) => json.encode(data.toJson());

class ChangePasswordError {
  ChangePasswordError({
    this.message,
    this.data,
    this.code,
  });

  String? message;
  Data? data;
  int? code;

  factory ChangePasswordError.fromJson(Map<String, dynamic> json) => ChangePasswordError(
    message: json["message"],
    data: Data.fromJson(json["data"]),
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": data!.toJson(),
    "code": code,
  };
}

class Data {
  Data({
    this.password,
    this.confirmPassword,
    this.oldPassword,
  });

  String? password;
  String? confirmPassword;
  String? oldPassword;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    password: json["password"],
    confirmPassword: json["confirmPassword"],
    oldPassword: json["oldPassword"],
  );

  Map<String, dynamic> toJson() => {
    "password": password,
    "confirmPassword": confirmPassword,
    "oldPassword": oldPassword,
  };
}
