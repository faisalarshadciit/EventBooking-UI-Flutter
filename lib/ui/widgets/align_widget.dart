import 'package:flutter/material.dart';

Widget alignWidget(
    String text, double _fontSize, Color textColor, Alignment _alignment) {
  return Align(
    alignment: _alignment,
    child: Text(
      text,
      style: TextStyle(fontSize: _fontSize, color: textColor),
    ),
  );
}
