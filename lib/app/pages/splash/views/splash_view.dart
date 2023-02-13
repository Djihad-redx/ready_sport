import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utility/constants.dart';

class SplashView extends GetView  {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        color: Colors.white,
        height: getHight(context),
        child: const Center(
          child: SizedBox(
            height: 35,
            width: 35,
            child: CircularProgressIndicator(
              backgroundColor: Colors.transparent,
              valueColor: AlwaysStoppedAnimation(Colors.orange),
              strokeWidth: 6,
            ),
          ),
        ),
      ),
    );
  }
}
