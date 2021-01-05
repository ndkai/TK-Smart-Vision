import 'package:fai_kul/feature/point_input/api/school_class/presentation/manager/school_class/school_class_bloc.dart';
import 'package:fai_kul/feature/point_input/api/school_class/presentation/widgets/school_class_body.dart';
import 'package:fai_kul/main/nar_drawer/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../injection_container.dart';

class SchoolClassPage extends StatefulWidget {
  static const String routeName = "SchoolClassPage";
  @override
  _SchoolClassPageState createState() => _SchoolClassPageState();
}

class _SchoolClassPageState extends State<SchoolClassPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Danh sách lớp'),
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
      body: SingleChildScrollView(
        child: buildBody(context),
      ),
    );
  }

  BlocProvider<SchoolClassBloc> buildBody(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (_) => sl<SchoolClassBloc>(),
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  child: SchoolClassBody(),
                ), // Bottom half
              ],
            ),
          )
        ],
      ),
    );
  }
}
