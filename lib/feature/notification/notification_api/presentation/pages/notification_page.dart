import 'dart:io';
import 'package:device_apps/device_apps.dart';
import 'package:fai_kul/feature/notification/notification_api/presentation/widgets/notification_listview.dart';
import 'package:fai_kul/main/nar_drawer/home_page.dart';
import 'package:flutter/services.dart';
import 'package:flutter_appavailability/flutter_appavailability.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:open_appstore/open_appstore.dart';
import 'package:url_launcher/url_launcher.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Thông báo"),),
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
          ),
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 20.0, top: 15),
                child: GestureDetector(
                    onTap: () {
                    },
                    child: Stack(
                      children: <Widget>[
                        Icon(
                          Icons.notifications,
                          size: 26.0,
                          color: Colors.yellowAccent,
                        ), Text("")
                      ],
                    ))),
          ],
        ),
        body: SingleChildScrollView(
            child: Container(
              child: NotificationListview(),
        )));
  }
}
