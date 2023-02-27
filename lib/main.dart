import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'app/routes/app_pages.dart';
import 'main/main_binding.dart';
import 'translation/translation.dart';

void main()async{
  await GetStorage.init();

  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    title: "MadSport",
    theme: ThemeData(fontFamily: 'appFont'),
    translations: Translation(),
    initialRoute: AppPages.INITIAL,
    getPages: AppPages.routes,
    locale: const Locale("en"),
    fallbackLocale: const Locale("en"),
    initialBinding: MainBinding(),
  ));
}