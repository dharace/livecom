import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../main.dart';
import 'Widgets/Appbar.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyApp.lightBackColor,
        body: SafeArea(
            child: Column(mainAxisSize: MainAxisSize.max, children: [
          Appbar('Notification', onBackPressed: () {
            Navigator.pop(context);
          }),
          Expanded(child: _notificationList()),
          _announsementList()
        ])));
  }

  _notificationList() {
    return Container(
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: notificationList.length,
            physics: BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return Slidable(
                actionPane: SlidableDrawerActionPane(),
                //  actionExtentRatio: 0.25,
                secondaryActions: <Widget>[
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          notificationList.removeAt(index);
                        });
                      },
                      child: Image(image: AssetImage("assets/delete.png"), height: 80.sp, fit: BoxFit.cover))
                ],
                child: Container(
                    height: 80.sp,
                    child: Padding(
                        padding: EdgeInsets.only(left: 12.sp, right: 12.sp, bottom: 12.sp),
                        child: Row(mainAxisSize: MainAxisSize.max, children: [
                          Container(
                              height: 70.sp,
                              width: 70.sp,
                              child: Stack(children: [
                                ClipRRect(
                                    borderRadius:
                                        BorderRadius.circular(notificationList[index].type == 'deliveryStatus' ? 10.sp : 28.sp),
                                    child: Image.asset(notificationList[index].image,
                                        width: 65.sp, height: 65.sp, fit: BoxFit.fill)),
                                notificationList[index].type == 'won'
                                    ? Align(
                                        alignment: Alignment.bottomRight,
                                        child: Image.asset('assets/ic_flash.png', width: 30.sp, height: 30.sp, fit: BoxFit.fill))
                                    : Container()
                              ])),
                          SizedBox(width: 15.sp),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(notificationList[index].title, overflow: TextOverflow.ellipsis,
                                    style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600, color: MyApp.textColor)),
                                Text('6 m      ' + notificationList[index].subTitle,overflow: TextOverflow.ellipsis,
                                    style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400, color: MyApp.textColor))
                              ])
                        ]))),
              );
            }));
  }

  _announsementList() {
    return Container(
        height: 100.sp,
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: announcementList.length,
            physics: BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  child: Padding(
                      padding: EdgeInsets.only(left: index == 0 ? 12.sp : 0, right: 12.sp, bottom: 12.sp),
                      child: Container(
                          height: 100.sp,
                          width: 160.sp,
                          child: Stack(children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(5.sp),
                                child: Image.asset(announcementList[index].image,
                                    width: double.infinity, height: double.infinity, fit: BoxFit.cover)),
                            Padding(
                                padding: EdgeInsets.fromLTRB(12.sp, 0, 0, 7.sp),
                                child: Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Text(announcementList[index].title.toUpperCase(),
                                        style: TextStyle(
                                            height: 0.9,
                                            fontSize: 22.sp,
                                            fontWeight: FontWeight.w400,
                                            color: index % 2 == 0 ? MyApp.textColor2 : Colors.white,
                                            fontFamily: 'BebasNeue'))))
                          ]))));
            }));
  }
}

class NotificationModel {
  String image, title, subTitle;
  String type;

  NotificationModel(this.image, this.title, this.subTitle, this.type);
}

List<NotificationModel> notificationList = [
  NotificationModel('assets/dummy2.png', 'Seller123 is going live now', 'Premium Kitchen Set', 'isLive'),
  NotificationModel('assets/dummy2.png', 'Member123 is going live now', 'Premium Kitchen Set...', 'won'),
  NotificationModel('assets/dummy2.png', 'Your LiveWallet balance is low!', '', 'systemMessage'),
  NotificationModel('assets/dummy10.png', 'Your order is on the way now!', '', 'deliveryStatus'),
  NotificationModel('assets/dummy9.png', 'Leave a review for Seller123', '', 'leaveRating'),
];

class AnnouncementModel {
  String image, title;
  AnnouncementModel(this.image, this.title);
}

List<AnnouncementModel> announcementList = [
  AnnouncementModel('assets/dummy11.png', 'Announcement\none'),
  AnnouncementModel('assets/dummy12.png', 'Announcement\ntwo'),
  AnnouncementModel('assets/dummy11.png', 'Announcement\none'),
  AnnouncementModel('assets/dummy12.png', 'Announcement\ntwo'),
  AnnouncementModel('assets/dummy11.png', 'Announcement\none'),
  AnnouncementModel('assets/dummy12.png', 'Announcement\ntwo'),
];
