import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:mad_sport_app/app/pages/authentication/model/user_model.dart';

import '../../../http/call_api.dart';
import '../../../utility/dialogs.dart';
import '../model/register_model.dart';

class AuthenticationRepository {

  static Future<RegisterModel?> register(
      String firstName,
      String lastName,
      String email,
      String userName,
      String password,
      String mobile,
      ) async {
    final body = {
      "mail": email,
      "password": password,
      "username": userName,
      "firstName": firstName,
      "lastName": lastName,
      "phoneNumber": mobile
    };
    final response = await callApiPost(body,'api/v0/users/signup');
    if (response!['ok']) {
      if (kDebugMode) {
        print(response['data']);
      }
      return registerModelFromJson(response['data']);
    } else {
      return null;
    }
  }

  static Future<RegisterModel?> login(String email, String password) async {
    final body = {'usernameOrEmailOrPhone': email, 'password': password};

    final response = await callApiPost(body, 'api/v0/users/signin');
    if (response!['ok']) {
      return registerModelFromJson(response['data']);
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

  static Future<UserModel?> getUser() async {

    final response = await callApiGet('api/v0/users/current-profile');
    if (response!['ok']) {
      return userModelFromJson(response['data']);
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
