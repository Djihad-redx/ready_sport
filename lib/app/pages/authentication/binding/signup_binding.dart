import 'package:get/get.dart';
import 'package:mad_sport_app/app/pages/authentication/controller/sign_up_controller.dart';
import '../controller/login_controller.dart';


class SignUpBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(SignUpController());
  }

}