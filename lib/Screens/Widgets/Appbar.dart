import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../main.dart';

class Appbar extends StatefulWidget {
  String title;
  var onClick, onBackPressed;
  Appbar(this.title, {this.onClick, this.onBackPressed});

  @override
  _AppbarState createState() => _AppbarState();
}

class _AppbarState extends State<Appbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 80.sp,
        child: Stack(children: [
          GestureDetector(
              onTap: () {
                widget.onBackPressed();
              },
              child: Image.asset('assets/ic_back.png', fit: BoxFit.fitWidth)),
          Center(
              child: GestureDetector(onTap: (){
                widget.onClick();
              },child: Text(widget.title, style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600, color: MyApp.textColor))))
        ]));
  }
}
