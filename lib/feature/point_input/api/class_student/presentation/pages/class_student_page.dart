import 'package:fai_kul/feature/point_input/api/class_student/presentation/manager/class_student/class_student_bloc.dart';
import 'package:fai_kul/feature/point_input/api/class_student/presentation/widgets/class_student_body.dart';
import 'package:fai_kul/feature/point_input/api/school_class/presentation/manager/school_class/school_class_bloc.dart';
import 'package:fai_kul/feature/point_input/api/school_class/presentation/pages/class_page.dart';
import 'package:fai_kul/main/nar_drawer/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../injection_container.dart';

int currentClassStudentId = 0;
class ClassStudentPage extends StatefulWidget {
  static const String routeName = "ClassStudentPage";
  final int id;
  const ClassStudentPage({Key key, this.id}) : super(key: key);
  @override
  _ClassStudentPageState createState() => _ClassStudentPageState();
}

class _ClassStudentPageState extends State<ClassStudentPage> {
  @override
  Widget build(BuildContext context) {
    currentClassStudentId = widget.id;
    return Scaffold(
        appBar: AppBar(
          title: Text('Học sinh'),
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SchoolClassPage()),
              );
            },
          ),
        ),
      body: SingleChildScrollView(
        child: buildBody(context),
      )
    );
  }

    BlocProvider<ClassStudentBloc> buildBody(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (_) => sl<ClassStudentBloc>(),
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  child: ClassStudentBody(id: currentClassStudentId,),
                ), // Bottom half
              ],
            ),
          )
        ],
      ),
    );
  }
}
