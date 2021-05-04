import 'package:event_book_app/constants/app_colors.dart';
import 'package:event_book_app/constants/font_family.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, textColor;

  RoundedButton({
    Key key,
    this.text,
    this.press,
    this.color = AppColors.kPrimaryColor,
    this.textColor = AppColors.kWhiteColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 0),
      width: size.width * 0.9,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(28),
        child: FlatButton(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          color: color,
          onPressed: press,
          child: Text(
            text,
            style: TextStyle(
                color: textColor,
                fontSize: 18.0,
                fontFamily: FontFamily.kFontPoppinsBold),
          ),
        ),
      ),
    );
  }
}
