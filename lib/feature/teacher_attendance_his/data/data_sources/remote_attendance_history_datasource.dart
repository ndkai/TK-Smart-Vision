import 'dart:convert';
import 'dart:developer';

import 'package:fai_kul/core/constants.dart';
import 'package:fai_kul/core/error/exceptions.dart';
import 'package:fai_kul/feature/attendance_his/data/models/attendance_history_swagger.dart';
import 'package:fai_kul/feature/login/data/models/login_swagger.dart';
import 'package:fai_kul/feature/login/domain/entities/login_response.dart';
import 'package:fai_kul/feature/teacher_attendance_his/data/models/attendance_history_swagger.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

const SAVE_LOGIN_RESPONSE = 'SAVE_LOGIN_RESPONSE';

abstract class RemoteTAttendanceHistoryDataSource {
  Future<TAttendanceHistorySwagger> getAttendanceHistories();

  Future<TAttendanceHistorySwagger> getAttendanceHistoriesByPages(int pageNumber);
}

class RemoteTAttendanceHistoryDataSourceImpl
    implements RemoteTAttendanceHistoryDataSource {
  final http.Client client;

  RemoteTAttendanceHistoryDataSourceImpl({this.client});

  @override
  Future<TAttendanceHistorySwagger> getAttendanceHistories() {
    // TODO: implement getAttendanceHistories
    return _getFromUrl(0);
  }

  @override
  Future<TAttendanceHistorySwagger> getAttendanceHistoriesByPages(
      int pageNumber) {
    // TODO: implement getAttendanceHistoriesByPages
    return _getFromUrl(pageNumber);
  }

  Future<TAttendanceHistorySwagger> _getFromUrl(int number) async {
    String s ="";
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //get loginrp
    final loginResponce = prefs.getString(SAVE_LOGIN_RESPONSE);
    if(loginResponce != null && loginResponce != '') {
      LoginSwagger lr = LoginSwagger.fromJson(json.decode(loginResponce));
      if (number != 0) {
        s = "/?page_number=$number";
      }
      final response = await client
          .get('$mainUrl/v1/TeacherAttendance/Fill',
          headers: {
            "Accept": "application/json",
            "content-type": "application/json",
            'Authorization': 'Bearer ${lr.data.token}', // k co header la failed 415
          });

      if (response.statusCode == 200) {
        log("TAttendanceHistorySwagger: ${response.body}");
        try{
          var swagger =
          TAttendanceHistorySwagger.fromJson(json.decode((response.body)));
          print("loma${swagger.data[1]}");
          return swagger;
        } catch(e){
            print("TAttendanceHistorySwagger ${e.toString()}");
          throw ServerException();
        }


      } else {
        throw ServerException();
      }
    }
    else throw ServerException();

  }
}
