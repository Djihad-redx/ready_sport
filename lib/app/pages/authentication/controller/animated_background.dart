import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AnimatedBackground extends GetxController{
  static final AnimatedBackground _singleton = AnimatedBackground._internal();

  factory AnimatedBackground() {
    return _singleton;
  }

  AnimatedBackground._internal();

  List<Color> colorList = [
    const Color(0xFFE08D4F),
    const Color(0xFFC7565C),
  ];
  List<Alignment> alignmentList = [
    Alignment.bottomLeft,
    Alignment.bottomRight,
    Alignment.topRight,
    Alignment.topLeft,
  ];
  var index = 0.obs;
  var bottomColor = const Color(0xFFE1904E).obs;
  var topColor = const Color(0xFFC7565C).obs;
  var begin = Alignment.bottomLeft.obs;
  var end = Alignment.topRight.obs;

  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 1)).then((value){
      bottomColor.value = topColor.value;
    });
    super.onInit();
  }


  @override
  void onClose() {

    super.onClose();
  }
}