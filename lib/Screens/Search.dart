import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:livecom_app/Screens/Household.dart';
import 'package:livecom_app/Screens/Widgets/Appbar.dart';
import 'package:livecom_app/Screens/Widgets/Searchbar.dart';
import 'package:livecom_app/main.dart';

import 'Notification.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController;

  @override
  void initState() {
    searchController = TextEditingController(text: '');
    searchController.addListener(() {
      _listener(searchController.text);
    });
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  int selectedWidget = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyApp.lightBackColor,
        body: SafeArea(
            child: Column(mainAxisSize: MainAxisSize.max, children: [
          Appbar('Search', onClick: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => NotificationScreen()));
          }, onBackPressed: () {
            SystemChannels.platform.invokeMethod('SystemNavigator.pop');
          }),
          SizedBox(height: 5.sp),
          Searchbar(searchController, 'What are you looking for?'),
          SizedBox(height: 15.sp),
          Expanded(
              child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: MyApp.darkBackColor,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(15.sp), topRight: Radius.circular(15.sp))),
                  child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(mainAxisSize: MainAxisSize.max, crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Visibility(visible: selectedWidget == 0, child: _recommendedList()),
                        Visibility(visible: selectedWidget == 0, child: _liveStoreList()),
                        Visibility(visible: selectedWidget == 0, child: _liveStreamList()),
                        Visibility(visible: selectedWidget == 0, child: _categoriesList()),
                        Visibility(visible: selectedWidget == 1, child: _recommendedList()),
                        Visibility(visible: selectedWidget == 1, child: _liveStreamList()),
                        Visibility(visible: selectedWidget == 1, child: _liveStoreList()),
                        Visibility(visible: selectedWidget == 2, child: _noSearchData())
                      ]))))
        ])));
  }

  _recommendedList() {
    return Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
          padding: EdgeInsets.only(top: 20.sp, left: 12.sp),
          child: Text("Recommended", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600, color: MyApp.textColor))),
      SizedBox(height: 10.sp),
      Container(
          height: 85.sp,
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: recommendList.length,
              physics: BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    height: 90.sp,
                    child: Padding(
                        padding: EdgeInsets.only(left: index == 0 ? 12.sp : 0, right: 12.sp),
                        child: Column(mainAxisSize: MainAxisSize.max, children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(28.sp),
                              child: Image.asset(recommendList[index].image, width: 65.sp, height: 65.sp, fit: BoxFit.fill)),
                          SizedBox(height: 5.sp),
                          Center(
                              child: Text(recommendList[index].name,
                                  style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400, color: MyApp.textColor)))
                        ])));
              }))
    ]);
  }

  _liveStoreList() {
    return Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
          padding: EdgeInsets.only(top: 20.sp, left: 12.sp),
          child: Text("Live Store", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600, color: MyApp.textColor))),
      SizedBox(height: 10.sp),
      Container(
          height: 215.sp,
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: liveStoreList.length,
              physics: BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    height: 215.sp,
                    child: Padding(
                        padding: EdgeInsets.only(left: index == 0 ? 12.sp : 0, right: 12.sp),
                        child: Container(
                            width: 150.sp,
                            child: Column(mainAxisSize: MainAxisSize.max, children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(5.sp),
                                  child: Stack(children: [
                                    Image.asset('assets/dummy6.png', width: 150.sp, height: 150.sp, fit: BoxFit.cover),
                                    Image.asset('assets/shadow.png', width: 150.sp, height: 150.sp, fit: BoxFit.cover),
                                    Padding(
                                        padding: EdgeInsets.all(5.sp),
                                        child: Row(children: [
                                          Image.asset('assets/ic_watch.png', width: 15.sp, height: 15.sp, fit: BoxFit.contain),
                                          SizedBox(width: 5.sp),
                                          Text('00:71:25',
                                              style: TextStyle(
                                                  fontSize: 12.sp, fontWeight: FontWeight.w400, color: MyApp.textColor)),
                                          Expanded(child: Container()),
                                          Image.asset('assets/ic_arrow.png', width: 15.sp, height: 15.sp, fit: BoxFit.contain)
                                        ]))
                                  ])),
                              SizedBox(height: 5.sp),
                              Text(liveStoreList[index],
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400, color: MyApp.textColor)),
                              SizedBox(height: 5.sp),
                              Row(children: [
                                Image.asset('assets/ic_coin.png', width: 15.sp, height: 15.sp, fit: BoxFit.contain),
                                SizedBox(width: 5.sp),
                                Text('500',
                                    style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600, color: MyApp.textColor))
                              ])
                            ]))));
              }))
    ]);
  }

  _liveStreamList() {
    return Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
          padding: EdgeInsets.only(top: 20.sp, left: 12.sp),
          child: Text("Live Stream", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600, color: MyApp.textColor))),
      SizedBox(height: 10.sp),
      Container(
          height: 210.sp,
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: liveStoreList.length,
              physics: BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    height: 210.sp,
                    child: Padding(
                        padding: EdgeInsets.only(left: index == 0 ? 12.sp : 0, right: 12.sp),
                        child: Container(
                            width: 150.sp,
                            child: Column(mainAxisSize: MainAxisSize.max, crossAxisAlignment: CrossAxisAlignment.start,children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(5.sp),
                                  child: Stack(children: [
                                    Image.asset('assets/dummy7.png', width: 150.sp, height: 150.sp, fit: BoxFit.cover),
                                    Image.asset('assets/shadow.png', width: 150.sp, height: 150.sp, fit: BoxFit.cover),
                                    Padding(
                                        padding: EdgeInsets.all(5.sp),
                                        child: Row(children: [
                                          Image.asset('assets/ic_eye.png', width: 15.sp, height: 15.sp, fit: BoxFit.contain),
                                          SizedBox(width: 5.sp),
                                          Text('300',
                                              style: TextStyle(
                                                  fontSize: 12.sp, fontWeight: FontWeight.w400, color: MyApp.textColor)),
                                          Expanded(child: Container()),
                                          Image.asset('assets/ic_live.png', width: 20.sp, height: 20.sp, fit: BoxFit.contain)
                                        ]))
                                  ])),
                              SizedBox(height: 5.sp),
                              Text('Make up Masterclass',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400, color: MyApp.textColor)),
                              SizedBox(height: 5.sp),
                              Row(children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(12.sp),
                                    child: Image.asset('assets/dummy1.png', width: 30.sp, height: 30.sp, fit: BoxFit.fill)),
                                SizedBox(width: 5.sp),
                                Expanded(
                                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                  Text('Seller Name',
                                      style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400, color: MyApp.textColor)),
                                  Row(children: [
                                    Image.asset('assets/ic_star.png', width: 10.sp, height: 10.sp, fit: BoxFit.contain),
                                    SizedBox(width: 5.sp),
                                    Text('4.5',
                                        style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400, color: MyApp.textColor)),
                                    SizedBox(width: 5.sp),
                                    Image.asset('assets/ic_flag.png', width: 12.sp, height: 10.sp, fit: BoxFit.contain)
                                  ])
                                ]))
                              ])
                            ]))));
              }))
    ]);
  }

  _categoriesList() {
    return Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
          padding: EdgeInsets.only(top: 20.sp, left: 12.sp),
          child: Text("Categories", style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600, color: MyApp.textColor))),
      // SizedBox(height: 10.sp),
      Padding(
          padding: EdgeInsets.fromLTRB(8.sp, 6.sp, 8.sp, 6.sp),
          child: GridView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 1.5),
              itemCount: 6,
              physics: BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                    padding: EdgeInsets.all(4.sp),
                    child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => HouseholdScreen()));
                        },
                        child: Container(
                            child: Stack(children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(5.sp),
                              child: Image.asset('assets/dummy8.png',
                                  width: double.infinity, height: double.infinity, fit: BoxFit.cover)),
                          Padding(
                              padding: EdgeInsets.fromLTRB(10.sp, 0, 0, 5.sp),
                              child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text('Mobile &\nGadgets'.toUpperCase(),
                                      style: TextStyle(
                                          height: 0.95,
                                          fontSize: 22.sp,
                                          fontWeight: FontWeight.w400,
                                          color: MyApp.offWhite,
                                          fontFamily: 'BebasNeue'))))
                        ]))));
              }))
    ]);
  }

  void _listener(String text) {
    setState(() {
      if (text.toLowerCase().contains("no data")) {
        selectedWidget = 2;
      } else if (text.isEmpty) {
        selectedWidget = 0;
      } else {
        selectedWidget = 1;
      }
    });
  }

  _noSearchData() {
    return Padding(
        padding: EdgeInsets.only(top: 50.sp),
        child: Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
              Image.asset('assets/ic_sad.png', width: 75.sp, height: 75.sp, fit: BoxFit.cover),
              SizedBox(height: 10.sp),
              Text('Search not found'.toUpperCase(),
                  style: TextStyle(
                      fontSize: 30.sp, fontWeight: FontWeight.w400, color: MyApp.secondaryColor, fontFamily: 'BebasNeue'))
            ])));
  }
}

class RecommendModel {
  String image, name;

  RecommendModel(this.image, this.name);
}

List<RecommendModel> recommendList = [
  RecommendModel('assets/dummy1.png', 'Jason'),
  RecommendModel('assets/dummy2.png', 'Alexa'),
  RecommendModel('assets/dummy3.png', 'Jess'),
  RecommendModel('assets/dummy4.png', 'Lee'),
  RecommendModel('assets/dummy5.png', 'Sam'),
  RecommendModel('assets/dummy3.png', 'Jess'),
  RecommendModel('assets/dummy4.png', 'Lee'),
  RecommendModel('assets/dummy5.png', 'Sam')
];

List<String> liveStoreList = [
  'Apple M1 MacBook Pro 16” 2020',
  'Apple M1 MacBook Pro 16” 2020 macbook',
  'Apple M1 MacBook Pro 16” 2020',
  'Apple M1 MacBook Pro 16” 2020',
  'Apple M1 MacBook Pro 16” 2020 macbook'
];
