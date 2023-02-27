import 'package:get/get.dart';
import 'package:mad_sport_app/app/pages/authentication/binding/authentication_binding.dart';
import 'package:mad_sport_app/app/pages/authentication/binding/login_binding.dart';
import 'package:mad_sport_app/app/pages/authentication/binding/signup_binding.dart';
import 'package:mad_sport_app/app/pages/authentication/views/login_view.dart';
import 'package:mad_sport_app/app/pages/authentication/views/sign_up_view.dart';
import 'package:mad_sport_app/app/pages/home/bindings/home_binding.dart';
import 'package:mad_sport_app/app/pages/home/views/home_view.dart';

import '../pages/splash/binding/splash_binding.dart';
import '../pages/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.FIRST_SCREEN;

  static final routes = [
    GetPage(name: Paths.SPLASH, page: () => const SplashView(),binding: SplashBinding()),
    GetPage(name: Paths.LOGIN_PAGE, page: () => const LoginView(),binding: LoginBinding()),
    GetPage(name: Paths.SIGNUP_PAGE, page: () => const SignUpView(),binding: SignUpBinding()),
    GetPage(name: Paths.HOME_PAGE, page: () => const HomePage(),binding: HomeBinding()),
  ];
}
