import 'package:flutter/material.dart';
import 'config/route.dart';
import 'constants/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      builder: () => MaterialApp(
        theme: themeData,
        initialRoute: '/',
        debugShowCheckedModeBanner: false,
        routes: Routes.getRoute(),
      ),
    );
  }
}

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return ScreenUtilInit(
//       designSize: Size(360, 690),
//       builder: () => MaterialApp(
//         theme: themeData,
//         initialRoute: '/',
//         debugShowCheckedModeBanner: false,
//         routes: Routes.getRoute(),
//         builder: (context, widget) {
//           return MediaQuery(
//             //Setting font does not change with system font size
//             data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
//             child: widget,
//           );
//         },
//       ),
//     );
//   }
// }
