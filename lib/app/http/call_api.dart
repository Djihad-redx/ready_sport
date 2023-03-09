import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mad_sport_app/app/utility/dialogs.dart';




//const String url = 'https://apps.fitcube.net';

const String url = 'https://ready-sports.herokuapp.com';
var token = '';
final headers = {
"Accept": "application/json",
"content-type":"application/json",
  'Authorization': 'Bearer $token'
};

Future<Map<String, dynamic>?> callApiGet(String path) async {
  try {
    var response = await http.get(Uri.parse('$url/$path'), headers: headers);
    if (response.statusCode == 200 || response.statusCode == 201) {
      if (kDebugMode) {
        print(response.body);
      }
      return {'data': response.body, 'ok': true};
    } else if (response.statusCode == 400) {
      print(response.statusCode);
      print(response.body);
      return {'data': response.body, 'ok': false};
    } else {
      print(response.body);
      print(response.statusCode);
      return {'data': response.body, 'ok': false};
    }
  } catch (e) {
    if (e is SocketException) {
      MyDialogs.toastMe('check_internet'.tr);
      return {'data': null, 'ok': false};
    } else {
      MyDialogs.toastMe('went_wrong'.tr);
      print(e.toString());
      return {'data': null, 'ok': false};
    }
  }
  return null;
}

Future<Map<String, dynamic>?> callApiPost(
    Map<String, dynamic> body,
    String path,
    ) async {
  try {
    var response = await http.post(Uri.parse('$url/$path'), body: jsonEncode(body), headers: headers);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.statusCode);
      print(response.body);
      return {'data': response.body, 'ok': true};
    } else {
       print(response.body);
      print(response.statusCode);
      return {'data': response.body, 'ok': false};
    }
  } catch (e) {
    if (e is SocketException) {
      MyDialogs.toastMe('check_internet'.tr);
    } else {
      MyDialogs.toastMe('went_wrong'.tr);
      print(e.toString());
    }
    return {'data': null, 'ok': false};
  }
}

Future<Map<String, dynamic>?> callApiDelete(
    String path,
    ) async {
  try {
    var response = await http.delete(Uri.parse('$url/$path'), headers: headers);
    if (response.statusCode == 200 || response.statusCode == 201) {
      // print(response.body);
      print(response.statusCode);
      print(response.body);
      return {'data': response.body, 'ok': true};
    } else {
      // print(response.body);
      print(response.statusCode);
      return {'data': response.body, 'ok': false};
    }
  } catch (e) {
    if (e is SocketException) {
      MyDialogs.toastMe('check_internet'.tr);
    } else {
      MyDialogs.toastMe('went_wrong'.tr);
      print(e.toString());
    }
    return {'data': null, 'ok': false};
  }
}

void setLoading(RxBool isLoading) {
  isLoading(!isLoading.value);
}