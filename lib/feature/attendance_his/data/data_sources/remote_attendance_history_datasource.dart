import 'dart:convert';
import 'dart:developer';

import 'package:fai_kul/core/constants.dart';
import 'package:fai_kul/core/error/exceptions.dart';
import 'package:fai_kul/feature/attendance_his/data/models/attendance_history_swagger.dart';
import 'package:fai_kul/feature/choosing_role/choosing_role.dart';
import 'package:fai_kul/feature/login/data/models/login_swagger.dart';
import 'package:fai_kul/feature/login/domain/entities/login_response.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../main.dart';

const SAVE_LOGIN_RESPONSE = 'SAVE_LOGIN_RESPONSE';

abstract class RemoteAttendanceHistoryDataSource {
  Future<AttendanceHistorySwagger> getAttendanceHistories();

  Future<AttendanceHistorySwagger> getAttendanceHistoriesByPages(int pageNumber);
}

class RemoteAttendanceHistoryDataSourceImpl
    implements RemoteAttendanceHistoryDataSource {
  final http.Client client;

  RemoteAttendanceHistoryDataSourceImpl({this.client});

  @override
  Future<AttendanceHistorySwagger> getAttendanceHistories() {
    // TODO: implement getAttendanceHistories
    return _getFromUrl(0);
  }

  @override
  Future<AttendanceHistorySwagger> getAttendanceHistoriesByPages(
      int pageNumber) {
    // TODO: implement getAttendanceHistoriesByPages
    return _getFromUrl(pageNumber);
  }

  Future<AttendanceHistorySwagger> _getFromUrl(int number) async {
    String s ="";
    //get loginrp
    final loginResponce = prefs.getString(SAVE_LOGIN_RESPONSE);
    if(loginResponce != null && loginResponce != '') {
      LoginSwagger lr = LoginSwagger.fromJson(json.decode(loginResponce));
      if (number != 0) {
        s = "/?page_number=$number";
      }
      print("AttendanceHistorySwagger${lr.data.token}");
      final response = await client
          .get('$mainUrl/v1/Attendance/GetByParent',
          headers: {
            "Accept": "application/json",
            "content-type": "application/json",
            'Authorization': 'Bearer ${lr.data.token}', // k co header la failed 415
          });
       print("attendance his ${response.statusCode}");
      if (response.statusCode == 200) {
        log("AttendanceHistorySwagger: ${response.body}");
        try{
          var swagger =
          AttendanceHistorySwagger.fromJson(json.decode((response.body)));
          print("loma${swagger.data.items.length}");
          return swagger;
        }  catch(e){
          print("AttendanceHistorySwagger ${e.toString()}");
          throw ServerException();
        }

      } else {
        throw ServerException();
      }
    }
    else throw ServerException();

  }
}
