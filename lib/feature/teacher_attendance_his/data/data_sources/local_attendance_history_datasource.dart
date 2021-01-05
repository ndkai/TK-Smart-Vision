import 'dart:convert';
import 'package:fai_kul/core/error/exceptions.dart';
import 'package:fai_kul/feature/attendance_his/data/models/attendance_history_swagger.dart';
import 'package:fai_kul/feature/teacher_attendance_his/data/models/attendance_history_swagger.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalTAttendanceHistoryDataSource{
    Future<TAttendanceHistorySwagger> getLocalAttendanceHistory();

    Future<void> saveAttendanceHistory(TAttendanceHistorySwagger data);
}

const  LOCAL_ATTENDANCE_HISTORY = "LOCAL_ATTENDANCE_HISTORY";
class LocalTAttendanceHistoryDataSourceIml extends LocalTAttendanceHistoryDataSource{
  final SharedPreferences sharedPreferences;

  LocalTAttendanceHistoryDataSourceIml({this.sharedPreferences});
  
  @override
  Future<TAttendanceHistorySwagger> getLocalAttendanceHistory() {
    final jsonString = sharedPreferences.getString(LOCAL_ATTENDANCE_HISTORY);
    if(jsonString!= null && jsonString != ''){
      var temp = TAttendanceHistorySwagger.fromJson((json.decode(jsonString)));
       return Future.value(temp);
    } else{
      throw CacheException();
    }
  }

  @override
  Future<void> saveAttendanceHistory(TAttendanceHistorySwagger data) {
    return sharedPreferences.setString(LOCAL_ATTENDANCE_HISTORY, json.encode(data.toJson()));
  }

}
