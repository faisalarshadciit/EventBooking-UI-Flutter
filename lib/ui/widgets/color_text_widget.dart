import 'package:flutter/material.dart';

Widget colorTextWidget(String text, double _fontSize, Color textColor) {
  return Text(
    text,
    style: TextStyle(fontSize: _fontSize, color: textColor),
  );
}
