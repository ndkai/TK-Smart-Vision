import 'package:dartz/dartz.dart';
import 'package:fai_kul/core/error/failures.dart';
import 'package:fai_kul/core/usecase/usecase.dart';
import 'package:fai_kul/feature/attendance_his/data/models/attendance_history_swagger.dart';
import 'package:fai_kul/feature/attendance_his/domain/repositories/history_attendance_repository.dart';
import 'package:fai_kul/feature/teacher_attendance_his/data/models/attendance_history_swagger.dart';
import 'package:fai_kul/feature/teacher_attendance_his/domain/repositories/history_attendance_repository.dart';

class GetLocalTAttendanceHis implements UseCase<TAttendanceHistorySwagger, NoParams>{
  final TAttendanceHistoryRepository repository;

  GetLocalTAttendanceHis(this.repository);

  @override
  Future<Either<Failure, TAttendanceHistorySwagger>> call(NoParams params) async {
    // TODO: implement call
    return await repository.getLocalAttendanceHis();
  }
}
