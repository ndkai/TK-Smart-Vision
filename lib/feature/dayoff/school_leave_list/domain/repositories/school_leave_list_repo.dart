import 'package:dartz/dartz.dart';
import 'package:fai_kul/core/error/failures.dart';
import 'package:fai_kul/feature/dayoff/school_leave_list/domain/entities/school_leave_list_swagger.dart';

abstract class SchoolLeaveListRepo{
  Future<Either<Failure, SchoolLeaveListSwagger>> getSchoolLeaveList();
}