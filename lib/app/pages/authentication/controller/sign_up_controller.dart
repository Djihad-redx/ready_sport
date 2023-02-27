
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mad_sport_app/app/pages/authentication/model/register_model.dart';
import 'package:mad_sport_app/app/pages/authentication/repository/authentication_repository.dart';
import 'package:mad_sport_app/app/routes/app_pages.dart';
import 'package:mad_sport_app/app/utility/dialogs.dart';
import 'package:mad_sport_app/app/utility/global.dart';
import 'package:mad_sport_app/app/utility/storage_utility.dart';

import '../../../http/call_api.dart';

class SignUpController extends  GetxController{
  final email = TextEditingController();
  final userName = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final mobile = TextEditingController();
  final password = TextEditingController();
  var isLoading = false.obs;
  var user = RegisterModel();

  void register(){
      setLoading(isLoading);
      AuthenticationRepository.register(
        firstName.text.toString(),
        lastName.text.toString(),
        email.text.toString(),
        userName.text.toString(),
        password.text.toString(),
        mobile.text.toString()
      ).then((value){
        setLoading(isLoading);
        if(value!=null){
          user = value;
          StorageUtility.saveInStorage('token', token);
          token = value.jwt!;
          getUser().then((value) =>  Get.offAllNamed(Paths.HOME_PAGE));

        } else {
          MyDialogs.toastMe('check your information and try again');
        }
      });

  }

  Future<void> getUser ()async{
    await AuthenticationRepository.getUser().then((value){
      if(value!=null){
        myUser(value);
      }
    });
  }


}