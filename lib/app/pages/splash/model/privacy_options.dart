// To parse this JSON data, do
//
//     final privacyOption = privacyOptionFromJson(jsonString);

import 'dart:convert';

PrivacyOption privacyOptionFromJson(String str) => PrivacyOption.fromJson(json.decode(str));

String privacyOptionToJson(PrivacyOption data) => json.encode(data.toJson());

class PrivacyOption {
  PrivacyOption({
    this.message,
    this.data,
    this.code,
  });

  String? message;
  List<PrivacyItem>? data;
  int? code;

  factory PrivacyOption.fromJson(Map<String, dynamic> json) => PrivacyOption(
    message: json["message"],
    data: List<PrivacyItem>.from(json["data"].map((x) => PrivacyItem.fromJson(x))),
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    "code": code,
  };
}

class PrivacyItem {
  PrivacyItem({
    this.text,
    this.symbol,
    this.id,
    this.selected,
  });

  String? text;
  String? symbol;
  int? id;
  bool? selected;

  factory PrivacyItem.fromJson(Map<String, dynamic> json) => PrivacyItem(
    text: json["text"],
    symbol: json["symbol"],
    id: json["id"],
    selected: json["selected"],
  );

  Map<String, dynamic> toJson() => {
    "text": text,
    "symbol": symbol,
    "id": id,
    "selected": selected,
  };
}
