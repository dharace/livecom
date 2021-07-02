import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../main.dart';
import 'Widgets/Appbar.dart';
import 'Widgets/Searchbar.dart';

class HouseholdScreen extends StatefulWidget {
  @override
  _HouseholdScreenState createState() => _HouseholdScreenState();
}

class _HouseholdScreenState extends State<HouseholdScreen> with SingleTickerProviderStateMixin {
  TextEditingController searchController;
  TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this, initialIndex: 1);
    searchController = TextEditingController(text: '');
    searchController.addListener(() {
      // _listener(searchController.text);
    });
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyApp.lightBackColor,
        body: SafeArea(
            child: Column(mainAxisSize: MainAxisSize.max, children: [
          Appbar('Household', onBackPressed: () {
            Navigator.pop(context);
          }),
          SizedBox(height: 5.sp),
          Searchbar(searchController, 'Search Household...'),
          SizedBox(height: 15.sp),
          TabBar(
            unselectedLabelColor: MyApp.textColor,
            labelColor: MyApp.textColor,
            labelPadding: EdgeInsets.symmetric(vertical: 0.sp),
            tabs: [
              SizedBox(height: 30.sp, child: Tab(text: 'LIVE STREAM')),
              SizedBox(height: 30.sp, child: Tab(text: 'LIVE STORE'))
            ],
            labelStyle: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600, color: MyApp.textColor),
            unselectedLabelStyle: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600, color: MyApp.textColor),
            controller: _tabController,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: MyApp.primaryColor,
            indicatorWeight: 4,
            indicatorPadding: EdgeInsets.only(left: 20.sp, right: 20.sp, top: 0.sp),
          ),
          Expanded(
              child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: MyApp.darkBackColor,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(15.sp), topRight: Radius.circular(15.sp))),
                  child: TabBarView(controller: _tabController, children: [
                    _liveStreamList(),
                    _liveStoreList(),
                  ])))
        ])));
  }

  _liveStoreList() {
    return Padding(
        padding: EdgeInsets.fromLTRB(10.sp, 10.sp, 10.sp, 0.sp),
        child: GridView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 3 / 4),
            itemCount: 8,
            physics: BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                  padding: EdgeInsets.all(10.sp),
                  child: Container(
                      child: Container(
                          child: Column(mainAxisSize: MainAxisSize.max, children: [
                    Expanded(
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(5.sp),
                          child: Stack(children: [
                            Image.asset('assets/dummy6.png', fit: BoxFit.cover),
                            Image.asset('assets/shadow.png', fit: BoxFit.cover),
                            Padding(
                                padding: EdgeInsets.all(5.sp),
                                child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Image.asset('assets/ic_watch.png', width: 15.sp, height: 15.sp, fit: BoxFit.contain),
                                      SizedBox(width: 5.sp),
                                      Text('00:71:25',
                                          style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400, color: MyApp.textColor)),
                                      Expanded(child: Container()),
                                      Image.asset('assets/ic_arrow.png', width: 15.sp, height: 15.sp, fit: BoxFit.contain)
                                    ]))
                          ])),
                    ),
                    SizedBox(height: 5.sp),
                    Text('Apple M1 MacBook Pro 16” 2020',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w400, color: MyApp.textColor)),
                    SizedBox(height: 5.sp),
                    Row(children: [
                      Image.asset('assets/ic_coin.png', width: 15.sp, height: 15.sp, fit: BoxFit.contain),
                      SizedBox(width: 5.sp),
                      Text('500', style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600, color: MyApp.textColor))
                    ])
                  ]))));
            }));
  }

  _liveStreamList() {
    return Padding(
        padding: EdgeInsets.fromLTRB(10.sp, 10.sp, 10.sp, 0.sp),
        child: GridView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 3 / 4),
            itemCount: 8,
            physics: BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                  padding: EdgeInsets.all(10.sp),
                  child: Container(
                      child: Column(mainAxisSize: MainAxisSize.max, crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Expanded(
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(5.sp),
                          child: Stack(children: [
                            Image.asset('assets/dummy7.png', fit: BoxFit.cover),
                            Image.asset('assets/shadow.png', fit: BoxFit.cover),
                            Padding(
                                padding: EdgeInsets.all(5.sp),
                                child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Image.asset('assets/ic_eye.png', width: 15.sp, height: 15.sp, fit: BoxFit.contain),
                                      SizedBox(width: 5.sp),
                                      Text('300',
                                          style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400, color: MyApp.textColor)),
                                      Expanded(child: Container()),
                                      Image.asset('assets/ic_live.png', width: 20.sp, height: 20.sp, fit: BoxFit.contain)
                                    ]))
                          ])),
                    ),
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
                          Text('4.5', style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400, color: MyApp.textColor)),
                          SizedBox(width: 5.sp),
                          Image.asset('assets/ic_flag.png', width: 12.sp, height: 10.sp, fit: BoxFit.contain)
                        ])
                      ]))
                    ])
                  ])));
            }));
  }
}
