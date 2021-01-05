import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'package:fai_kul/core/constants.dart';
import 'package:fai_kul/core/error/exceptions.dart';
import 'package:fai_kul/feature/attendance_his/data/data_sources/remote_attendance_history_datasource.dart';
import 'package:fai_kul/feature/login/data/models/login_swagger.dart';
import 'package:fai_kul/feature/login/domain/entities/login_response.dart';
import 'package:fai_kul/feature/tuition_fee/domain/entities/FeeId.dart';
import 'package:fai_kul/feature/tuition_fee/domain/entities/FeeSwagger.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class RemoteFeeDataSource{
  Future<List<FeeSwagger>> getStudentFee();
}

class RemoteFeeDataSourceImpl implements RemoteFeeDataSource{
  final http.Client client;

  RemoteFeeDataSourceImpl({this.client});

  @override
  Future<List<FeeSwagger>> getStudentFee() {
    return _getURL();
  }

  Future<List<FeeSwagger>> _getURL() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final loginResponce = prefs.getString(SAVE_LOGIN_RESPONSE);
    if(loginResponce != null && loginResponce != '') {
      LoginSwagger lr = LoginSwagger.fromJson(json.decode(loginResponce));
      final response = await client
          .get('$mainUrl/v1/Tuition/Fill',
          headers: {
            "Accept": "application/json",
            "content-type": "application/json",
            'Authorization': 'Bearer ${lr.data.token}', // k co header la failed 415
          });
      print("Fee_getURL: ${response.statusCode}");
      if (response.statusCode == 200) {
        print("Fee_getURL: ${response.body}");
        var feeId =
        FeeID.fromJson(json.decode((response.body)));
        print("Fee_getURLasas${feeId.data.length}");
        List<FeeSwagger> feeSwaggers = List<FeeSwagger>();
        for(var item in feeId.data){
          var response1 = await client
              .get('$mainUrl/v1/TuitionPayment/Fill?TuitionId=${item.id}',
              headers: {
                "Accept": "application/json",
                "content-type": "application/json",
                'Authorization': 'Bearer ${lr.data.token}', // k co header la failed 415
              });
          if(response1.statusCode == 200){
            var feeSwagger =
            FeeSwagger.fromJson(json.decode((response1.body)));
            feeSwaggers.add(feeSwagger);

          }

        }
        return feeSwaggers;
      } else {
        throw ServerException();
      }
    }
  }

}