import 'package:dartz/dartz.dart';
import 'package:fai_kul/core/error/failures.dart';
import 'package:fai_kul/core/usecase/usecase.dart';
import 'package:fai_kul/feature/dayoff/school_leave_list/domain/entities/school_leave_list_swagger.dart';
import 'package:fai_kul/feature/dayoff/school_leave_list/domain/repositories/school_leave_list_repo.dart';

class GetSchoolLeaveList implements UseCase<SchoolLeaveListSwagger, NoParams>{
  final SchoolLeaveListRepo repo;

  GetSchoolLeaveList(this.repo);
  @override
  Future<Either<Failure, SchoolLeaveListSwagger>> call(NoParams params) async {
    return await repo.getSchoolLeaveList();
  }

}