import 'dart:convert';
import 'package:fai_kul/core/constants.dart';
import 'package:fai_kul/feature/attendance/attendance_method.dart';

Future<bool> postSchoolLeaveLetter(
    String name,
    String phone,
    String address,
    String relation,
    int dayNumber,
    int dow,
    String fDay,
    String tDay,
    String reason,
    String dateCreate,
    int id,
    ) async {
  var body = jsonEncode( {
    "id": 0,
    "fullName": name,
    "phoneNumber": phone,
    "address": address,
    "relation": relation,
    "dayNumber": dayNumber,
    "dayOfWeek": dow,
    "fromDate": fDay,
    "toDate": tDay,
    "reason": reason,
    "dateCreated": dateCreate,
    "status": 0,
    "employeeId": id
  });

  final response = await client.post(
      '$mainUrl/v1/SchoolLeaveLetter',
      headers: {
        "Accept": "application/json",
        "content-type": "application/json",
      },
      body: body).timeout(Duration(seconds: 15));
  print("postSchoolLeaveLetter ${response.statusCode}");
  print("postSchoolLeaveLetter ${response.body.toString()}");
  if(response.statusCode == 201){
    return true;
  } else{
    return false;
  }
}