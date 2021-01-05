import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:fai_kul/feature/dayoff/dayoff_page.dart';
import 'package:fai_kul/feature/login/domain/entities/login_response.dart';
import 'package:fai_kul/feature/login/domain/use_cases/login.dart';
import 'package:fai_kul/feature/login/presentation/pages/login_input_page.dart';
import 'package:fai_kul/feature/manger_feature/statictis/presentation/pages/manager_statictic_page.dart';
import 'package:fai_kul/feature/notification/notification_api/presentation/pages/notification_page.dart';
import 'package:fai_kul/feature/study_point/presentation/pages/studypoint_page.dart';
import 'package:fai_kul/feature/top_recorder/data/data_sources/remote_recorder_datasource.dart';
import 'package:fai_kul/feature/top_recorder/presentation/pages/comment_page.dart';
import 'package:fai_kul/feature/top_recorder/presentation/pages/recorder_page.dart';
import 'package:fai_kul/feature/top_recorder/presentation/pages/recorder_tabs.dart';
import 'package:fai_kul/main/main_utils.dart';
import 'package:http/http.dart' as http;
import 'package:fai_kul/core/error/exceptions.dart';
import 'package:fai_kul/feature/attendance_his/presentation/pages/attendance_history_page.dart';
import 'package:fai_kul/feature/location/location_page.dart';
import 'package:fai_kul/feature/login/presentation/pages/loginpage.dart';
import 'package:fai_kul/feature/notification/notification.dart';
import 'package:fai_kul/feature/schedule/schedule_class.dart';
import 'package:fai_kul/feature/train_image/train_camera.dart';
import 'package:fai_kul/main/nar_drawer/drawer_pages/attendance_page.dart';
import 'package:fai_kul/main/nar_drawer/page_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:foreground_service/foreground_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:signalr_core/signalr_core.dart';
import 'feature/change_pass/presentation/change_pass_page.dart';
import 'feature/choosing_role/choosing_role.dart';
import 'feature/foreground_service/foreground_service.dart';
import 'feature/login/data/models/login_swagger.dart';
import 'feature/point_input/api/class_student/presentation/pages/class_student_page.dart';
import 'feature/point_input/api/contact_book/presentation/pages/contactbook_page.dart';
import 'feature/point_input/api/school_class/presentation/pages/class_page.dart';
import 'feature/teacher_attendance_his/presentation/pages/tattendance_history_page.dart';
import 'feature/tuition_fee/data/data_sources/remote_student_fee.dart';
import 'feature/tuition_fee/presentation/widgets/fee_page.dart';
import 'injection_container.dart' as di;
import 'main.dart';
import 'main/nar_drawer/drawer_pages/info_page.dart';
import 'main/nar_drawer/drawer_pages/managermant_page.dart';
import 'main/nar_drawer/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  prefs = await SharedPreferences.getInstance();
  runApp(MyApp());

}

