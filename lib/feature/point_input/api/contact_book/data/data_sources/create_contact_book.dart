import 'dart:convert';

import 'package:fai_kul/core/constants.dart';
import 'package:fai_kul/feature/attendance/attendance_method.dart';
import 'package:fai_kul/main.dart';
import 'package:flutter/material.dart';

Future<bool> createContactBook(int week, int semester, String comment) async {
  var body = jsonEncode(
      {
        "id": 0,
        "week": week,
        "employeeId": appUser.data.parent == null? appUser.data.teacher.id: appUser.data.parent.id,
        "semesterId": semester,
        "comment": comment
      }
  );
  var response = await client.post(
    "$mainUrl/v1/ContactBook",
    body: body,
    headers: {
      "Accept": "application/json",
      "content-type": "application/json",
      'Authorization':"Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9lbWFpbGFkZHJlc3MiOiJzdHJpbmciLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9naXZlbm5hbWUiOiJUcsaw4budbmcgVEhDUyBUcuG6p24gUXXhu5FjIFRv4bqjbiIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvcm9sZSI6IlRIQ1MtVFFUIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvbmFtZSI6InRoY3N0cXQiLCJleHAiOjE2MDg5NTYxMjcsImlzcyI6Imh0dHBzOi8vdGl0a3VsLnZuIiwiYXVkIjoiaHR0cHM6Ly90aXRrdWwudm4ifQ.F4nsVqVBHnK9IqF6DINo3IU0X6tXA02DDNVzUlmrVSo"
    },
  );
  print("createContactBook ${response.statusCode}");
  if(response.statusCode == 201){
    return true;
  }
  return false;

}
