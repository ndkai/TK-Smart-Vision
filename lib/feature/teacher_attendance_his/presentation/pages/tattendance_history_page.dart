import 'package:fai_kul/feature/attendance_his/presentation/manager/attendance_his/attendance_his_bloc.dart';
import 'package:fai_kul/feature/attendance_his/presentation/widgets/component/attendance_his_listview.dart';
import 'package:fai_kul/feature/attendance_his/presentation/widgets/component/body.dart';
import 'package:fai_kul/feature/login/presentation/components/rounded_button.dart';
import 'package:fai_kul/feature/login/presentation/widgets/loading_widget.dart';
import 'package:fai_kul/feature/login/presentation/widgets/message_display.dart';
import 'package:fai_kul/feature/teacher_attendance_his/presentation/manager/tattendance_his/tattendance_his_bloc.dart';
import 'package:fai_kul/feature/teacher_attendance_his/presentation/widgets/component/body.dart';
import 'package:fai_kul/main/component/DateButton.dart';
import 'package:fai_kul/main/component/bottom_nar/bottom_nar.dart';
import 'package:fai_kul/main/nar_drawer/home_page.dart';
import 'package:fai_kul/main/nar_drawer/page_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';

import '../../../../injection_container.dart';
import '../../../../main/nar_drawer/main_drawer.dart';

class TAttendanceHisPage extends StatelessWidget {
  static const String routeName = "TAttendanceHisPage";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text('Thông tin điểm danh'),
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage(key: textGlobalKey,)),
              );
            },
          ),
        ),
        drawer: NavigationDrawer(),
        bottomNavigationBar: BottomNar(index: 2),
       floatingActionButton: FloatingActionButton(
         child: Icon(Icons.face_sharp),
         onPressed: (){
           Navigator.pushReplacementNamed(context, PageRoutes.attendance);
         },
       ),
        body: SingleChildScrollView(
          child: buildBody(context),
        ));
  }

  BlocProvider<TAttendanceHisBloc> buildBody(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<TAttendanceHisBloc>(),
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(0),
            child: Column(
              children: <Widget>[
                TAttendanceHisBody(),
                // Bottom half
              ],
            ),
          )
        ],
      ),
    );
  }
}