SharedPreferences prefs;
LoginSwagger appUser;

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver{
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print('MyApp state = $state');
    if (state == AppLifecycleState.inactive) {
        // maybeStartFGS();
      // app transitioning to other state.
    } else if (state == AppLifecycleState.paused) {
      // app is on the background.
    } else if (state == AppLifecycleState.detached) {
      // flutter engine is running but detached from views
    } else if (state == AppLifecycleState.resumed) {
      // app is visible and running.
      // maybeStartFGS();
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    var initializationSettingsAndroid =
    AndroidInitializationSettings('flutter_devs');
    var initializationSettingsIOs = IOSInitializationSettings();
    var initSetttings = InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOs);

    flutterLocalNotificationsPlugin.initialize(initSetttings,
        onSelectNotification: onSelectNotification);
    
  }


  Future onSelectNotification(String payload) {
    Navigator.pushReplacementNamed(context, PageRoutes.attendanceHis);
  }

  Future<void> cancelNotification() async {
    await flutterLocalNotificationsPlugin.cancel(0);
  }

  void showNotification(int activity) async {
    print("yeu em 3k");
    var android = new AndroidNotificationDetails(
        'id', 'channel ', 'description',
        priority: Priority.High, importance: Importance.Max);
    var iOS = new IOSNotificationDetails();
    var platform = new NotificationDetails(android, iOS);
    if(activity == 0){
      await flutterLocalNotificationsPlugin.show(
          0, 'Attendance successful', 'Your child is in school now', platform,
          payload: 'Welcome to the Local Notification demo ');
    }   else
      if(activity == 1){
        await flutterLocalNotificationsPlugin.show(
            0, 'Điểm danh thành công', 'Your child has left school', platform,
            payload: 'Welcome to the Local Notification ');
      }

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue,
        accentColor: Colors.blue,
      ),
      home: Scaffold(
        body: LoginPage(),
      ),
      routes: {
        PageRoutes.home: (context) => HomePage(key: textGlobalKey,),
        PageRoutes.attendanceHis: (context) => AttendanceHisPage(),
        PageRoutes.login: (context) => LoginPage(),
        PageRoutes.info: (context) => InfoPage(),
        PageRoutes.management: (context) => ManagementPage(),
        PageRoutes.location: (context) => LocationPage(),
        PageRoutes.attendance: (context) => AttendancePage(),
        PageRoutes.schedule: (context) => SchedulePage(),
        PageRoutes.traincamera: (context) => TrainCamera(),
        PageRoutes.feePage: (context) => FeePage(),
        PageRoutes.recorderPage: (context) => RecorderPage(),
        PageRoutes.recorderTabs: (context) => RecorderTabs(),
        PageRoutes.commentPage: (context) => CommentPage(initStart: 1,),
        PageRoutes.changePass: (context) => ChangePassPage(),
        PageRoutes.dateOffPage: (context) => DayOffPage(),
        PageRoutes.managerPage: (context) => ManagerStatisticPage(),
        PageRoutes.choosingRolePage: (context) => ChoosingRolePage(),
        PageRoutes.loginInputPage: (context) => LoginInputPage(),
        PageRoutes.tattendanceHis: (context) => TAttendanceHisPage(),
        PageRoutes.studyPoint: (context) => StudyPointPage(),
        PageRoutes.schoolClassPage: (context) => SchoolClassPage(),
        PageRoutes.classStudentPage: (context) => ClassStudentPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }


  Future<void> _initHub() async {
    final connection = HubConnectionBuilder().withUrl(
        'http://api.dev.vinakul.com/hub',
        HttpConnectionOptions(
          transport: HttpTransportType.longPolling,
          logging: (level, message) => print('xxx$message'),
          accessTokenFactory: () => _getToken(),
        )).withAutomaticReconnect()
        .build();
    connection.on('AttendanceNotification',  (message) async {
      print('_initHubx:$message');
      if (!message.contains('Content')) {
        await showNotification(0);
        int a = getNotifyNumber();
        if (a == null) {
          a = 1;
        }
        print("getNotifyNumber$a");
        setNotifyNumber(a + 1);
        textGlobalKey.currentState.duma(a+1);
        print("getNotifyNumber2${ getNotifyNumber()}");
      }
    });
    await connection.start();
    print('_initHub start');

    await connection.invoke(
        'NotifyToCaller', args: ['AttendanceNotification', "Content"]);
  }


  Future<String> _getToken() async {
    //get loginrp
    final loginResponce = prefs.getString(SAVE_LOGIN_RESPONSE);
    if (loginResponce != null && loginResponce != '') {
      var responce = LoginSwagger.fromJson(json.decode(loginResponce));
      print('_getToken${responce.data.token}');
      return responce.data.token;
    } else {
      throw CacheException();
    }
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

  void _toggleForegroundServiceOnOff() async {
    final fgsIsRunning = await ForegroundService.foregroundServiceIsStarted();
     print("_toggleForegroundServiceOnOff");
    if (fgsIsRunning) {
      print("_toggleForegroundServiceOnOff1");
    } else {
      print("_toggleForegroundServiceOnOff2");
      maybeStartFGS();
    }
  }
}

void maybeStartFGS() async {
    await ForegroundService.setServiceIntervalSeconds(30);

    //necessity of editMode is dubious (see function comments)
    // await ForegroundService.notification.startEditMode();
    // await ForegroundService.notification
    //     .setTitle("Example Title: ${DateTime.now()}");
    // await ForegroundService.notification.setPriority(AndroidNotificationPriority.DEFAULT);
    // await ForegroundService.notification
    //     .setText("Example Text: ${DateTime.now()}");

    // await ForegroundService.notification.finishEditMode();
    await ForegroundService.startForegroundService(foregroundServiceFunction);
    await ForegroundService.getWakeLock();

  ///this exists solely in the main app/isolate,
  ///so needs to be redone after every app kill+relaunch
  await ForegroundService.setupIsolateCommunication((data) {
    debugPrint("main received: $data");
  });
} 

void foregroundServiceFunction() {
  debugPrint("The current time is: ${DateTime.now()}");
   setAttendanceNotification();
  if (!ForegroundService.isIsolateCommunicationSetup) {
    ForegroundService.setupIsolateCommunication((data) {
      debugPrint("bg isolate received: $data");
    });
  }

  ForegroundService.sendToPort("message from bg isolate");
}


