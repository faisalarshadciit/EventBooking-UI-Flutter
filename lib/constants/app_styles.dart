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
      fontFamily: FontFamily.kFontPoppinsSemiBold);
  // endregion

  // region Review Styles
  static const TextStyle kMinCounterStyle = TextStyle(
    fontSize: 14,
    color: AppColors.kGreyColor,
  );
  static const TextStyle kMaxCounterStyle = TextStyle(
    fontSize: 14,
    color: AppColors.kRedCardColor,
  );
  // endregion

}
