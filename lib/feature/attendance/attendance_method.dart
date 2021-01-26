import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:fai_kul/core/constants.dart';
import 'package:fai_kul/feature/login/data/models/login_swagger.dart';
import 'package:fai_kul/feature/login/domain/entities/login_response.dart';
import 'package:fai_kul/feature/notification/notification.dart';
import 'package:fai_kul/main/main_utils.dart';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';

import '../../main.dart';
http.Client client = http.Client();
Location location = new Location();
Future<bool> attendanceToServer(Function callback) async {
  var locationData = await location.getLocation();
  LoginSwagger loginResponse = getCurrentUser();
  DateTime dateTime = DateTime.now();
  String ngaycc = "${dateTime.year}-${dateTime.month}-${dateTime.day}";
  String giocc = "${dateTime.hour}:${dateTime.minute}:${dateTime.second}";
  print("attendanceToServer${appUser.data.id}");
  var body = jsonEncode( {
    "id": 0,
    "date": "${ngaycc}",
    "time": "${giocc}",
    "activity": 0,
    "temperature": 0,
    "teacherId": appUser.data.id
  });
  final response = await client.post(                            //
      mainUrl+"/v1/ChamCong/ChamCongMobile",
      headers: {
        "Accept": "application/json",
        "content-type": "application/json"       // k co header la failed 415
      },
      body: body);
  print("lolll${response.statusCode}");
  if (response.statusCode == 201 || response.statusCode == 200) {
    String json = response.body;
     print("Diem danh thanh cong");
    showNotification(0);
    callback();
    return true;
  }
  else {
    print("xxx2: ${response.statusCode}");
    print("Diem danh that bai");
    return false;
  }
}