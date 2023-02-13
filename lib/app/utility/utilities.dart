
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'global.dart';
class Utilities{
  static final Utilities _singleton = Utilities._internal();

  factory Utilities() {
    return _singleton;
  }

  Utilities._internal();

  // static Future <XFile?> pickSingleImageFromGallery() async{
  //   final ImagePicker _picker = ImagePicker();
  //   return await _picker.pickImage(source: ImageSource.gallery);
  // }
  //
  // static Future <XFile?> pickSingleImageFromCamera() async{
  //   final ImagePicker _picker = ImagePicker();
  //   return await _picker.pickImage(source: ImageSource.camera);
  // }
  // static Future <List<XFile>?> pickMultipleImages() async{
  //   final ImagePicker _picker = ImagePicker();
  //   return await _picker.pickMultiImage();
  // }
  //
  // static void getCurrentFlag(){
  //   for(var item in userLanguage!.data!){
  //     if(item.selected!){
  //       currentLanguageFlag(item.image);
  //       currentLanguageSymbol(item.symbol);
  //       Get.updateLocale(Locale(item.symbol!));
  //     }
  //   }
  // }



}