

import 'dart:convert';

import 'package:fai_kul/core/constants.dart';
import 'package:fai_kul/feature/attendance/attendance_method.dart';
import 'package:fai_kul/feature/choosing_role/choosing_role.dart';
import 'package:fai_kul/feature/login/data/models/login_swagger.dart';
import 'package:fai_kul/feature/login/domain/entities/login_response.dart';
import 'package:fai_kul/feature/schedule/api/schedule_model.dart';
import 'package:fai_kul/main.dart';
import 'package:fai_kul/main/main_utils.dart';
import 'package:http/http.dart';

Future<List<ScheduleResponse>> getScheduleById() async{
  print("getScheduleById${appUser.data.id}");
  Response response;
  if(appUser.data.roleName == "GIAOVIEN"){
      response = await client.get(
      mainUrl+"/v1/Schedule/Fill?TeacherId=${appUser.data.teacher.id}",
      headers: {
        "Accept": "application/json",
        "content-type": "application/json"       // k co header la failed 415
      },
    );

  } else {
     response = await client.get(
      mainUrl+"/v1/Schedule/Fill?EmployeeId=${appUser.data.parent.employeeId}",
      headers: {
        "Accept": "application/json",
        "content-type": "application/json"       // k co header la failed 415
      },
    );
  }
  print("getScheduleById: ${response.statusCode}");
  if(response.statusCode == 200 || response.statusCode == 201){
    var scheduleResponse = ScheduleSwagger.fromJson(json.decode(response.body));
    print("xxxxxxxx${scheduleResponse.data.length}");
    return scheduleResponse.data;
  }
  else{
    return null;
  }

}