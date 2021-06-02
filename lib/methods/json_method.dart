import 'package:event_book_app/constants/string_assets.dart';
import 'package:event_book_app/models/custom_menu_model.dart';
import 'package:event_book_app/models/halls_model.dart';
import 'package:event_book_app/models/menu_model.dart';
import 'package:event_book_app/models/orders_model.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

Future readGetRequestHalls() async {
  List dataList;
  final String response = await rootBundle.loadString(StringAssets.jsonMyData);
  var data = await json.decode(response);
  var result;

  result = data["Halls"] as List;
  dataList =
      result.map<HallsModel>((json) => HallsModel.fromJson(json)).toList();

  return dataList;
}

Future readGetRequestMenu() async {
  List dataList;
  final String response = await rootBundle.loadString(StringAssets.jsonMyData);
  var data = await json.decode(response);
  var result;

  result = data["MenuDetails"] as List;
  dataList = result.map<MenuModel>((json) => MenuModel.fromJson(json)).toList();

  return dataList;
}

Future readGetRequestCustomMenu() async {
  List dataList;
  final String response = await rootBundle.loadString(StringAssets.jsonMyData);
  var data = await json.decode(response);
  var result;

  result = data["CustomMenu"] as List;
  dataList = result
      .map<CustomMenuModel>((json) => CustomMenuModel.fromJson(json))
      .toList();

  return dataList;
}

Future readGetRequestOrders() async {
  List dataList;
  final String response = await rootBundle.loadString(StringAssets.jsonMyData);
  var data = await json.decode(response);
  var result;

  result = data["Orders"] as List;
  dataList =
      result.map<OrdersModel>((json) => OrdersModel.fromJson(json)).toList();

  return dataList;
}
