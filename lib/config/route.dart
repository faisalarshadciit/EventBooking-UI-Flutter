import 'package:event_book_app/ui/HomeScreen.dart';
import 'package:event_book_app/ui/LoginScreen.dart';
import 'package:event_book_app/ui/RegistrationScreen.dart';
import 'package:event_book_app/ui/SplashScreen.dart';
import 'package:flutter/material.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoute() {
    return <String, WidgetBuilder>{
      '/': (_) => Splash(),
      '/home_page': (_) => HomePage(),
      '/login_page': (_) => LoginPage(),
      '/registration_page': (_) => RegistrationPage(),
    };
  }
}
