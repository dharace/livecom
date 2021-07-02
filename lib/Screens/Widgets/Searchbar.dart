import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../main.dart';

class Searchbar extends StatefulWidget {

  TextEditingController searchController;
  String hintText;

  Searchbar(this.searchController, this.hintText);

  @override
  _SearchbarState createState() => _SearchbarState();
}

class _SearchbarState extends State<Searchbar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.sp),
        child: TextField(
            controller: widget.searchController,
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400, color: MyApp.textColor),
            cursorColor: MyApp.textColor,
            decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400, color: MyApp.secondaryColor1),
                filled: true,
                isDense: true,
                fillColor: MyApp.secondaryColor,
                suffixIcon: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.sp, vertical: 0.sp),
                    child: IconButton(
                      icon: Image.asset('assets/ic_search.png', width: 20.sp, height: 20.sp),
                      onPressed: () {},
                    )),
                enabledBorder: _activeBorder(),
                focusedErrorBorder: _deactiveBorder(),
                focusedBorder: _activeBorder(),
                disabledBorder: _deactiveBorder(),
                errorBorder: _deactiveBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 25.sp, vertical: 0.sp))));
  }

  _activeBorder() {
    return OutlineInputBorder(
        borderSide: BorderSide(color: MyApp.textColor, width: 0.5), borderRadius: BorderRadius.all(Radius.circular(100.sp)));
  }

  _deactiveBorder() {
    return OutlineInputBorder(
        borderSide: BorderSide(color: MyApp.secondaryColor1, width: 0.5),
        borderRadius: BorderRadius.all(Radius.circular(100.sp)));
  }
}
