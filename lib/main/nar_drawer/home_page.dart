import 'dart:convert';
import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:fai_kul/core/error/exceptions.dart';
import 'package:fai_kul/core/utils/permission_helper.dart';
import 'package:fai_kul/feature/attendance/attendance_method.dart';
import 'package:fai_kul/feature/attendance_his/domain/repositories/history_attendance_repository.dart';
import 'package:fai_kul/feature/attendance_his/domain/use_cases/get_local_attendance_his.dart';
import 'package:fai_kul/feature/attendance_his/presentation/pages/attendance_history_page.dart';
import 'package:fai_kul/feature/change_pass/change_pass_api.dart';
import 'package:fai_kul/feature/choosing_role/choosing_role.dart';
import 'package:fai_kul/feature/dayoff/school_leave_list/presentation/pages/schoolleave_list_page.dart';
import 'package:fai_kul/feature/login/data/models/login_swagger.dart';
import 'package:fai_kul/feature/point_input/api/school_class/presentation/pages/class_page.dart';
import 'package:fai_kul/feature/schedule/schedule_class.dart';
import 'package:fai_kul/feature/study_point/presentation/pages/studypoint_page.dart';
import 'package:fai_kul/feature/teacher_attendance_his/presentation/pages/tattendance_history_page.dart';
import 'package:fai_kul/feature/top_recorder/presentation/pages/recorder_tabs.dart';
import 'package:fai_kul/feature/tuition_fee/presentation/widgets/fee_page.dart';
import 'package:fai_kul/main/component/bottom_nar/bottom_nar.dart';
import 'package:fai_kul/main/component/home_page/card.dart';
import 'package:fai_kul/main/constant/slider_items.dart';
import 'package:fai_kul/main/nar_drawer/drawer_pages/info_page.dart';
import 'package:fai_kul/main/nar_drawer/page_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../injection_container.dart';
import '../../main.dart';
import '../main_utils.dart';
import 'main_drawer.dart';

const SAVE_LOGIN_RESPONSE = 'SAVE_LOGIN_RESPONSE';
const NOTIFY_NUMBER = 'NOTIFY_NUMBER';
String token = "";
GlobalKey<_HomePageState> textGlobalKey = new GlobalKey<_HomePageState>();

class HomePage extends StatefulWidget {
  static const String routeName = '/homePage';

  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count;

  void duma(int number) {
    setState(() {
      count = number;
      print('asd$number');
    });
  }

  void countNotificationState(int number) {
    setState(() {
      count = number;
    });
  }

