
import 'package:fai_kul/feature/dayoff/school_leave_letter/school_leave_fill.dart';
import 'package:fai_kul/main/nar_drawer/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SchoolLeavePage extends StatelessWidget {
  static const String routeName = "SchoolLeavePage";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('Nghỉ phép'),
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => HomePage(
                    key: textGlobalKey,
                  )),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: SchoolLeaveFill(),
      ),
    );
  }
}
