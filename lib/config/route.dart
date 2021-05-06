import 'package:event_book_app/ui/details_screen.dart';
import 'package:event_book_app/ui/hall_booking.dart';
import 'package:event_book_app/ui/hall_booking2.dart';
import 'package:event_book_app/ui/hall_booking3.dart';
import 'package:event_book_app/ui/home_screen.dart';
import 'package:event_book_app/ui/login_screen.dart';
import 'package:event_book_app/ui/registration_screen.dart';
import 'package:event_book_app/ui/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoute() {
    return <String, WidgetBuilder>{
      '/': (_) => Splash(),
      '/home_page': (_) => HomePage(),
      '/details_page': (_) => DetailsScreen(),
      '/hall_booking': (_) => HallBooking(),
      '/hall_booking2': (_) => HallBooking2(),
      '/hall_booking3': (_) => HallBooking3(),
      '/login_page': (_) => LoginPage(),
      '/registration_page': (_) => RegistrationPage(),
    };
  }
}
