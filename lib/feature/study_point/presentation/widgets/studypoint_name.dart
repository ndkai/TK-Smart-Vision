import 'package:fai_kul/feature/study_point/domain/entities/studypoin_swagger.dart';
import 'package:fai_kul/feature/study_point/presentation/widgets/studentpoint_header.dart';
import 'package:fai_kul/main/constant/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StudyPointName extends StatefulWidget {
  final StudyPointSwagger studyPointSwagger;

  const StudyPointName({Key key, this.studyPointSwagger}) : super(key: key);
  @override
  _StudyPointNameState createState() => _StudyPointNameState();
}

class _StudyPointNameState extends State<StudyPointName> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: EdgeInsets.fromLTRB(20, 5, 20, 0),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 30),
              blurRadius: 20,
              color: kActiveShadowColor,
            )
          ],
          borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      child: info(),
    );
  }


  Widget info(){
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new Container(
                padding: const EdgeInsets.only(left: 10),
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: "Học viên: ",
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                    TextSpan(
                        text: "${widget.studyPointSwagger.data[0].employee.fullName}",
                        style: TextStyle(color: Colors.black)),
                  ]),
                )),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new Container(
                padding: const EdgeInsets.only(left: 10),
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: "Lớp: ",
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                    TextSpan(
                        text: "${widget.studyPointSwagger.data[0].employee.classx.name}",
                        style: TextStyle(color: Colors.black)),
                  ]),
                )),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new Container(
                padding: const EdgeInsets.only(left: 10),
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: "Trường: ",
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                    TextSpan(
                        text: "${widget.studyPointSwagger.data[0].employee.classx.department.name}",
                        style: TextStyle(color: Colors.black)),
                  ]),
                )),
          ],
        ),
      ],
    );
  }
}
