import 'package:event_book_app/ui/HomeScreen.dart';
import 'package:flutter/material.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoute() {
    return <String, WidgetBuilder>{
      '/': (_) => HomePage(),
      //'/home_page': (_) => MainPage(0),
    };
  }
}
