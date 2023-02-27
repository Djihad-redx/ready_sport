

import 'dart:async';

import 'package:get/get.dart';
import 'package:mad_sport_app/app/http/call_api.dart';
import 'package:mad_sport_app/app/pages/authentication/binding/authentication_binding.dart';
import 'package:mad_sport_app/app/pages/authentication/repository/authentication_repository.dart';
import 'package:mad_sport_app/app/pages/authentication/views/login_view.dart';
import 'package:mad_sport_app/app/routes/app_pages.dart';
import 'package:mad_sport_app/app/utility/storage_utility.dart';

import '../../../utility/global.dart';

class SplashController extends GetxController {

  @override
  void onInit() {

    Timer(const Duration(seconds: 3), () {
      StorageUtility.readFromStorage('token').then((value){
        if(value!=''&& value != null && value.isNotEmpty){
          print('token: $value');
          token = value;
          getUser().then((value) => Get.offAllNamed(Paths.HOME_PAGE));
         // Get.offAllNamed(Paths.HOME_PAGE);
        }else{
          print('token: $value');
          Get.offAllNamed(Paths.LOGIN_PAGE);
        }
      });
    });

    super.onInit();
  }


  Future<void> getUser ()async{
   await AuthenticationRepository.getUser().then((value){
      if(value!=null){
        myUser(value);
      }
    });
  }




}
