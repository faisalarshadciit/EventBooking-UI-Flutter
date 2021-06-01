import 'package:flutter/material.dart';

Widget defaultContainer(String text) {
  return Container(
      padding: EdgeInsets.all(8.0),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.bold),
      ));
}
