import 'dart:convert';

import 'package:fai_kul/core/constants.dart';
import 'package:fai_kul/core/error/exceptions.dart';
import 'package:fai_kul/feature/attendance_his/data/data_sources/remote_attendance_history_datasource.dart';
import 'package:fai_kul/feature/login/data/data_sources/login_response-data_source.dart';
import 'package:fai_kul/feature/login/data/models/pricipal_login_swagger.dart';
import 'package:fai_kul/feature/manger_feature/statictis/domain/entities/StatisticResponse.dart';
import 'package:fai_kul/main.dart';
import 'package:http/http.dart' as http;

abstract class RemoteStatisticDatasource {
  Future<StatisticResponseSwaggger> getStatistic();
}

class RemoteStatisticDatasourceIpml implements RemoteStatisticDatasource {
  final http.Client client;

  RemoteStatisticDatasourceIpml({this.client});



  Future<StatisticResponseSwaggger> _getFromUrl() async {
    DateTime now = DateTime.now();
    now = now.add(Duration(days: 1)) ;
    DateTime previousweek = now.add(Duration(
      days: - 6
    ));
    final response = await client.get(
        '$mainUrl/v1/Statistic/AllOverviewByRoleName?FromDate=${previousweek.year}-${previousweek.month}-${previousweek.day}&ToDate=${now.year}-${now.month}-${now.day}&roleName=${appUser.data.roleName}',
        headers: {
          "Accept": "application/json",
          "content-type": "application/json",
          'Authorization': 'Bearer ${appUser.data.token}',
          // k co header la failed 415
        });

    print("RemoteStatisticDatasourceIpml  ${response.statusCode}");
    if (response.statusCode == 200) {
      print("RemoteStatisticDatasourceIpml: ${response.body}");
      var swagger =
      StatisticResponseSwaggger.fromJson(json.decode((response.body)));
      print("RemoteStatisticDatasourceIpml: ${swagger.data.items.length}");
      return swagger;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<StatisticResponseSwaggger> getStatistic() {
    // TODO: implement getStatistic
    return _getFromUrl();
  }


}
