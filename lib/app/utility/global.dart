
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:mad_sport_app/app/map/model/centers.dart';
import 'package:mad_sport_app/app/pages/authentication/model/user_model.dart';

var myUser  = UserModel().obs;
var centers = CentersModel().obs;


 BorderRadius getCircularRadius(double value){
  return BorderRadius.all(Radius.circular(value));
}


