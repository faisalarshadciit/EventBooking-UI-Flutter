import 'dart:async';
import 'package:event_book_app/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(Duration(seconds: 5),
        () => Navigator.pushReplacementNamed(context, '/home_page'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhiteColor,
      body: Center(
        child: Container(
          child: Lottie.asset(
            'assets/animations/lottie/56301_marriage.json',
            repeat: true,
            reverse: true,
          ),
        ),
      ),
    );
  }
}
