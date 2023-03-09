import 'dart:convert';

import 'package:mad_sport_app/app/http/call_api.dart';
import 'package:mad_sport_app/app/map/model/centers.dart';
import 'package:mad_sport_app/app/utility/dialogs.dart';

class CenterRepository {

  static Future<CentersModel?> getCenters() async {
    final response = await callApiGet('api/v0/centers');
    if (response!['ok']) {
      return centersModelFromJson(response['data']);
    } else {
      if (response['data'] != null) {
        final Map<String, dynamic> map = jsonDecode(response['data']);
        var forEachDonne = false;
        if (map['errors'] != null) {
          map['errors'].forEach((key, value) async {
            if (!forEachDonne) {
              MyDialogs.toastMe(value);
              forEachDonne = true;
            }
          });
        } else if (map['message'] != null) {
          MyDialogs.toastMe(map['message']);
        }
      }
      return null;
    }
  }
}