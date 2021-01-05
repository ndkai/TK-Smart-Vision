import 'dart:convert';

import 'package:fai_kul/core/constants.dart';
import 'package:fai_kul/core/error/exceptions.dart';
import 'package:fai_kul/feature/attendance_his/data/data_sources/remote_attendance_history_datasource.dart';
import 'package:fai_kul/feature/choosing_role/choosing_role.dart';
import 'package:fai_kul/feature/login/data/models/login_swagger.dart';
import 'package:fai_kul/feature/login/domain/entities/login_response.dart';
import 'package:fai_kul/feature/schedule/api/schedule_model.dart';
import 'package:fai_kul/feature/top_recorder/domain/entities/toprecorder_swagger.dart';
import 'package:fai_kul/main.dart';
import 'package:fai_kul/main/main_utils.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


abstract class RemoteRecorderDataSource{
  Future<ScheduleSwagger> getTopRecorder();
}

class RemoteRecorderDataSourceImpl implements RemoteRecorderDataSource{
  final http.Client client;

  RemoteRecorderDataSourceImpl({this.client});
  @override
  Future<ScheduleSwagger> getTopRecorder() {
    return getDataSource();
  }

  Future<ScheduleSwagger> getDataSource() async{
    var response;
    if(appUser.data.roleName == "PHUHUYNH"){
      print("RemoteRecorderDataSourceImplxx${appUser.data.parent.employeeId}");
      response = await client.get(
        mainUrl+"/v1/Schedule/Fill?EmployeeId=${appUser.data.parent.employeeId}",
        headers: {
          "Accept": "application/json",
          "content-type": "application/json"       // k co header la failed 415
        },
      );
    } else{
      print("RemoteRecorderDataSourceImplxx${appUser.data.teacher.id}");
      response = await client.get(
        mainUrl+"/v1/Schedule/Fill?TeacherId=${appUser.data.teacher.id}",
        headers: {
          "Accept": "application/json",
          "content-type": "application/json"       // k co header la failed 415
        },
      );
    }

    print("RemoteRecorderDataSourceImpl: ${response.body}");
    if(response.statusCode == 200){
      var scheduleResponse = ScheduleSwagger.fromJson(json.decode(response.body));
      print("xxxxxxxx${scheduleResponse.data.length}");
      return scheduleResponse;
    }
      else {
        throw ServerException();
      }

  }

}

