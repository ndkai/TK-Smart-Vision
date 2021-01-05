import 'package:fai_kul/feature/login/presentation/pages/login_input_page.dart';
import 'package:fai_kul/main.dart';
import 'package:fai_kul/main/nar_drawer/page_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

String LoginURL = "";
const String ROLENAME = "APP ROLE NAME";
class ChoosingRolePage extends StatefulWidget {
  static const String routeName = "ChoosingRole";
  @override
  _ChoosingRolePageState createState() => _ChoosingRolePageState();
}

class _ChoosingRolePageState extends State<ChoosingRolePage> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // return Center(
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.center,
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: <Widget>[
    //       Text("Chào mừng", style: TextStyle(color: Colors.green, fontSize: 30),),
    //       Text("đến với phần mềm!", style: TextStyle(color: Colors.green, fontSize: 30),),
    //       Text("Chọn vai trò của bạn", style: TextStyle(color: Colors.black, fontSize: 25),),
    //       SizedBox(height: 30,),
    //       InkWell(
    //         child:  _buildStatCard('Ban giám hiệu', "", Colors.green),
    //         onTap: () {
    //           LoginURL = "/v1/User/Login";
    //           prefs.setString(ROLENAME, "Principal");
    //           Navigator.pushReplacementNamed(context, PageRoutes.loginInputPage);
    //         },
    //       ),
    //       InkWell(
    //         child:  _buildStatCard('Giáo viên', "", Colors.green),
    //         onTap: () {
    //           LoginURL = "/v1/Teacher/Login";
    //           prefs.setString(ROLENAME, "Teacher");
    //           Navigator.pushReplacementNamed(context, PageRoutes.loginInputPage);
    //         },
    //       ),
    //       InkWell(
    //         child:  _buildStatCard('Phụ huynh', "", Colors.green),
    //         onTap: () {
    //           prefs.setString(ROLENAME, "Parent");
    //           LoginURL = "/v1/Parent/Login";
    //           Navigator.pushReplacementNamed(context, PageRoutes.loginInputPage);
    //         },
    //       ),
    //     ],
    //   ),
    // );

    return LoginInputPage();
  }

  Expanded _buildStatCard(String title, String count, MaterialColor color) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            // Text(
            //   count,
            //   style: const TextStyle(
            //     color: Colors.white,
            //     fontSize: 20.0,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

}
