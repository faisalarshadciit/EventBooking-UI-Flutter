import 'dart:ui';
import 'app_colors.dart';
import 'package:flutter/material.dart';
import 'font_family.dart';

class AppStyles {
  AppStyles._();

  // region AppBar Style
  static const TextStyle kAppBarStyle = TextStyle(
      color: AppColors.kWhiteColor,
      fontWeight: FontWeight.bold,
      fontFamily: FontFamily.kFontPoppinsRegular);
  // endregion

}
