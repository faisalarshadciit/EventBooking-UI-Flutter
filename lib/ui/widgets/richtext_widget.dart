import 'package:event_book_app/constants/app_colors.dart';
import 'package:flutter/material.dart';

Widget richTextWidget(double charges) {
  return Align(
    alignment: Alignment.centerLeft,
    child: RichText(
      text: TextSpan(
        style: TextStyle(color: Colors.black, fontSize: 36),
        children: <TextSpan>[
          TextSpan(
            text: 'Charges : ',
            style: TextStyle(color: AppColors.kPrimaryColor),
          ),
          TextSpan(text: 'Rs. '),
          TextSpan(
            text: '$charges',
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
      textScaleFactor: 0.5,
    ),
  );
}
