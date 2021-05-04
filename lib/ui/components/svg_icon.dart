import 'package:event_book_app/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget svgIconWidget(String svgIcon) {
  return Container(
    padding: EdgeInsets.fromLTRB(0, 20, 20, 20),
    child: SvgPicture.asset(
      svgIcon,
      height: 20.0,
      color: AppColors.kPrimaryColor,
    ),
  );
}
