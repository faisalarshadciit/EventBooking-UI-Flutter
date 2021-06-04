import 'package:event_book_app/constants/app_colors.dart';
import 'package:event_book_app/constants/app_styles.dart';
import 'package:flutter/material.dart';

Widget customAppBar(BuildContext context, String text) {
  return AppBar(
    title: Text(
      text,
      style: AppStyles.kAppBarStyle,
    ),
    centerTitle: true,
    backgroundColor: AppColors.kPrimaryColor,
    leading: IconButton(
      icon: Icon(Icons.arrow_back_ios),
      onPressed: () => Navigator.pop(context, false),
    ),
  );
}
