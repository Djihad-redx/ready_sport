// To parse this JSON data, do
//
//     final userLanguage = userLanguageFromJson(jsonString);

import 'dart:convert';

UserLanguage userLanguageFromJson(String str) => UserLanguage.fromJson(json.decode(str));

String userLanguageToJson(UserLanguage data) => json.encode(data.toJson());

class UserLanguage {
  UserLanguage({
    this.message,
    this.data,
    this.code,
  });

  String? message;
  List<Datum>? data;
  int? code;

  factory UserLanguage.fromJson(Map<String, dynamic> json) => UserLanguage(
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    "code": code,
  };
}

class Datum {
  Datum({
    this.text,
    this.symbol,
    this.id,
    this.selected,
    this.image,
  });

  String? text;
  String? symbol;
  int? id;
  bool? selected;
  String? image;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    text: json["text"],
    symbol: json["symbol"],
    id: json["id"],
    selected: json["selected"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "text": text,
    "symbol": symbol,
    "id": id,
    "selected": selected,
    "image": image,
  };
}
