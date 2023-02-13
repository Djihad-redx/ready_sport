import 'dart:convert';

UserInfo userInfoFromJson(String str) => UserInfo.fromJson(json.decode(str));

String userInfoToJson(UserInfo data) => json.encode(data.toJson());

class UserInfo {
  UserInfo({
    this.message,
    this.data,
    this.code,
  });

  String? message;
  Data? data;
  int? code;

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
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
    this.firstName,
    this.lastName,
    this.emails,
    this.phoneNumber,
    this.image,
    this.fullName,
    this.position,
    this.location,
    this.uuid,
  });

  String? firstName;
  String? lastName;
  List<Email>? emails;
  String? phoneNumber;
  Image? image;
  String? fullName;
  String? position;
  String? location;
  String? uuid;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    firstName: json["firstName"],
    lastName: json["lastName"],
    emails: List<Email>.from(json["emails"].map((x) => Email.fromJson(x))),
    phoneNumber: json["phoneNumber"],
    image: Image.fromJson(json["image"]),
    fullName: json["fullName"],
    position: json["position"],
    location: json["location"],
    uuid: json["uuid"],
  );

  Map<String, dynamic> toJson() => {
    "firstName": firstName,
    "lastName": lastName,
    "emails": List<dynamic>.from(emails!.map((x) => x.toJson())),
    "phoneNumber": phoneNumber,
    "image": image!.toJson(),
    "fullName": fullName,
    "position": position,
    "location": location,
    "uuid": uuid,
  };
}

class Email {
  Email({
    this.email,
    this.isPrimary,
    this.isValid,
  });

  String? email;
  int? isPrimary;
  int? isValid;

  factory Email.fromJson(Map<String, dynamic> json) => Email(
    email: json["email"],
    isPrimary: json["isPrimary"],
    isValid: json["isValid"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "isPrimary": isPrimary,
    "isValid": isValid,
  };
}

class Image {
  Image({
    this.mime,
    this.url,
    this.isImage,
    this.uuid,
  });

  String? mime;
  String? url;
  bool? isImage;
  String? uuid;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    mime: json["mime"],
    url: json["url"],
    isImage: json["isImage"],
    uuid: json["uuid"],
  );

  Map<String, dynamic> toJson() => {
    "mime": mime,
    "url": url,
    "isImage": isImage,
    "uuid": uuid,
  };
}
