// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.success,
    this.message,
  });

  bool? success;
  Message? message;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    success: json["success"],
    message: Message.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": message!.toJson(),
  };
}

class Message {
  Message({
    this.id,
    this.firstName,
    this.lastName,
    this.username,
    this.phoneNumber,
    this.mail,
    this.datOfBirth,
    this.profilePicture,
    this.preferredCenters,
    this.preferredTimeSlots,
    this.partners,
    this.enabled,
    this.notificationTypes,
  });

  String? id;
  String? firstName;
  String? lastName;
  String? username;
  String? phoneNumber;
  String? mail;
  String? datOfBirth;
  String? profilePicture;
  List<dynamic>? preferredCenters;
  List<dynamic>? preferredTimeSlots;
  List<dynamic>? partners;
  bool? enabled;
  List<dynamic>? notificationTypes;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
    id: json["id"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    username: json["username"],
    phoneNumber: json["phoneNumber"],
    mail: json["mail"],
    datOfBirth: json["datOfBirth"],
    profilePicture: json["profilePicture"],
    preferredCenters: List<dynamic>.from(json["preferredCenters"].map((x) => x)),
    preferredTimeSlots: List<dynamic>.from(json["preferredTimeSlots"].map((x) => x)),
    partners: List<dynamic>.from(json["partners"].map((x) => x)),
    enabled: json["enabled"],
    notificationTypes: List<dynamic>.from(json["notificationTypes"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "firstName": firstName,
    "lastName": lastName,
    "username": username,
    "phoneNumber": phoneNumber,
    "mail": mail,
    "datOfBirth": datOfBirth,
    "profilePicture": profilePicture,
    "preferredCenters": List<dynamic>.from(preferredCenters!.map((x) => x)),
    "preferredTimeSlots": List<dynamic>.from(preferredTimeSlots!.map((x) => x)),
    "partners": List<dynamic>.from(partners!.map((x) => x)),
    "enabled": enabled,
    "notificationTypes": List<dynamic>.from(notificationTypes!.map((x) => x)),
  };
}
