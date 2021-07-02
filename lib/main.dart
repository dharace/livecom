

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:livecom_app/Screens/Household.dart';
import 'package:livecom_app/Screens/Notification.dart';
import 'package:livecom_app/Screens/Search.dart';
import 'package:livecom_app/Screens/Welcome.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  static Color darkBackColor = Color(0xFF181E28);
  static Color lightBackColor = Color(0xFF252C39);
  static Color textColor = Color(0xFFD7DDE8);
  static Color primaryColor = Color(0xFFEC0000);
  static Color secondaryColor = Color(0xFF2E394E);
  static Color secondaryColor1 = Color(0xFF7889A9);
  static Color offWhite = Color(0xFFF5F5F5);
  static Color games1 = Color(0xFFFF4141);
  static Color games2 = Color(0xFF15B9FF);
  static Color games3 = Color(0xFF4CD964);
  static Color games4 = Color(0xFFFCCF37);
  static Color textColor2 = Color(0xFF151A24);

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: lightBackColor,
      statusBarBrightness: Brightness.dark,
    ));

    return ScreenUtilInit(
        builder: () => MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue, fontFamily: 'Montserrat'
          ),
          debugShowCheckedModeBanner: false,
         home: SearchScreen(),
          // home: NotificationScreen(),
        ));
  }
}

