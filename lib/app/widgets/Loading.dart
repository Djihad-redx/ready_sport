import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utility/constants.dart';



class MyLoading extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  BlurryContainer(
      height: getHight(context),
      width: getWidth(context),
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      child: const Center(
        child: SizedBox(
          height: 35,
          width: 35,
          child: CircularProgressIndicator(
            backgroundColor: Colors.transparent,
            valueColor: AlwaysStoppedAnimation(Colors.black),
            strokeWidth: 6,
          ),
        ),
      ),
    );
  }
}