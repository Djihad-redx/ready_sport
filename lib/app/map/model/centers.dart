import 'dart:convert';

CentersModel centersModelFromJson(String str) => CentersModel.fromJson(json.decode(str));

String centersModelToJson(CentersModel data) => json.encode(data.toJson());

class CentersModel {
  CentersModel({
    this.success,
    this.data,
  });

  bool? success;
  List<CenterData>? data;

  factory CentersModel.fromJson(Map<String, dynamic> json) => CentersModel(
    success: json["success"],
    data: List<CenterData>.from(json["data"].map((x) => CenterData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class CenterData {
  CenterData({
    this.id,
    this.name,
    this.email,
    this.address,
    this.postalCode,
    this.city,
    this.country,
    this.phoneNumber,
    this.localisation,
    this.enabled,
    this.activities,
  });

  String? id;
  String? name;
  String? email;
  String? address;
  int? postalCode;
  String? city;
  String? country;
  String? phoneNumber;
  dynamic? localisation;
  bool? enabled;
  List<String>? activities;

  factory CenterData.fromJson(Map<String, dynamic> json) => CenterData(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    address: json["address"],
    postalCode: json["postalCode"],
    city: json["city"],
    country: json["country"],
    phoneNumber: json["phoneNumber"],
    localisation: json["localisation"],
    enabled: json["enabled"],
    activities: List<String>.from(json["activities"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "address": address,
    "postalCode": postalCode,
    "city": city,
    "country": country,
    "phoneNumber": phoneNumber,
    "localisation": localisation,
    "enabled": enabled,
    "activities": List<dynamic>.from(activities!.map((x) => x)),
  };
}
