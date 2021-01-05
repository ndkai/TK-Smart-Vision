import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';
import 'package:fai_kul/feature/attendance_his/data/models/attendance_history_swagger.dart';
import 'package:fai_kul/feature/teacher_attendance_his/data/models/attendance_history_swagger.dart';
import 'package:fai_kul/main/constant/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TAttenDanceHisListview extends StatefulWidget {
  final List<TAttendanceHistory> list;

  const TAttenDanceHisListview({Key key, this.list}) : super(key: key);

  @override
  _TAttenDanceHisListviewtate createState() => _TAttenDanceHisListviewtate();
}
GlobalKey<_TAttenDanceHisListviewtate> historyListKey = new GlobalKey<_TAttenDanceHisListviewtate>();

class _TAttenDanceHisListviewtate extends State<TAttenDanceHisListview> {
  List<TAttendanceHistory> listState;
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    listState = widget.list;
    ScrollController _controller = new ScrollController();
    return Container(
        height: size.height * 0.8,
        child: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: _buildListItemsFromitems(listState),
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          controller: _controller,
        ));
  }

  List<Container> _buildListItemsFromitems(List<TAttendanceHistory> list) {
    list = list.reversed.toList();
    int index = 0;
    return list.map((item) {
      var parseDate = DateTime.parse(item.date);
      var parseTime = item.time.split(":");
      String trangThai = "";
      item.activity == 1? trangThai = "Điểm danh vào": trangThai = "Điểm danh ra";
      var container = Container(
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 50),
              blurRadius: 20,
              color: kActiveShadowColor,
            )
          ],
        ),
        child: Row(
          children: <Widget>[
            Container(
              height: 50,
              width: 50,
              margin: new EdgeInsets.all(10.0),
              child: item.activity == 1? Image.asset("assets/icons/check_in_icon.png"):Image.asset("assets/icons/checkout_icon.png"),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    new Container(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: new Text(
                        'Thời gian: ${parseTime[0]}:${parseTime[1]} ${parseDate.day}/${parseDate.month}/${parseDate.year}',
                        style: new TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                            color: Colors.black),
                      ),
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    new Container(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: new Text(
                        'Trạng thái: ${trangThai}',
                        style: new TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 15.0,
                            color: Colors.black),
                      ),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      );
      index = index + 1;
      return container;
    }).toList();
  }

  void setList(DateTime startTime, DateTime endTime){
    List<TAttendanceHistory> list1 = List<TAttendanceHistory>();
    for(TAttendanceHistory item in widget.list){
      if(DateTime.parse(item.date).compareTo(startTime) >=0
          && DateTime.parse(item.time).compareTo(endTime) <=0){
        list1.add(item);
      }
    }
    setState(() {
          listState = list1;
          print("asdasd${list1.length}");
    });

  }
}