  void countNotificationStateWithNumber(int number) {
    setState(() {
      count = number;
    });
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Thoát?'),
            content: new Text('Bạn thật sự muốn thoát chứ?'),
            actions: <Widget>[
              new FlatButton(
                onPressed: () =>
                    SystemChannels.platform.invokeMethod('SystemNavigator.pop'),
                child: new Text('Yes'),
              ),
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text('No'),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    if (appUser.data.roleName == "PHUHUYNH" ||
        appUser.data.roleName == "GIAOVIEN") {
      maybeStartFGS();
    }

    Size size = MediaQuery.of(context).size;
    return
      WillPopScope(
        onWillPop: _onWillPop,
        child:
        Scaffold(
            appBar: AppBar(
              title: Text("Trang chủ"),
              actions: <Widget>[
                Padding(
                    padding: EdgeInsets.only(right: 20.0, top: 0),
                    child: GestureDetector(
                        onTap: () {
                          setNotifyNumber(0);
                          Navigator.pushReplacementNamed(
                              context, PageRoutes.attendanceHis);
                        },
                        child: Stack(
                          children: <Widget>[
                            Icon(
                              Icons.notifications,
                              size: 26.0,
                              color: Colors.yellowAccent,
                            ),
                            count > 0
                                ? Text(
                                    count.toString(),
                                    style: TextStyle(color: Colors.red),
                                  )
                                : Text("")
                          ],
                        ))),
              ],
            ),
            drawer: NavigationDrawer(),
            bottomNavigationBar: BottomNar(index: 0),
            body: SingleChildScrollView(
                child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  homeHeader(size),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      padding: EdgeInsets.only(right: 5.0, top: 5, left: 5),
                      color: Colors.transparent,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          functionWidget(size),
                        ],
                      )),
                  SizedBox(height: 20),
                ],
              ),
            )))
    );
  }

  Widget slider(Size size) {
    return Container(
        color: Colors.lightGreen,
        child: CarouselSlider(
          options: CarouselOptions(
            height: size.height * 0.23,
            enableInfiniteScroll: true,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
          ),
          items: child,
        ));
  }

  Widget homeHeader(Size size) {
    return Container(
        height: size.height * 0.05,
        color: Colors.blue,
        child: Center(
          child: Text(
            "Xin chào! ${appUser.data.displayName}",
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ));
  }

  Widget functionWidget(Size size) {
    return Container(
        margin: const EdgeInsets.only(left: 15, right: 15, bottom: 10, top: 0),
        width: size.width,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      if (appUser.data.roleName == "GIAOVIEN") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => TAttendanceHisPage()),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AttendanceHisPage()),
                        );
                      }
                    }, // handle your onTap here
                    child: CustomCard(
                      image: 'assets/icons/kids.png',
                      title: "Điểm danh",
                      isActive: true,
                      color: Colors.green,
                    ),
                  ),
                ),
                appUser.data.roleName == "PHUHUYNH"
                    ? Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () =>  Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => FeePage()),
                          ),
                          // handle your onTap here
                          child: CustomCard(
                            image: 'assets/icons/growingmoney.png',
                            title: "Học phí",
                            isActive: true,
                            color: Colors.orange,
                          ),
                        ),
                      )
                    : Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () =>  Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => RecorderTabs()),
                          ),
                          // handle your onTap here
                          child: CustomCard(
                            image: 'assets/images/course_image.png',
                            title: "Sổ đầu bài",
                            isActive: true,
                            color: Colors.orange,
                          ),
                        ),
                      ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => StudyPointPage()),
                    ),
                    // handle your onTap here
                    child: CustomCard(
                      image: 'assets/icons/studet_score.png',
                      title: "Kết quả học tập",
                      isActive: true,
                      color: Colors.red,
                    ),
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SchedulePage()),
                    ),
                    // handle your onTap here
                    child: CustomCard(
                      image: 'assets/icons/schedule_icon.png',
                      title: "Thời khóa biểu",
                      isActive: true,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Material(
                  color: Colors.transparent,
                  child: appUser.data.roleName == "PHUHUYNH"
                      ? InkWell(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => RecorderTabs()),
                          ),
                          // handle your onTap here
                          child: CustomCard2(
                            image: 'assets/icons/mobietracking.png',
                            title: "Tình hình tiết học",
                            isActive: true,
                            color: Colors.greenAccent,
                          ),
                        )
                      : InkWell(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SchoolClassPage()),
                          ),
                          // handle your onTap here
                          child: CustomCard2(
                            image: 'assets/icons/mobietracking.png',
                            title: "Nhập điểm",
                            isActive: true,
                            color: Colors.greenAccent,
                          ),
                        ),
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SchoolLeaveListPage()),
                      ),
                      // handle your onTap here
                      child: CustomCard2(
                        image: 'assets/icons/school_leave.png',
                        title: "Nghỉ phép",
                        isActive: true,
                        color: Colors.redAccent,
                      ),
                    )),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => InfoPage()),
                    ), // handle your onTap here
                    child: CustomCard2(
                      image: 'assets/icons/support.png',
                      title: "Hỗ trợ",
                      isActive: true,
                      color: Colors.redAccent,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: <Widget>[
            //     Material(
            //       color: Colors.transparent,
            //       child: appUser.data.roleName == "PHUHUYNH"
            //           ? InkWell(
            //         onTap: () =>  Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //               builder: (context) => SchoolLeaveListPage()),
            //         ),
            //         // handle your onTap here
            //         child: CustomCard2(
            //           image: 'assets/icons/school_leave.png',
            //           title: "Nghỉ phép",
            //           isActive: true,
            //           color: Colors.redAccent,
            //         ),
            //       )
            //           : InkWell(
            //         onTap: () => Navigator.pushReplacementNamed(
            //             context, PageRoutes.schoolClassPage),
            //         // handle your onTap here
            //         child: CustomCard2(
            //           image: 'assets/icons/mobietracking.png',
            //           title: "Nhập điểm",
            //           isActive: true,
            //           color: Colors.greenAccent,
            //         ),
            //       ),
            //     ),
            //     Material(
            //       color: Colors.transparent,
            //       child: InkWell(
            //         // onTap: () => Navigator.pushReplacementNamed(
            //         //     context, PageRoutes.schedule), // handle your onTap here
            //         child: CustomCard2(
            //           image: 'assets/icons/comunication.png',
            //           title: "....",
            //           isActive: true,
            //           color: Colors.blueAccent,
            //         ),
            //       ),
            //     ),
            //     Material(
            //       color: Colors.transparent,
            //       child: InkWell(
            //         onTap: () => Navigator.pushReplacementNamed(
            //             context, PageRoutes.info), // handle your onTap here
            //         child: CustomCard2(
            //           image: 'assets/icons/support.png',
            //           title: "....",
            //           isActive: true,
            //           color: Colors.redAccent,
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ));
  }

  @override
  void initState() {
    super.initState();
    checkLocationpermission();
    duma(getNotifyNumber());
    getOfflineNotify();
    // setDayOff(1, DateTime.now().toString(), DateTime.now().toString(), "Khong cos gif");
  }

  void setNotifyNumber(int number) {
    prefs.setString(NOTIFY_NUMBER, number.toString());
  }

  int getNotifyNumber() {
    try {
      String s = prefs.getString(NOTIFY_NUMBER);
      return int.parse(s);
    } catch (e) {
      return 0;
    }
  }

  void getOfflineNotify() async {
    int a = await getLocalAttendanceHis();
    int b = await getRealtimeAttendanceHis();
    if (b - a > 0) {
      duma(b - a);
    }
  }

  Future<int> getLocalAttendanceHis() async {
    var s = await sl<AttendanceHistoryRepository>().getLocalAttendanceHis();
    int result = 0;
    s.fold((wrong) => {print('duyuyuyu${wrong.toString()}')},
        (right) => {result = right.data.items.length});
    return result;
  }

  Future<int> getRealtimeAttendanceHis() async {
    var s = await sl<AttendanceHistoryRepository>().geAttendanceHistory();
    int result = 0;
    s.fold((wrong) => {print('duyuyuyu11${wrong.toString()}')},
        (right) => {result = right.data.items.length});
    return result;
  }

}



