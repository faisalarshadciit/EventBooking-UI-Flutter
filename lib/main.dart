import 'package:flutter/material.dart';
import 'config/route.dart';
import 'constants/app_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themeData,
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      routes: Routes.getRoute(),
    );
  }
}
