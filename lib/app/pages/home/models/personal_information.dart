import 'dart:convert';

PersonalInfo personalInfoFromJson(String str) => PersonalInfo.fromJson(json.decode(str));

String personalInfoToJson(PersonalInfo data) => json.encode(data.toJson());

class PersonalInfo {
  PersonalInfo({
    this.message,
    this.data,
    this.code,
  });

  String? message;
  List<Datum>? data;
  int? code;

  factory PersonalInfo.fromJson(Map<String, dynamic> json) => PersonalInfo(
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
    this.answers,
    this.text,
    this.symbol,
    this.userAnswer,
    this.type,
  });

  List<Answer>? answers;
  String? text;
  String ?symbol;
  String? userAnswer;
  int? type;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    answers: List<Answer>.from(json["answers"].map((x) => Answer.fromJson(x))),
    text: json["text"],
    symbol: json["symbol"],
    userAnswer: json["userAnswer"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "answers": List<dynamic>.from(answers!.map((x) => x.toJson())),
    "text": text,
    "symbol": symbol,
    "userAnswer": userAnswer,
    "type": type,
  };
}

class Answer {
  Answer({
    this.text,
    this.symbol,
    this.id,
    this.selected,
  });

  String? text;
  String? symbol;
  int ?id;
  dynamic ?selected;

  factory Answer.fromJson(Map<String, dynamic> json) => Answer(
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
