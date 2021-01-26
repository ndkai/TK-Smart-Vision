import 'dart:convert';
import 'dart:typed_data';

import 'package:fai_kul/core/constants.dart';
import 'package:fai_kul/feature/attendance/attendance_method.dart';
import 'package:fai_kul/feature/login/presentation/components/rounded_button.dart';
import 'package:fai_kul/feature/login/presentation/widgets/loading_widget.dart';
import 'package:fai_kul/feature/study_point/domain/entities/studypoin_swagger.dart';
import 'package:fai_kul/main.dart';
import 'package:fai_kul/main/nar_drawer/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:painter/painter.dart';

import 'api_method/employee_swagger.dart';
import 'api_method/school_leave_api.dart';
import 'sign_page/sign_page.dart';

GlobalKey<_SchoolLeaveBodyState> schoolLeaveBodyKey =
    new GlobalKey<_SchoolLeaveBodyState>();

class SchoolLeaveBody extends StatefulWidget {
  final String address;
  final String relation;
  final DateTime fromDay;
  final DateTime toDay;
  final String reason;

  const SchoolLeaveBody({
    Key key,
    this.address,
    this.relation,
    this.fromDay,
    this.toDay,
    this.reason,
  }) : super(key: key);

  @override
  _SchoolLeaveBodyState createState() => _SchoolLeaveBodyState();
}

