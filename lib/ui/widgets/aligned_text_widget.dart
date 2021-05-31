import 'package:flutter/material.dart';

Widget alignedTextWidget(
    String text, double _fontSize, Color textColor, TextAlign _textAlign) {
  return Text(
    text,
    textAlign: _textAlign,
    style: TextStyle(fontSize: _fontSize, color: textColor),
  );
}
