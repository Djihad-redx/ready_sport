import 'dart:convert';

Interests interestsFromJson(String str) => Interests.fromJson(json.decode(str));

String interestsToJson(Interests data) => json.encode(data.toJson());

class Interests {
  Interests({
    this.message,
    this.data,
    this.code,
  });

  String? message;
  Data? data;
  int? code;

  factory Interests.fromJson(Map<String, dynamic> json) => Interests(
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
    this.symbol,
  });

  String? symbol;

  factory Resp.fromJson(Map<String, dynamic> json) => Resp(
    symbol: json["symbol"],
  );

  Map<String, dynamic> toJson() => {
    "symbol": symbol,
  };
}
