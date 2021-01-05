import 'dart:convert';
import 'dart:async';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:fai_kul/core/constants.dart';
import 'package:fai_kul/feature/login/data/models/login_swagger.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:foreground_service/foreground_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:signalr_core/signalr_core.dart';
import 'notify_response.dart';
FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

HubConnection connection;
bool stop = false;
Future<void> setAttendanceNotification() async {
  try{
    connection.stop();
  } catch(e){
    print("loi lol gi day ${e.toString()}");
  }
  bool result = await DataConnectionChecker().hasConnection;
  if(result == true && stop == false ){
    String s = await getToken();
    print('_getTokenqqqqq ${s}');
     connection = HubConnectionBuilder().withUrl(
        '$mainUrl/hub',
        HttpConnectionOptions(
          transport: HttpTransportType.longPolling,
          logging: (level, message) => print('GENERAL_EVENT: $message'),
          accessTokenFactory: () => Future.value(s),
        )).withAutomaticReconnect()
        .build();
   connection.serverTimeoutInMilliseconds = 9999;
    connection.on('GENERAL_EVENT',  (message) async {
      print('GENERAL_EVENT: $message');
      //notication
      if(!message.contains("Content")){
      flutterLocalNotificationsPlugin =
          FlutterLocalNotificationsPlugin();
      var initializationSettingsAndroid =
      AndroidInitializationSettings('ec_logo');
      var initializationSettingsIOs = IOSInitializationSettings();
      var initSetttings = InitializationSettings(
          initializationSettingsAndroid, initializationSettingsIOs);
      flutterLocalNotificationsPlugin.initialize(initSetttings,
          onSelectNotification: onSelectNotification);
      String x =  message.toString().substring(1, message.toString().length-1);
      print(" notification répiness ${message.first.toString()}");
      NotifyResponse notifyResponse = NotifyResponse.fromJson(json.decode(message.first.toString()));
      print(" notification type ${notifyResponse.notificationType}");
       showNotification2(notifyResponse);
    }});

    await connection.start();
    print('_initHub start');
    // await connection
    //     .invoke('NotifyToCaller', args: ['AttendanceNotification', "Content"]);
  }
  else{
    if(stop == true){
      await connection.stop();
    }
    await ForegroundService.notification.setText("${DateTime.now()}");
  }


}


Future onSelectNotification(String payload) {
  // Navigator.pushReplacementNamed(context, PageRoutes.attendanceHis);
}

Future<void> cancelNotification() async {
  await flutterLocalNotificationsPlugin.cancel(0);
}

void showNotification(int activity) async {
  flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  var initializationSettingsAndroid =
  AndroidInitializationSettings('ec_logo');
  var initializationSettingsIOs = IOSInitializationSettings();
  var initSetttings = InitializationSettings(
      initializationSettingsAndroid, initializationSettingsIOs);

  flutterLocalNotificationsPlugin.initialize(initSetttings,
      onSelectNotification: onSelectNotification);
  print("yeu em 3k");
  var android = new AndroidNotificationDetails(
      'id', 'channel ', 'description',
      priority: Priority.High, importance: Importance.Max);
  var iOS = new IOSNotificationDetails();
  var platform = new NotificationDetails(android, iOS);
  if(activity == 0){
    await flutterLocalNotificationsPlugin.show(
        0, 'Chúc mừng bạn đã điểm danh thành công', '', platform,
        payload: 'Welcome to the Local Notification');
  }   else
  if(activity == 1){
    await flutterLocalNotificationsPlugin.show(
        0, 'Thông báo ngày nghỉ', 'Bạn đã nghỉ ngày', platform,
        payload: 'Welcome to the Local Notification ');
  }  else
  if(activity == 2){
    await flutterLocalNotificationsPlugin.show(
        0, 'Cảnh báo', 'Nhiệt độ con của bạn là', platform,
        payload: 'Welcome to the Local Notification ');
  } else
  if(activity == 3){
    await flutterLocalNotificationsPlugin.show(
        0, 'Điểm danh thành công', 'Your child has left school', platform,
        payload: 'Welcome to the Local Notification ');
  } else
  if(activity == 4){
    await flutterLocalNotificationsPlugin.show(
        0, 'Điểm danh thành công', 'Your child has left school', platform,
        payload: 'Welcome to the Local Notification ');
  } else
  if(activity == 5){
    await flutterLocalNotificationsPlugin.show(
        0, 'Bạn đã sắp tới giờ dạy', 'Tiết học tiếp theo bắt đầu vào', platform,
        payload: 'Welcome to the Local Notification ');
  }
}

