import 'dart:convert';

import 'package:fai_kul/feature/login/data/data_sources/login_response-data_source.dart';
import 'package:fai_kul/feature/login/data/models/pricipal_login_swagger.dart';
import 'package:fai_kul/main/nar_drawer/body.dart';
import 'package:fai_kul/main/nar_drawer/header_drawer.dart';
import 'package:fai_kul/main/nar_drawer/page_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../main.dart';

class PrincipalDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
      DrawerHeader(
      margin: EdgeInsets.zero,
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image:  AssetImage('assets/images/blue_bg.jpg'))),
          child: Stack(children: <Widget>[
            Positioned(
                bottom: 12.0,
                left: 16.0,
                child: Row(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 30.0,
                      backgroundImage: AssetImage("assets/images/titkul_logo.png"),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(appUser.data.username,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25.0,
                                fontWeight: FontWeight.w500)),
                        Text(appUser.data.roleName,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 10.0,
                                fontWeight: FontWeight.w500))
                      ],
                    )
                  ],
                )),
          ])),
          createDrawerBodyItem(
            icon: Icons.home,
            text: 'Trang chủ',
          ),
          createDrawerBodyItem(
            icon: Icons.loop_rounded,
            text: 'Đổi mật khẩu',
            onTap: () =>
                Navigator.pushReplacementNamed(context, PageRoutes.changePass),
          ),
          createDrawerBodyItem(
            icon: Icons.contact_phone,
            text: 'Thông tin liên lạc',
            onTap: () =>
                Navigator.pushReplacementNamed(context, PageRoutes.info),
          ),
          createDrawerBodyItem(
              icon: Icons.exit_to_app,
              text: 'Đăng xuất',
              onTap: (){
                logout();
                Navigator.pushReplacementNamed(context, PageRoutes.login);
              }

          ),

          ListTile(
            title: Text('App version 1.0.0'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
  static const SAVE_LOGIN_RESPONSE = 'SAVE_LOGIN_RESPONSE';
  void logout(){
    prefs.setString(SAVE_LOGIN_RESPONSE,'');

  }


}

