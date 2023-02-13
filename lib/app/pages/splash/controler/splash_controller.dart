

import 'dart:async';

import 'package:get/get.dart';
import 'package:mad_sport_app/app/pages/authentication/views/login_view.dart';

class SplashController extends GetxController {

  @override
  void onInit() {
    Timer(const Duration(milliseconds: 4100), () => Get.off(() => const LoginView()));

    super.onInit();
  }




}
