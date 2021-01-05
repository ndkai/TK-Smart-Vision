import 'dart:convert';

import 'package:fai_kul/core/constants.dart';
import 'package:fai_kul/core/error/exceptions.dart';
import 'package:fai_kul/feature/attendance/attendance_method.dart';
import 'package:fai_kul/feature/point_input/api/contact_book/domain/entities/ContactBookSwagger.dart';
import 'package:http/http.dart' as http;

abstract class RemoteContactbookDataSource{
  Future<ContactBookSwagger> getRemoteContactbook(int id);
}

class RemoteContactbookDataSourceImpl implements RemoteContactbookDataSource{
  final http.Client client;

  RemoteContactbookDataSourceImpl({this.client});
  @override
  Future<ContactBookSwagger> getRemoteContactbook(int id) {
    // TODO: implement getRemoteContactbook
    return _getFromURL(id);
  }

  Future<ContactBookSwagger> _getFromURL(int id) async {
    final response = await client.get(
      mainUrl+"/v1/ContactBook/Fill?EmployeeId=${id}",
      headers: {
        "Accept": "application/json",
        "content-type": "application/json",
        'Authorization':"Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9lbWFpbGFkZHJlc3MiOiJzdHJpbmciLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9naXZlbm5hbWUiOiJUcsaw4budbmcgVEhDUyBUcuG6p24gUXXhu5FjIFRv4bqjbiIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvcm9sZSI6IlRIQ1MtVFFUIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvbmFtZSI6InRoY3N0cXQiLCJleHAiOjE2MDg5NTYxMjcsImlzcyI6Imh0dHBzOi8vdGl0a3VsLnZuIiwiYXVkIjoiaHR0cHM6Ly90aXRrdWwudm4ifQ.F4nsVqVBHnK9IqF6DINo3IU0X6tXA02DDNVzUlmrVSo"
      },
    );
    print("RemoteSchoolClassDataSourceImpl${response.statusCode}");
    if(response.statusCode == 200){
      var swagger = ContactBookSwagger.fromJson(json.decode(response.body));
      print("RemoteContactbookDataSourceImpl ${swagger.statusCode}");
      return swagger;
    } else{
      throw ServerException();
    }

  }
  
}