void showNotification2(NotifyResponse notifyResponse) async {
  flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  var initializationSettingsAndroid =
  AndroidInitializationSettings('ec_logo');
  var initializationSettingsIOs = IOSInitializationSettings();
  var initSetttings = InitializationSettings(
      initializationSettingsAndroid, initializationSettingsIOs);

  flutterLocalNotificationsPlugin.initialize(initSetttings,
      onSelectNotification: onSelectNotification);
  print("yeu em 3k");
  var android = new AndroidNotificationDetails(
      'id', 'channel ', 'description',
      priority: Priority.High, importance: Importance.Max);
  var iOS = new IOSNotificationDetails();
  var platform = new NotificationDetails(android, iOS);

  int activity = notifyResponse.notificationType;
  if(activity == 0){
    await flutterLocalNotificationsPlugin.show(
        1, 'Điểm danh thành công', 'Chúc mừng bạn đã điểm danh thành công', platform,
        payload: 'Welcome to the Local Notification');
  }   else
  if(activity == 1){
    await flutterLocalNotificationsPlugin.show(
        1, 'Thông báo ngày nghỉ', 'Bạn đã nghỉ ngày', platform,
        payload: 'Welcome to the Local Notification ');
  }  else
  if(activity == 2){
    await flutterLocalNotificationsPlugin.show(
        1, 'Cảnh báo', 'Nhiệt độ học sinh là', platform,
        payload: 'Welcome to the Local Notification ');
  } else
  if(activity == 3){
    await flutterLocalNotificationsPlugin.show(
        1, 'Thông báo học phí', 'Bạn có học phí cần phải thanh toán', platform,
        payload: 'Welcome to the Local Notification ');
  } else
  if(activity == 4){
    await flutterLocalNotificationsPlugin.show(
        1, 'Thông báo học phí', 'Bạn đã đóng học phí thành công', platform,
        payload: 'Welcome to the Local Notification ');
  } else
  if(activity == 5){
    await flutterLocalNotificationsPlugin.show(
        1, 'Bạn đã sắp tới giờ dạy', 'Tiết học tiếp theo bắt đầu vào', platform,
        payload: 'Welcome to the Local Notification ');
  }


}

void showFeeNotify(int activity) async {
  flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  var initializationSettingsAndroid =
  AndroidInitializationSettings('ec_logo');
  var initializationSettingsIOs = IOSInitializationSettings();
  var initSetttings = InitializationSettings(
      initializationSettingsAndroid, initializationSettingsIOs);

  flutterLocalNotificationsPlugin.initialize(initSetttings,
      onSelectNotification: onSelectNotification);
  print("yeu em 3k");
  var android = new AndroidNotificationDetails(
      'id', 'channel ', 'description',
      priority: Priority.High, importance: Importance.Max);
  var iOS = new IOSNotificationDetails();
  var platform = new NotificationDetails(android, iOS);
  if (activity == 0) {
    await flutterLocalNotificationsPlugin.show(
        0, 'Thông báo học phí', 'Bạn có học phí cần thanh toán', platform,
        payload: 'Welcome to the Local Notification');
  } else if (activity == 1) {
    await flutterLocalNotificationsPlugin.show(
        0, 'Thông báo học phí', 'Bạn có học phí cần thanh toán', platform,
        payload: 'Welcome to the Local Notification');
  }
}

Future<String> getToken() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  String string = sharedPreferences.getString("SAVE_LOGIN_RESPONSE");
  print("phai loi khong ${string}");
  LoginSwagger lr = LoginSwagger.fromJson(json.decode(string));
  return lr.data.token;
}