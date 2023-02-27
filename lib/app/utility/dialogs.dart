import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dialog.dart';
import 'package:fit_cube/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class MyDialogs {
  static void toastMe(String content) {
    Fluttertoast.showToast(
      msg: content,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: MyColors.orangeColor,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  static void longToastMe(String content) {
    Fluttertoast.showToast(
      msg: content,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: MyColors.orangeColor,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  static void openCountryPickerDialog(
          BuildContext context, Rx<Country> myCountry) =>
      showDialog(
        context: context,
        builder: (context) => Theme(
            data:
                Theme.of(context).copyWith(primaryColor: MyColors.orangeColor),
            child: CountryPickerDialog(
              titlePadding: const EdgeInsets.all(8.0),
              searchCursorColor: MyColors.orangeColor,
              isSearchable: true,
              searchInputDecoration:
                   InputDecoration(hintText: 'search'.tr),
              title: Text('select_phone_code'.tr),
              onValuePicked: (Country country) => myCountry(country),
            )),
      );
}
