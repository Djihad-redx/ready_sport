import 'dart:convert';

SessionsModel sessionsModelFromJson(String str) => SessionsModel.fromJson(json.decode(str));

String sessionsModelToJson(SessionsModel data) => json.encode(data.toJson());

class SessionsModel {
  SessionsModel({
    this.success,
    this.message,
  });

  bool? success;
  List<SessionData>? message;

  factory SessionsModel.fromJson(Map<String, dynamic> json) => SessionsModel(
    success: json["success"],
    message: List<SessionData>.from(json["data"].map((x) => SessionData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": List<dynamic>.from(message!.map((x) => x.toJson())),
  };
}

class SessionData {
  SessionData({
    this.id,
    this.reservationName,
    this.activityType,
    this.center,
    this.startDate,
    this.duration,
    this.endDate,
    this.status,
    this.statusDate,
    this.organizer,
    this.availableSlots,
    this.pricePerSlot,
    this.currency,
    this.description,
    this.format,
    this.level,
    this.ambiance,
    this.visibility,
    this.participants,
    this.guests,
    this.watchers,
    this.chat,
    this.modifiedBy,
    this.lastModificationDate,
    this.version,
  });

  String? id;
  String? reservationName;
  String? activityType;
  Center? center;
  int? startDate;
  int? duration;
  int? endDate;
  String? status;
  DateTime? statusDate;
  Guest? organizer;
  int? availableSlots;
  double? pricePerSlot;
  String? currency;
  String? description;
  String? format;
  String? level;
  String? ambiance;
  bool? visibility;
  List<Guest>? participants;
  List<Guest>? guests;
  List<Guest>? watchers;
  dynamic? chat;
  dynamic? modifiedBy;
  dynamic? lastModificationDate;
  String? version;

  factory SessionData.fromJson(Map<String, dynamic> json) => SessionData(
    id: json["id"],
    reservationName: json["reservationName"],
    activityType: json["activityType"],
    center: Center.fromJson(json["center"]),
    startDate: json["startDate"],
    duration: json["duration"],
    endDate: json["endDate"],
    status: json["status"],
    statusDate: DateTime.parse(json["statusDate"]),
   // organizer: Guest.fromJson(json["organizer"]),
    availableSlots: json["availableSlots"],
    pricePerSlot: json["pricePerSlot"],
    currency: json["currency"],
    description: json["description"],
    format: json["format"],
    level: json["level"],
    ambiance: json["ambiance"],
    visibility: json["visibility"],
    participants: List<Guest>.from(json["participants"].map((x) => Guest.fromJson(x))),
    guests: List<Guest>.from(json["guests"].map((x) => Guest.fromJson(x))),
    watchers: List<Guest>.from(json["watchers"].map((x) => Guest.fromJson(x))),
    chat: json["chat"],
    modifiedBy: json["modifiedBy"],
    lastModificationDate: json["lastModificationDate"],
    version: json["version"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "reservationName": reservationName,
    "activityType": activityType,
    "center": center,
    "startDate": startDate,
    "duration": duration,
    "endDate": endDate,
    "status": status,
    "statusDate": statusDate,
   // "organizer": organizer,
    "availableSlots": availableSlots,
    "pricePerSlot": pricePerSlot,
    "currency": currency,
    "description": description,
    "format": format,
    "level": level,
    "ambiance": ambiance,
    "visibility": visibility,
    "participants": List<dynamic>.from(participants!.map((x) => x.toJson())),
    "guests": List<dynamic>.from(guests!.map((x) => x.toJson())),
    "watchers": List<dynamic>.from(watchers!.map((x) => x.toJson())),
    "chat": chat,
    "modifiedBy": modifiedBy,
    "lastModificationDate": lastModificationDate,
    "version": version,
  };
}


class Center {
  Center({
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

  dynamic? id;
  String? name;
  dynamic? email;
  String? address;
  int? postalCode;
  String? city;
  dynamic country;
  String? phoneNumber;
  dynamic localisation;
  bool? enabled;
  List<String>? activities;

  factory Center.fromJson(Map<String, dynamic> json) => Center(
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
    //activities: List<Activity>.from(json["activities"].map((x) => activityValues.map[x])),
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
   // "activities": List<dynamic>.from(activities!.map((x) => activityValues.reverse[x])),
  };
}


class Guest {
  Guest({
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
  List<Center>? preferredCenters;
  List<dynamic>? preferredTimeSlots;
  List<dynamic>? partners;
  bool? enabled;
  List<String?>? notificationTypes;

  factory Guest.fromJson(Map<String, dynamic> json) => Guest(
    id: json["id"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    username: json["username"],
    phoneNumber: json["phoneNumber"],
    mail:json["mail"],
    datOfBirth:json["datOfBirth"],
    profilePicture: json["profilePicture"],
    preferredCenters: List<Center>.from(json["preferredCenters"].map((x) => Center.fromJson(x))),
    preferredTimeSlots: List<dynamic>.from(json["preferredTimeSlots"].map((x) => x)),
    partners: List<dynamic>.from(json["partners"].map((x) => x)),
    enabled: json["enabled"],
    //notificationTypes: List<NotificationType>.from(json["notificationTypes"].map((x) => notificationTypeValues.map[x])),
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
    "preferredCenters": List<dynamic>.from(preferredCenters!.map((x) => x.toJson())),
    "preferredTimeSlots": List<dynamic>.from(preferredTimeSlots!.map((x) => x)),
    "partners": List<dynamic>.from(partners!.map((x) => x)),
    "enabled": enabled,
    "notificationTypes": List<dynamic>.from(notificationTypes!.map((x) => x)),
  };
}






