import 'package:get/get.dart';
import '../controller/animated_background.dart';
import '../controller/sign_up_controller.dart';


class AuthenticationBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<SignUpController>(() => SignUpController(),);
    Get.lazyPut<AnimatedBackground>(() => AnimatedBackground(),);
  }

}