import 'package:mad_sport_app/app/http/call_api.dart';

import '../models/sessionsModel.dart';

class HomeRepository{

static Future<SessionsModel?> getSessions()async{
  final response = await callApiGet('api/v0/sessions');
  if (response!['ok']) {
    return sessionsModelFromJson(response['data']);
  } else {
    if (response['data'] != null) {
      // final Map<String, dynamic> map = jsonDecode(response['data']);
      // var forEachDonne = false;
      // if (map['errors'] != null) {
      //   map['errors'].forEach((key, value) async {
      //     if (!forEachDonne) {
      //       MyDialogs.toastMe(value);
      //
      //       forEachDonne = true;
      //     }
      //   });
      // } else if (map['message'] != null) {
      //   MyDialogs.toastMe(map['message']);
      // }
    }

    return null;
  }

}
}