import 'package:get/get.dart';

import '../pages/splash/binding/splash_binding.dart';
import '../pages/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.FIRST_SCREEN;

  static final routes = [
    GetPage(name: Paths.SPLASH, page: () => const SplashView(),binding: SplashBinding()),
  ];
}
