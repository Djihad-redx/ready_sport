import 'dart:convert';

Hisotry hisotryFromJson(String str) => Hisotry.fromJson(json.decode(str));

String hisotryToJson(Hisotry data) => json.encode(data.toJson());

class Hisotry {
  Hisotry({
    this.message,
    this.data,
    this.code,
  });

  String? message;
  Data? data;
  int? code;

  factory Hisotry.fromJson(Map<String, dynamic> json) => Hisotry(
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
    this.resp,
    this.next,
    this.current,
    this.prev,
    this.count,
  });

  List<Resp>? resp;
  int? next;
  int? current;
  int? prev;
  int? count;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    resp: List<Resp>.from(json["resp"].map((x) => Resp.fromJson(x))),
    next: json["next"],
    current: json["current"],
    prev: json["prev"],
    count: json["count"],
  );

  Map<String, dynamic> toJson() => {
    "resp": List<dynamic>.from(resp!.map((x) => x.toJson())),
    "next": next,
    "current": current,
    "prev": prev,
    "count": count,
  };
}

class Resp {
  Resp({
    this.uuid,
    this.user,
    this.searchedAt,
    this.formattedSearchedAt,
  });

  String? uuid;
  User? user;
  int? searchedAt;
  String? formattedSearchedAt;

  factory Resp.fromJson(Map<String, dynamic> json) => Resp(
    uuid: json["uuid"],
    user: User.fromJson(json["user"]),
    searchedAt: json["searchedAt"],
    formattedSearchedAt: json["formattedSearchedAt"],
  );

  Map<String, dynamic> toJson() => {
    "uuid": uuid,
    "user": user!.toJson(),
    "searchedAt": searchedAt,
    "formattedSearchedAt": formattedSearchedAt,
  };
}

class User {
  User({
    this.name,
    this.accountType,
    this.image,
    this.jobTitle,
    this.isConnection,
    this.uuid,
    this.location,
  });

  String? name;
  int? accountType;
  Image? image;
  String? jobTitle;
  bool? isConnection;
  String? uuid;
  String? location;

  factory User.fromJson(Map<String, dynamic> json) => User(
    name: json["name"],
    accountType: json["accountType"],
    image: Image.fromJson(json["image"]),
    jobTitle: json["jobTitle"],
    isConnection: json["isConnection"],
    uuid: json["uuid"],
    location: json["location"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "accountType": accountType,
    "image": image!.toJson(),
    "jobTitle": jobTitle,
    "isConnection": isConnection,
    "uuid": uuid,
    "location": location,
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
