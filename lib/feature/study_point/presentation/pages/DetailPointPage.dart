import 'package:fai_kul/feature/study_point/domain/entities/studypoin_swagger.dart';
import 'package:fai_kul/feature/study_point/presentation/widgets/studentpoint_header.dart';
import 'package:fai_kul/feature/study_point/presentation/widgets/studypoint_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';

class DetailPointPage extends StatefulWidget {
  final StudyPointSwagger data;

  const DetailPointPage({Key key, this.data}) : super(key: key);
  
  @override
  _DetailPointPageState createState() => _DetailPointPageState();
}

class _DetailPointPageState extends State<DetailPointPage> {
  static const int sortName = 0;
  static const int sortStatus = 1;
  bool isAscending = true;
  int sortType = sortName;
  @override
  void initState() {
    user = User();
    user.initData(6);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
        child: Column(
          children: [
            StudyPointName(studyPointSwagger: widget.data,),
            StudentPointHeader(),
            _getBodyWidget()
          ],
        ),
      )
    );
  }

  Widget _getBodyWidget() {
    return Container(
      child: HorizontalDataTable(
        leftHandSideColumnWidth: 100,
        rightHandSideColumnWidth: 600,
        isFixedHeader: true,
        headerWidgets: _getTitleWidget(),
        leftSideItemBuilder: _generateFirstColumnRow,
        rightSideItemBuilder: _generateRightHandSideColumnRow,
        itemCount: user.userInfo.length,
        rowSeparatorWidget: const Divider(
          color: Colors.black54,
          height: 1.0,
          thickness: 0.0,
        ),
        leftHandSideColBackgroundColor: Color(0xFFFFFFFF),
        rightHandSideColBackgroundColor: Color(0xFFFFFFFF),
      ),
      height: MediaQuery.of(context).size.height,
    );
  }

  List<Widget> _getTitleWidget() {
    return [
      FlatButton(
        padding: EdgeInsets.all(0),
        child: _getTitleItemWidget('Môn học', 100),
        onPressed: () {
        },
      ),
      FlatButton(
        padding: EdgeInsets.all(0),
        child: _getTitleItemWidget('Điểm miệng'+(sortType==sortStatus?(isAscending?'↓':'↑'):''), 100),
        onPressed: () {
        },
      ),
      _getTitleItemWidget('Điểm 15', 100),
      _getTitleItemWidget('Điểm 1 tiết', 100),
      _getTitleItemWidget('Học kì', 100),
    ];
  }

  Widget _getTitleItemWidget(String label, double width) {
    return Container(
      child: Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
      width: width,
      height: 56,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
    );
  }

  Widget _generateFirstColumnRow(BuildContext context, int index) {
    return Container(
      child: Text(user.userInfo[index].name),
      width: 100,
      height: 52,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
    );
  }

  Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
    return Row(
      children: <Widget>[
        Container(
          child: Row(
            children: <Widget>[
              Text("${user._userInfo[index].point}")
            ],
          ),
          width: 100,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Container(
          child:    Text("${user._userInfo[index].point1}"),
          width: 100,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Container(
          child:    Text("${user._userInfo[index].point2}"),
          width: 100,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Container(
          child: Text(""),
          width: 100,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
      ],
    );
  }
}

User user = User();

class User {
  List<UserInfo> _userInfo = List<UserInfo>();
  List<UserInfo> get userInfo => _userInfo;
  set userInfo(List<UserInfo> value) {
    _userInfo = value;
  }

  void initData(int size) {

      _userInfo.add(UserInfo(
          "Toán", 9, 10, 9));
      _userInfo.add(UserInfo(
          "Lý", 8, 4, 6));
      _userInfo.add(UserInfo(
          "Hóa", 9, 4, 8));
      _userInfo.add(UserInfo(
          "Văn", 9, 10, 7));
      _userInfo.add(UserInfo(
          "Anh văn", 9, 10, 3));
    }
  }


class UserInfo {
  String name;
  int point;
  int point1;
  int point2;

  UserInfo(this.name, this.point, this.point1,
      this.point2);
}