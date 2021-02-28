import 'package:fai_kul/feature/dayoff/school_leave_letter/schoolleave_page.dart';
import 'package:fai_kul/feature/dayoff/school_leave_list/presentation/school_leave_list/school_leave_list_bloc.dart';
import 'package:fai_kul/feature/dayoff/school_leave_list/presentation/widgets/sl_list_body.dart';
import 'package:fai_kul/main.dart';
import 'package:fai_kul/main/nar_drawer/home_page.dart';
import 'package:fai_kul/main/nar_drawer/main_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../injection_container.dart';
class   SchoolLeaveListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Danh sách đơn xin phép'),
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
          ),
        ),
      floatingActionButton:   appUser.data.roleName == "PHUHUYNH"?  FloatingActionButton(
          child: Container(
            child: Icon(Icons.add_circle_outline_rounded)
          ),
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SchoolLeavePage()),
            );
          },
        ):Container(),
        body: SingleChildScrollView(
          child: buildBody(context),
        ));
  }


  BlocProvider<SchoolLeaveListBloc> buildBody(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (_) => sl<SchoolLeaveListBloc>(),
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  child: SLListBody(),
                  decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage("assets/images/blue_bg3.jpg"),fit: BoxFit.fill)
                  ),
                  height: size.height,
                ), // Bottom half
              ],
            ),
          )
        ],
      ),
    );
  }
}


