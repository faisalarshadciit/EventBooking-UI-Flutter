import 'package:event_book_app/constants/string_assets.dart';
import 'package:event_book_app/models/halls_model.dart';
import 'package:event_book_app/models/menu_model.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

Future readGetRequest(String type) async {
  List dataList;
  final String response = await rootBundle.loadString(StringAssets.jsonMyData);
  var data = await json.decode(response);
  var result;

  if (type == "Halls") {
    result = data["Halls"] as List;
    dataList =
        result.map<HallsModel>((json) => HallsModel.fromJson(json)).toList();
  } else if (type == "MenuDetails") {
    result = data["MenuDetails"] as List;
    dataList =
        result.map<MenuModel>((json) => MenuModel.fromJson(json)).toList();
  }

  return dataList;
}
