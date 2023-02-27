import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mad_sport_app/app/http/call_api.dart';
import 'package:mad_sport_app/app/pages/home/repository/home_repository.dart';
import '../../../utility/constants.dart';
import '../../../utility/global.dart';
import '../../../utility/hex_color.dart';
import 'dart:io' as IO;

import '../models/sessionsModel.dart';



class HomeController extends GetxController with GetSingleTickerProviderStateMixin{
  late PageController pageController;
  var currentIndex = 0.obs;
  var mySessions = SessionsModel().obs;
  GlobalKey bottomNavigationKey = GlobalKey();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  final autoSizeGroup = AutoSizeGroup();
  var bottomNavIndex = 0.obs;
  var currentLang = Get.locale!.languageCode.obs;
  late DateTime currentBackPressTime = DateTime(2016);
  late AnimationController animationController;
  late Animation<double> animation;
  late Animation<double> animation2;
  late CurvedAnimation curve;
  double hightBottmBar = IO.Platform.isIOS? 80:55;
  var isLoading = false.obs;
  final iconList = <String>[
    "ic_home.svg",
    "ic_date.svg",
    "ic_groupe.svg",
    "ic_chat.svg",
  ];

  final List<String> iconTitles = ["home","My events","Team","Chat"];

  @override
  void onInit() {
    super.onInit();
    getSessions();
    pageController = PageController();
    final systemTheme = SystemUiOverlayStyle.light.copyWith(
      systemNavigationBarColor: HexColor('#373A36'),
      systemNavigationBarIconBrightness: Brightness.light,
    );
    SystemChrome.setSystemUIOverlayStyle(systemTheme);
    animationController = AnimationController(
      duration: const Duration(milliseconds:500),
      vsync: this,
    );
    curve = CurvedAnimation(
      parent: animationController,
      curve: const Interval(
        0.5,
        1.0,
        curve: Curves.fastOutSlowIn,
      ),
    );
    animation = Tween<double>(
      begin: 1,
      end: 1,
    ).animate(curve);
    animation2 = Tween<double>(
      begin: 1,
      end: 0,
    ).animate(curve);
    Future.delayed(
      const Duration(milliseconds: 1200),
          () => animationController.forward(),
    );
  }

  @override
  void onClose() {
    pageController.dispose();
  }

  void openDrawer() {
    scaffoldKey.currentState?.openDrawer();
  }

  void closeDrawer() {
    scaffoldKey.currentState?.openEndDrawer();
  }

  void changeLang(String newLang){
    currentLang(newLang);
    Get.updateLocale(Locale(newLang));
    Get.back();
  }

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (now.difference(currentBackPressTime) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      return Future.value(false);
    }
    return Future.value(true);
  }

void getSessions(){
    setLoading(isLoading);
    HomeRepository.getSessions().then((value) {
      setLoading(isLoading);
      if(value!=null){
        mySessions(value);
      }
    });
}


}
