import 'dart:convert';

import 'package:fai_kul/core/constants.dart';
import 'package:fai_kul/core/error/exceptions.dart';
import 'package:fai_kul/feature/dayoff/school_leave_list/domain/entities/school_leave_list_swagger.dart';
import 'package:fai_kul/main.dart';
import 'package:http/http.dart' as http;
abstract class SchoolLeaveListDataSource{
  Future<SchoolLeaveListSwagger> getData();
}

class SchoolLeaveDataSourceIpm implements SchoolLeaveListDataSource {
  final http.Client client;

  SchoolLeaveDataSourceIpm({this.client});

  @override
  Future<SchoolLeaveListSwagger> getData() {
    // TODO: implement getData
   return _getFromUrl();
  }

  Future<SchoolLeaveListSwagger> _getFromUrl() async {
    var response;
    if(appUser.data.roleName == "PHUHUYNH"){
      response = await client.get(
          '$mainUrl/v1/SchoolLeaveLetter/Fill?EmployeeId=${appStudent.data.id}',
          headers: {
            "Accept": "application/json",
            "content-type": "application/json" // k co header la failed 415
          },).timeout(Duration(seconds: 15));
    }  else{
      response = await client.get(
        '$mainUrl/v1/SchoolLeaveLetter/Fill',
        headers: {
          "Accept": "application/json",
          "content-type": "application/json" // k co header la failed 415
        },).timeout(Duration(seconds: 15));
      }

    print("SchoolLeaveListSwagger ${response.statusCode}");
    if (response.statusCode == 200 || response.statusCode == 201) {
      var swagger;
      try{
        swagger = SchoolLeaveListSwagger.fromJson(json.decode((response.body)));
      }   catch(e){
        print("loi lol gi day ${e.toString()}");
      }

      print("SchoolLeaveListSwagger ${response.statusCode}");
      return swagger;
    }
    else {
      throw ServerException();
    }
  }
}