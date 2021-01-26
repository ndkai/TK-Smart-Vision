
import 'package:fai_kul/feature/dayoff/school_leave_letter/schoolleave_page.dart';
import 'package:fai_kul/feature/dayoff/school_leave_list/presentation/pages/schoolleave_list_page.dart';
import 'package:fai_kul/feature/login/domain/entities/login_response.dart';
import 'package:fai_kul/feature/notification/notification.dart';
import 'package:fai_kul/main.dart';
import 'package:fai_kul/main/nar_drawer/page_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foreground_service/foreground_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'body.dart';
import 'header_drawer.dart';

class NavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          createDrawerHeader(),
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
            icon: Icons.loop_rounded,
            text: 'Nghỉ phép',
            onTap: () =>
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SchoolLeaveListPage()),
                )
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
            onTap: () async{
              logout();
              _toggleForegroundServiceOnOff();
              stop = true;
              try{
                connection.stop();
              } catch(e){
                print("loi lol gi day ${e.toString()}");
              }
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
    print("thoat thanh cong ${prefs.getString(SAVE_LOGIN_RESPONSE)}");
    prefs.setString(SAVE_LOGIN_RESPONSE,'');
    print("thoat thanh cong ${prefs.getString(SAVE_LOGIN_RESPONSE)}");

  }

  void _toggleForegroundServiceOnOff() async {
    await ForegroundService.stopForegroundService();

  }

}

