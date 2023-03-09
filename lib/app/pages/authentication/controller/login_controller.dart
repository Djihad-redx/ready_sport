
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mad_sport_app/app/http/call_api.dart';
import 'package:mad_sport_app/app/pages/authentication/model/register_model.dart';
import 'package:mad_sport_app/app/pages/authentication/repository/authentication_repository.dart';
import 'package:mad_sport_app/app/routes/app_pages.dart';
import 'package:mad_sport_app/app/utility/dialogs.dart';
import 'package:mad_sport_app/app/utility/storage_utility.dart';
import '../../../utility/global.dart';

class LoginController extends GetxController with GetSingleTickerProviderStateMixin{
  var email = TextEditingController();
  var password = TextEditingController();
  var isLoading = false.obs;
  var user = RegisterModel();


  void login() {
    if (email.text.isNotEmpty && password.text.isNotEmpty) {
      setLoading(isLoading);
      AuthenticationRepository.login(email.text, password.text).then((value) {
        setLoading(isLoading);
        if (value != null) {
          user = value;
          StorageUtility.saveInStorage('token', value.jwt!);
          token = user.jwt!;
          getUser().then((value) =>  Get.offAllNamed(Paths.HOME_PAGE));
        } else {
          // MyDialogs.toastMe('Email or password is wrong');
        }
      });
    } else {
      _validateLogin();
    }
  }

  void _validateLogin() {
    if (email.text.isEmpty && password.text.isNotEmpty) {
      MyDialogs.toastMe('email_field_empty'.tr);
    } else if (email.text.isNotEmpty && password.text.isEmpty) {
      MyDialogs.toastMe('password_field_empty'.tr);
    } else {
      MyDialogs.toastMe('email_password_empty'.tr);
    }
  }

  Future<void> getUser ()async{
    await AuthenticationRepository.getUser().then((value){
      if(value!=null){
        myUser(value);
      }
    });
  }

}