class _SchoolLeaveBodyState extends State<SchoolLeaveBody> {
  Employee employee;
  double space = 7;
  int dayleave = 0;
  bool isSign = false;
  PictureDetails signPicture = null;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentEmployee();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    dayleave = widget.toDay.difference(widget.fromDay).inDays;
    return  Scaffold(
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
        child:Container(
          margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
          child: letter(size),
        ),
      )
    );
  }

  Widget letter(Size size) {
    try {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: space),
          Center(
              child: RichText(
            text: TextSpan(children: <TextSpan>[
              TextSpan(
                  text: 'CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: size.width * 0.04)),
            ]),
          )),
          SizedBox(height: space),
          Center(
              child: RichText(
            text: TextSpan(children: <TextSpan>[
              TextSpan(
                  text: 'Độc lập - tự do - hạnh phúc',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: size.width * 0.04)),
            ]),
          )),
          SizedBox(height: 10),
          Center(
            child: Text('Đơn xin nghỉ học',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: size.width * 0.07)),
          ),
          SizedBox(height: space),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(children: <TextSpan>[
                  TextSpan(
                      text: 'Kính gửi:',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: size.width * 0.04)),
                ]),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(' - Ban giám hiệu ',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: size.width * 0.04)),
                      // Text(employee.classx.department.name,
                      //     overflow: TextOverflow.clip,
                      //     style: TextStyle(
                      //         color: Colors.black,
                      //         fontWeight: FontWeight.bold,
                      //         fontSize: size.width * 0.04)),
                    ],
                  ),
                  SizedBox(height: space),
                  Row(
                    children: [
                      Text(' - Giáo viên chủ nhiệm ',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: size.width * 0.04)),
                      Text(employee.classx.name,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: size.width * 0.04)),
                    ],
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: space,
          ),
          contentText(size, 'Tôi tên: ${appUser.data.parent.fullName}'),
          SizedBox(
            height: space,
          ),
          contentText(size,
              'Địa chỉ: ${widget.address}  là phụ huynh em ${employee.fullName} hiện là học sinh ${employee.classx.name} trường ${employee.classx.department.name}'),
          SizedBox(
            height: space,
          ),
          contentText(
              size,
              'Kính xin Ban giám hiệu, Giáo viên chủ nhiệm lớp ${employee.classx.name} cho phép con tôi được nghĩ học trong ${dayleave} ngày, bắt đầu '
              'từ ngày thứ ${widget.fromDay.weekday + 1} kể từ ngày ${widget.fromDay.day}/${widget.fromDay.month}/${widget.fromDay.year} đến ngày ${widget.toDay.day}/${widget.toDay.month}/${widget.toDay.year}, '
              'sau thời gian này con tôi sẽ đi học bình thường.'),
          SizedBox(
            height: space,
          ),
          contentText(size, "Lý do ${widget.reason}"),
          SizedBox(
            height: space,
          ),
          contentText(size,
              "Tôi xin hoàn toàn chụi trách nhiệm về sự vắng mặt của con tôi."),
          SizedBox(
            height: space,
          ),
          Text("Trân trọng kính chào.",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  fontStyle: FontStyle.italic,
                  fontSize: size.width * 0.04)),
          SizedBox(
            height: space,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    "TP.HCM, ngày ${DateTime.now().day} tháng ${DateTime.now().month} năm ${DateTime.now().year}",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.italic,
                        fontSize: size.width * 0.04)),
                SizedBox(
                  height: space,
                ),
                contentText(size, "PHỤ HUYNH KÝ TÊN"),
                SizedBox(
                  height: space,
                ),
                signPicture == null
                    ? Text("Ký tên")
                    : Container(
                        height: size.width * 0.2,
                        width: size.width * 0.2,
                        alignment: Alignment.center,
                        child: new FutureBuilder<Uint8List>(
                          future: signPicture.toPNG(),
                          builder: (BuildContext context,
                              AsyncSnapshot<Uint8List> snapshot) {
                            switch (snapshot.connectionState) {
                              case ConnectionState.done:
                                if (snapshot.hasError) {
                                  return new Text('Error: ${snapshot.error}');
                                } else {
                                  return Image.memory(snapshot.data);
                                }
                                break;
                              default:
                                return new Container(
                                    child: new FractionallySizedBox(
                                  widthFactor: 0.1,
                                  child: new AspectRatio(
                                      aspectRatio: 1.0,
                                      child: new CircularProgressIndicator()),
                                  alignment: Alignment.center,
                                ));
                            }
                          },
                        )),
                SizedBox(
                  height: 5,
                ),
                Text("${appUser.data.parent.fullName}"),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          Center(
            child: isSign
                ? RoundedButton(
                    text: "Gửi",
                    color: Colors.blue,
                    press: () async {
                        bool result = await postSchoolLeaveLetter(
                            employee.fullName,
                            employee.phoneNumber,
                            employee.address,
                            widget.relation,
                            dayleave,
                            widget.fromDay.weekday + 1,
                            widget.fromDay.toIso8601String(),
                            widget.toDay.toIso8601String(),
                            widget.reason,
                            DateTime.now().toIso8601String(),
                            employee.id);
                        if(result == true) {
                          showSuccessDialog(context);
                      } else{
                          showFailedDialog(context);
                        }
                    })
                : RoundedButton(
                    text: "Ký tên",
                    color: Colors.blue,
                    press: () async {
                      showSignDialog(context);
                    }),
          ),
          SizedBox(
            height: 30,
          ),
        ],
      );
    } catch (e) {
      return LoadingWidget();
    }
  }

  Widget contentText(Size size, String s) {
    return Text(s,
        style: TextStyle(
            color: Colors.black,
            height: 1.7,
            fontWeight: FontWeight.normal,
            fontSize: size.width * 0.04));
  }

  Future<Employee> getCurrentEmployee() async {
    final response = await client.get(
      "$mainUrl/v1/Employee/${appUser.data.parent != null ? appUser.data.parent.id : appUser.data.teacher.id}",
      headers: {
        "Accept": "application/json",
        "content-type": "application/json",
        'Authorization': 'Bearer ${appUser.data.token}',
        // k co header la failed 415
      },
    );
    print("changePass${response.statusCode}");
    if (response.statusCode == 200) {
      print("getCurrentEmployee thanh cong");
      var swagger = EmployeeSwagger.fromJson(json.decode((response.body)));
      print("getCurrentEmployee thanh cong");
      setState(() {
        employee = swagger.data;
      });
      return swagger.data;
    }
    return null;
  }

  void showSuccessDialog(BuildContext context) {
    print("change pass dialog");
    var alert = new AlertDialog(
      backgroundColor: Colors.white,
      title: Text("Gửi thành công"),
      actions: <Widget>[
        new FlatButton(
          child: Text("OK"),
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ],
    );
    showDialog(
        context: context,
        builder: (context) {
          return alert;
        });
  }

  void showFailedDialog(BuildContext context) {
    var alert = new AlertDialog(
      backgroundColor: Colors.white,
      title: Text("Vui lòng thử lại"),
      actions: <Widget>[
        new FlatButton(
          child: Text("OK"),
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ],
    );
    showDialog(
        context: context,
        builder: (context) {
          return alert;
        });
  }

  void showSignDialog(BuildContext context) {
    var alert = new AlertDialog(
      backgroundColor: Colors.white,

      title: Column(
        children: [
          Text("Ký tên"),
          SignPage(
            key: signStateKey,
          ),
        ],
      ),
      actions: <Widget>[
        new FlatButton(
          child: Text("OK"),
          onPressed: () {
            Navigator.pop(context);
            setState(() {
              print("signPicture xxxxx");
              signPicture = signStateKey.currentState.getPicture();
              isSign = true;
            });
          },
        ),
        new FlatButton(
          child: Text("Hủy"),
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ],
    );
    showDialog(
        context: context,
        builder: (context) {
          return alert;
        });
  }
}
