import 'dart:io';
import 'package:android_intent/android_intent.dart';
import 'package:device_apps/device_apps.dart';
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
    return Container(
        child: Center(child: RaisedButton(
            onPressed: () {
              // use android_intent package to open other app
              if (Platform.isAndroid) {
                getApp();
              }
            },
            child: Text("Open Facebook")
        ),)
    );
  }

  Future<void> getApp() async {
    List<Map<String, String>> _installedApps;
    if (Platform.isAndroid) {
      _installedApps = await AppAvailability.getInstalledApps();
      for (var i in _installedApps) {
        print("appxx:  ${i.toString()}");
      }
      bool isInstalled = await DeviceApps.isAppInstalled('com.example.iot_app');
      // Returns: Map<String, String>{app_name: Chrome, package_name: com.android.chrome, versionCode: null, version_name: 55.0.2883.91}
      if (isInstalled != false) {
        try {
          launch("market://details?id=" + "enetviet.corp.qi.enetvietnew");
        } on PlatformException catch(e) {
          launch("https://play.google.com/store/apps/details?id=" + "enetviet.corp.qi.enetvietnew");
        } finally {
          launch("https://play.google.com/store/apps/details?id=" + "enetviet.corp.qi.enetvietnew");
        }
      }
      else if (Platform.isIOS) {
        // iOS doesn't allow to get installed apps.
        // _installedApps = iOSApps;

        print(await AppAvailability.checkAvailability("calshow://"));
        // Returns: Map<String, String>{app_name: , package_name: calshow://, versionCode: , version_name: }

      }
    }
  }}