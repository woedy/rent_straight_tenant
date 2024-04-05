import 'dart:ui';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';

const rentPrimary = Color(0xffF47D7B);
const rentWhite = Color(0x88ffffff);
const rentDark = Color(0xff412234);
const rentLightblue = Color(0xff8FBFE0);
const rentGray = Color(0x41414138);
const rentCream = Color(0xffF5E2C8);


const bodyText1 = Color(0xffffffff);
const bodyText2 = Color(0xffffffff);
const clay = Color(0xffa499b3);


const hostName = "https://rentstraight.teamalfy.co.uk/api/tenants/v1/";
//const hostNameMedia = "https://api.bookelu.zuludesks.com";




Future<String?> getApiPref() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString("API_Key");
}



Future<String?> getUserIDPref() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString("USER_ID");
}









class PasteTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Allow pasting of text by returning the new value unchanged
    return newValue;
  }
}




