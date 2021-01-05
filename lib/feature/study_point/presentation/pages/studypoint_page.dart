import 'package:fai_kul/feature/manger_feature/statictis/presentation/statistic/statistic_bloc.dart';
import 'package:fai_kul/feature/study_point/presentation/manager/study_point/study_point_bloc.dart';
import 'package:fai_kul/feature/study_point/presentation/pages/DetailPointPage.dart';
import 'package:fai_kul/feature/study_point/presentation/widgets/studypoint_body.dart';
import 'package:fai_kul/main/nar_drawer/home_page.dart';
import 'package:fai_kul/main/nar_drawer/main_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';

class StudyPointPage extends StatefulWidget {
  static const String routeName = "StudyPointPage";
  @override
  _StudyPointPageState createState() => _StudyPointPageState();
}

class _StudyPointPageState extends State<StudyPointPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Kết quả học tập'),
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
        body: SingleChildScrollView(
          child:  buildBody(context),
        ));
  }


  BlocProvider<StudyPointBloc> buildBody(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (_) => sl<StudyPointBloc>(),
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  child: StudyPointBody(),
                ), // Bottom half
              ],
            ),
          )
        ],
      ),
    );
  }
}
