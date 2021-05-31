import 'package:flutter/material.dart';

Widget fontTextWidget(
    String text, double _fontSize, Color textColor, String _fontFamily) {
  return Text(
    text,
    style: TextStyle(
        fontFamily: _fontFamily,
        fontSize: _fontSize,
        color: textColor,
        fontWeight: FontWeight.bold),
  );
}
