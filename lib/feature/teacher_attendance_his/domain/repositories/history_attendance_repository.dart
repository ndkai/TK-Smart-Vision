import 'package:dartz/dartz.dart';
import 'package:fai_kul/core/error/failures.dart';
import 'package:fai_kul/feature/attendance_his/data/models/attendance_history_swagger.dart';
import 'package:fai_kul/feature/teacher_attendance_his/data/models/attendance_history_swagger.dart';

abstract class TAttendanceHistoryRepository{
  Future<Either<Failure, TAttendanceHistorySwagger>> geAttendanceHistory();
  Future<Either<Failure,TAttendanceHistorySwagger>> geAttendanceHistoryByPage(int pageNumber);
  Future<Either<Failure, TAttendanceHistorySwagger>> getLocalAttendanceHis();
}