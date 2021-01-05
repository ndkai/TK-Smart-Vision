import 'dart:convert';
import 'dart:io';

import 'package:fai_kul/core/constants.dart';
import 'package:fai_kul/core/error/exceptions.dart';
import 'package:fai_kul/feature/choosing_role/choosing_role.dart';
import 'package:fai_kul/feature/login/domain/entities/login_response.dart';
import 'package:fai_kul/feature/point_input/api/school_class/domain/entities/school_class_swagger.dart';
import 'package:fai_kul/main/main_utils.dart';
import 'package:http/http.dart' as http;

import '../../../../../../main.dart';
abstract class RemoteSchoolClassDataSource{
  Future<SchoolClassSwagger> getSchoolClassData();
}

class RemoteSchoolClassDataSourceImpl implements RemoteSchoolClassDataSource{
  final http.Client client;

  RemoteSchoolClassDataSourceImpl({this.client});

  @override
  Future<SchoolClassSwagger> getSchoolClassData() {
    // TODO: implement getSchoolClassData
    return _getFromURL();
  }

  Future<SchoolClassSwagger> _getFromURL() async {
    final response = await client.get(
      mainUrl+"/v1/Class",
      headers: {
        "Accept": "application/json",
        "content-type": "application/json",
        'Authorization':"Bearer ${appUser.data.token}"
      },
    );
    print("RemoteSchoolClassDataSourceImpl${response.statusCode}");
    if(response.statusCode == 200){
      var swagger = SchoolClassSwagger.fromJson(json.decode(response.body));
      print("RemoteSchoolClassDataSourceImpl ${swagger.statusCode}");
      return swagger;
    } else{
      throw ServerException();
    }

}

}
