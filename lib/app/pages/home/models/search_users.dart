import 'dart:convert';

SearchUsers searchUsersFromJson(String str) => SearchUsers.fromJson(json.decode(str));

String searchUsersToJson(SearchUsers data) => json.encode(data.toJson());

class SearchUsers {
  SearchUsers({
    this.message,
    this.data,
    this.code,
  });

  String? message;
  Data? data;
  int? code;

  factory SearchUsers.fromJson(Map<String, dynamic> json) => SearchUsers(
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
  });

  List<Resp>? resp;
  int? next;
  int? current;
  int? prev;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    resp: List<Resp>.from(json["resp"].map((x) => Resp.fromJson(x))),
    next: json["next"],
    current: json["current"],
    prev: json["prev"],
  );

  Map<String, dynamic> toJson() => {
    "resp": List<dynamic>.from(resp!.map((x) => x.toJson())),
    "next": next,
    "current": current,
    "prev": prev,
  };
}

class Resp {
  Resp({
    this.name,
    this.accountType,
    this.image,
    this.jobTitle,
    this.isConnection,
    this.uuid,
  });

  String? name;
  int? accountType;
  Image? image;
  String? jobTitle;
  bool? isConnection;
  String? uuid;

  factory Resp.fromJson(Map<String, dynamic> json) => Resp(
    name: json["name"],
    accountType: json["accountType"],
    image: Image.fromJson(json["image"]),
    jobTitle: json["jobTitle"],
    isConnection: json["isConnection"],
    uuid: json["uuid"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "accountType": accountType,
    "image": image!.toJson(),
    "jobTitle": jobTitle,
    "isConnection": isConnection,
    "uuid": uuid,
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
