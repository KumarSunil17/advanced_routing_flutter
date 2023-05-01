import 'package:advanced_routing_flutter/utils/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

///
/// Created by Sunil Kumar
/// On 30-04-2023 08:23 am
///
mixin SnackBarHelper {
  static Future<void> show(String message, {isLong = false}) async {
    Fluttertoast.showToast(
        msg: message,
        toastLength: isLong ? Toast.LENGTH_LONG : Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        webShowClose: true,
        backgroundColor: AppThemes.primary,
        textColor: Colors.white,
        webBgColor: "#000000",
        fontSize: 16.0);
  }
}
